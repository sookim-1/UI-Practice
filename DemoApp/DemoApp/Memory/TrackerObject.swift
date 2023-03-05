//
//  TrackerObject.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import Foundation
import LifetimeTracker

class TrackerObject: NSObject, LifetimeTrackable {
    
    class var lifetimeConfiguration: LifetimeConfiguration {
        return LifetimeConfiguration(maxCount: 1, groupName: "VC")
    }
    
    override init() {
        super.init()
        
        trackLifetime()
    }
    
}
