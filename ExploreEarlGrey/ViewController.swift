//
//  ViewController.swift
//  ExploreEarlGrey
//
//  Created by Raghu, Reshma L on 3/26/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet public var password: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction public func signInClicked() {
		print("➡️ Sign in clicked")
		if password.text == "Password1" {
			self.performSegue(withIdentifier: "showList", sender: self)
		} else {
			let alertController = UIAlertController(title: "Invalid Password!", message: "Please re-enter the correct password.", preferredStyle: .alert)
			alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
			alertController.view.accessibilityIdentifier = "invalid_password_alert"
			self.present(alertController, animated: true, completion: nil)
		}
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		print("➡️ Preparing for segue: \(String(describing: segue.identifier))")
		if let navController = segue.destination as? UINavigationController {
			if let listingVc = navController.topViewController as? DocumentListingVC {
				listingVc.documents = getAllDocuments()
			}
		}
	}

	private func getAllDocuments() -> [Document] {
		var documents = [Document]()
		let document1 = Document(name: "Retail Sales", modifiedDate: "Last modified: 18/03/18", createdDate: "Created on: 02/02/18")
		let document2 = Document(name: "Dairy Wholesale", modifiedDate: "Last modified: 01/03/18", createdDate: "Created on: 01/01/18")
		let document3 = Document(name: "Product Lines", modifiedDate: "Last modified: 04/03/18", createdDate: "Created on: 18/01/18")
		let document4 = Document(name: "Airline Distribution", modifiedDate: "Last modified: 21/03/18", createdDate: "Created on: 22/11/17")
		documents.append(document1)
		documents.append(document2)
		documents.append(document3)
		documents.append(document4)
		return documents
	}
}


