//
//  DocumentListingVC.swift
//  ExploreEarlGrey
//
//  Created by Raghu, Reshma L on 3/26/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit

class DocumentListingVC: UITableViewController {

	var documents: [Document]?

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let documents = documents {
			return documents.count
		} else {
			return 0
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath) as? DocumentCell {
			// Configure the cell...
			cell.name.text = documents?[indexPath.row].name
			cell.modifiedDate?.text = documents?[indexPath.row].modifiedDate
			cell.createdDate?.text = documents?[indexPath.row].createdDate
			return cell
		} else {
			return UITableViewCell()
		}
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
}
