//
//  TrackerView.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit
import LifetimeTracker

class TrackerView: UIView, LifetimeTrackable {
    
    class var lifetimeConfiguration: LifetimeConfiguration {
        return LifetimeConfiguration(maxCount: 1, groupName: "VC")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLifetime()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        trackLifetime()
    }
    
}
