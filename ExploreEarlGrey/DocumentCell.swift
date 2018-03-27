//
//  DocumentCell.swift
//  ExploreEarlGrey
//
//  Created by Raghu, Reshma L on 3/26/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit

class DocumentCell: UITableViewCell {
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var modifiedDate: UILabel!
	@IBOutlet weak var createdDate: UILabel!
	@IBOutlet weak var docImage: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
}
