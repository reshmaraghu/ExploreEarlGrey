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

	func testSignInSuccess() {
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("sign_in_button")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("password_textField")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("password_textField")).perform(grey_tap())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("password_textField")).perform(grey_typeText("Password1"))
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("sign_in_button")).perform(grey_tap())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("doc_listing_screen")).assert(with: grey_sufficientlyVisible())
	}

	func testSignInFailure() {
		let signInButton = EarlGrey.select(elementWithMatcher: grey_accessibilityID("sign_in_button"))
		signInButton.assert(with: grey_sufficientlyVisible())
		signInButton.perform(grey_tap())
		let alert = EarlGrey.select(elementWithMatcher: grey_accessibilityID("invalid_password_alert"))
		alert.assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_text("Ok")).perform(grey_tap())
		alert.assert(with: grey_notVisible())
	}
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
