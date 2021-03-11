//
//  DeviceInfo.swift
//  Customer_Dump_v2
//
//  Created by BigHand on 2021/03/10.
//

import Foundation
import UIKit

struct DeviceInfo {
    struct Orientation {
        static var isLandscape : Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation ? UIDevice.current.orientation.isLandscape : UIApplication.shared.statusBarOrientation.isLandscape
            }
        }
        
        static var isPortrait: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation ? UIDevice.current.orientation.isPortrait : UIApplication.shared.statusBarOrientation.isPortrait
            }
        }
    }
}

