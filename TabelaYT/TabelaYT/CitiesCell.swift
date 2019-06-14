//
//  CitiesCell.swift
//  TabelaYT
//
//  Created by Piotr_Brus on 13/06/2019.
//  Copyright © 2019 Piotr_Brus. All rights reserved.
//

import UIKit

class CitiesCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
