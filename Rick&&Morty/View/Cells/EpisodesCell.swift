//
//  EpisodesCell.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//



import UIKit

class EpisodesCell: UITableViewCell {
    
    @IBOutlet weak var episodeView: UIView!
    @IBOutlet weak var episodeID: UILabel!
    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    
    override func awakeFromNib() {
        episodeView.implementViewStyle()
    }
    
}
