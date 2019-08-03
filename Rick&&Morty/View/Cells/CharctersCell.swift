//
//  CharctersCell.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//


import UIKit

class CharctersCell: UITableViewCell {
    
    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterIdLabel: UILabel!
    @IBOutlet weak var characterStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        characterView.implementViewStyle()
        
    }
    
}

