//
//  PageVC.swift
//  ExploreEarlGrey
//
//  Created by Raghu, Reshma L on 3/27/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit
import WebKit

class PageVC: UIViewController, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler, UIGestureRecognizerDelegate {

	var webView: WKWebView!

	override func loadView() {

		let webConfiguration = WKWebViewConfiguration()
		let controller = WKUserContentController()
		controller.add(self, name: "PageVC")
		webConfiguration.userContentController = controller
		webView = WKWebView(frame: .zero, configuration: webConfiguration)
		webView.uiDelegate = self
		webView.navigationDelegate = self
		webView.accessibilityIdentifier = "page_view"
		view = webView
	}

	override func viewDidLoad() {
		let filePath = Bundle.main.path(forResource: "index", ofType: "html")
		let fileUrl = URL(fileURLWithPath: filePath!)
		webView.loadFileURL(fileUrl, allowingReadAccessTo: fileUrl)

	}

	func webViewDidClose(_ webView: WKWebView) {
		print("➡️ webViewDidClose")
	}

	func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
		print("➡️ didReceive message name: \(message.name)")
		print("➡️ didReceive message body: \(message.body)")
		let javascript = "set_vizName(\"Got your message!\");"
		webView.evaluateJavaScript(javascript, completionHandler: nil)
	}
}
