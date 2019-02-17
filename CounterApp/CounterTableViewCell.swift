//
//  CounterTableViewCell.swift
//  CounterApp
//
//  Created by ivan piskun on 2/17/19.
//  Copyright © 2019 ivan piskun. All rights reserved.
//

import UIKit

class CounterTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
