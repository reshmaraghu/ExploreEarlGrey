//
//  PageVC.swift
//  ExploreEarlGrey
//
//  Created by Raghu, Reshma L on 3/27/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit
import WebKit

class PageVC: UIViewController, WKUIDelegate, WKNavigationDelegate {
	var webView: WKWebView!

	override func loadView() {
		webView = WKWebView()
		webView.uiDelegate = self
		webView.navigationDelegate = self
		view = webView
	}

	override func viewDidLoad() {
		let filePath = Bundle.main.path(forResource: "index", ofType: "html")
		let fileUrl = URL(fileURLWithPath: filePath!)
		webView.loadFileURL(fileUrl, allowingReadAccessTo: fileUrl)
	}
}
