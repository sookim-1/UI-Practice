//
//  TrackerViewController.swift
//  DemoApp
//
//  Created by 수킴 on 2023/03/05.
//

import UIKit
import LifetimeTracker

class TrackerViewController: UIViewController, LifetimeTrackable {
    
    class var lifetimeConfiguration: LifetimeConfiguration {
        return LifetimeConfiguration(maxCount: 1, groupName: "VC")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        trackLifetime()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        trackLifetime()
    }
    
}
