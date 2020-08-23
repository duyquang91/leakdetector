//
//  DelegateViewController.swift
//  LeakDetectorDemo
//
//  Created by Steve Dao on 23/8/20.
//  Copyright © 2020 Steve Dao. All rights reserved.
//

import UIKit
import LeakDetector

protocol LeakDelegate: class {
    var viewController: UIViewController { get }
}

class LeakDelegateImpl: LeakDelegate {
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // Expecting view controller will be dismissed a long with deallocation
    deinit {
        LeakDetector.instance.expectViewControllerDisappear(viewController: viewController)
    }
}

class DelegateViewController: UIViewController {
        
//    weak var delegate: LeakDelegate!
    var delegate: LeakDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        
    }
    
    // Expecting DelegateViewController & LeakDelegate should be deallocated after poping from Navigation controller
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent || isBeingDismissed {
            LeakDetector.instance.expectDeallocate(object: delegate)
        }
    }
}

extension DelegateViewController: LeakDelegate {
    var viewController: UIViewController {
        self
    }
}
