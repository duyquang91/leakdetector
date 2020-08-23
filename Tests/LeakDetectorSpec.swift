//
//  LeakDetectorSpec.swift
//  LeakDetector
//
//  Created by Steve Dao on 01/04/19.
//  Copyright © 2019 duyquang91. All rights reserved.
//

import Quick
import Nimble
@testable import LeakDetector

class LeakDetectorSpec: QuickSpec {
    override func spec() {
        describe("LeakDetectorSpec") {
            it("works") {
                expect(LeakDetector.name) == "LeakDetector"
            }
        }
    }
}
