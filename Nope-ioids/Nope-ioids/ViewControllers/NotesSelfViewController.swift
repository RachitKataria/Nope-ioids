//
//  NotesSelfViewController.swift
//  Nope-ioids
//
//  Created by Kelly Lampotang on 3/31/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit
import AVFoundation

class NotesSelfViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioRecorderDelegate {

    var numberOfAudio = 0
    var selectedAudio = ""
    let defaults = UserDefaults.standard
    var data : [String] = []
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var NotesList: UITableView!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer?

    @IBAction func backButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ProgressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProgressViewController") as! ProgressViewController
        self.show(vc, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = defaults.object(forKey:"AudioArray") as? [String] ?? [String]()
        numberOfAudio = defaults.integer(forKey: "audioNumber")
        NotesList.dataSource = self
        NotesList.delegate = self

        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            print("Couldn't record")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func PlayButtonTest(_ sender: Any) {
        playAudio()
    }
    @IBAction func recordButtonPressed(_ sender: Any) {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NotesListTableViewCell
        let randomData = data[indexPath.row]
        cell.audioLabel.text = randomData
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func loadRecordingUI() {
        recordButton.isEnabled = true
        recordButton.setTitle("Tap to Record", for: .normal)
    }
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("Audio"+String(numberOfAudio)+".m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            recordButton.setTitle("Tap to Stop", for: .normal)
            defaults.set(data, forKey: "AudioArray")
        } catch {
            finishRecording(success: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            data.append("Audio"+String(numberOfAudio)+".m4a")
            defaults.set(data, forKey: "AudioArray")
            numberOfAudio = numberOfAudio + 1
            defaults.set(numberOfAudio, forKey: "audioNumber")
            NotesList.reloadData()
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            print("Yikes!")
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row)")
        selectedAudio = data[indexPath.row]
    }

    func playAudio()
    {
        _ = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000.0,
            AVNumberOfChannelsKey: 1 as NSNumber,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ] as [String : Any]
        
        do {
            let audioFilename = getDocumentsDirectory().appendingPathComponent(selectedAudio)
            let pathString = audioFilename.path
            let audioURL = NSURL(fileURLWithPath: pathString)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL as URL)
                audioPlayer?.play()
            } catch {
                print("yikes")
            }
        }
    }
}
