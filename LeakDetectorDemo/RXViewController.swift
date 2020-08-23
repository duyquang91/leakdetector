//
//  RXViewController.swift
//  LeakDetectorDemo
//
//  Created by Steve Dao on 23/8/20.
//  Copyright © 2020 Steve Dao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import LeakDetector

class RXViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let leakRelay = PublishRelay<Bool>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leakRelay.asSignal()
            .emit(onNext: { _ in
                self.view.tag = 111
            })
            .disposed(by: disposeBag)

//        // Capture `self` as weak to avoid retain cycle
//        leakRelay.asSignal()
//            .emit(onNext: { [weak self] _ in
//                self?.view.tag = 111
//            })
//            .disposed(by: disposeBag)
    }
    
    // Expecting DelegateViewController & LeakDelegate should be deallocated after poping from Navigation controller
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent || isBeingDismissed {
            LeakDetector.instance.expectDeallocate(object: leakRelay)
        }
    }
    
}
