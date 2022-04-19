//
//  TV_CELL.swift
//  Pagination_project
//
//  Created by Yarkın Gazibaba on 19.04.2022.
//

import UIKit

class TV_CELL: UITableViewCell {

    @IBOutlet weak var lbl_header: UILabel!
    @IBOutlet weak var lbl_description: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
