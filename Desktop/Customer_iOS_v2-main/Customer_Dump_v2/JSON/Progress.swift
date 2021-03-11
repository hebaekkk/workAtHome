//
//  Progress.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/03.
//

import Foundation

enum CleanStatus: String, Codable {
    case waiting = "waiting"
    case tobe = "tobe"
    case done = "done"
    case timeover = "timeover"
    
}
