//
//  ExploreEarlGreyTests.swift
//  ExploreEarlGreyTests
//
//  Created by Raghu, Reshma L on 3/26/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import XCTest
import EarlGrey
@testable import ExploreEarlGrey

class ExploreEarlGreyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		GREYConfiguration.sharedInstance().setValue(false, forConfigKey: kGREYConfigKeyAnalyticsEnabled)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWelcomeScreen() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("sign_in_button")).assert(with: grey_sufficientlyVisible())
	}

	func testSignIn() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("sign_in_button")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("sign_in_button")).perform(grey_tap())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("doc_listing_screen")).assert(with: grey_sufficientlyVisible())
	}
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
