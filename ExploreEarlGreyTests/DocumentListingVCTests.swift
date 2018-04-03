//
//  DocumentListingVCTests.swift
//  ExploreEarlGreyTests
//
//  Created by Raghu, Reshma L on 3/29/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import XCTest
import EarlGrey
@testable import ExploreEarlGrey

class DocumentListingVCTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		GREYConfiguration.sharedInstance().setValue(false, forConfigKey: kGREYConfigKeyAnalyticsEnabled)
		GREYConfiguration.sharedInstance().setValue(60, forConfigKey: kGREYConfigKeyInteractionTimeoutDuration)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testTapOnDocument() {
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("sign_in_button")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("password_textField")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("password_textField")).perform(grey_tap())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("password_textField")).perform(grey_typeText("Password1"))
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("sign_in_button")).perform(grey_tap())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("doc_list_view")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("document_cell_1")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("document_cell_1")).perform(grey_tap())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("page_view")).assert(with: grey_sufficientlyVisible())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("page_view")).assert(with: grey_interactable())
		EarlGrey.select(elementWithMatcher: grey_accessibilityID("page_view")).perform(grey_javaScriptExecution(self.jsClickOnElementWithID(ID: "myLegend"), nil))
	}
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

	private func jsClickOnElementWithID(ID: String) -> String {
		return "document.getElementById('myLegend').click()"
	}
    
}
