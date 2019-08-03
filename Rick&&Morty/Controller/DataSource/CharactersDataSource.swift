//
//  CharactersDataSource.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//

import Foundation
import UIKit

class CharactersDataSource: NSObject, UITableViewDataSource {
    
    var characterInfos = [CharacterInfo]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterInfos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charctersCell", for: indexPath) as! CharctersCell
        cell.selectionStyle = .none
        
        let character = characterInfos[indexPath.row]
        cell.characterIdLabel.text     = String(character.id)
        cell.characterName.text        = character.name
        cell.characterStatusLabel.text = character.status.rawValue
        
        return cell
    }
    
}
