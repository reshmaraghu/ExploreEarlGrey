//
//  ViewController.swift
//  ExploreEarlGrey
//
//  Created by Raghu, Reshma L on 3/26/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
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
		let document1 = Document(name: "Retail Sales", modifiedDate: "Last modified: 18/03/18", creationDate: "Created on: 02/01/18")
		documents.append(document1)
		return documents
	}
}


