//
//  TimeCapsuleEntry.swift
//  Nope-ioids
//
//  Created by Rachit Kataria on 3/31/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import Foundation

class TimeCapsuleEntry {
    var whoInput: String
    var whatInput: String
    var whereInput: String
    var whenInput: String
    var whyInput: String
    
    init(whoVal: String, whatVal: String, whereVal: String, whenVal: String, whyVal: String) {
        whoInput = whoVal
        whatInput = whatVal
        whereInput = whereVal
        whenInput = whenVal
        whyInput = whyVal
    }
}
