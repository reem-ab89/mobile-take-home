//
//  EpisodesDataSource.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//
import Foundation
import UIKit

class EpisodesDataSource: NSObject, UITableViewDataSource {
    
    typealias JSONDictionary = [String: Any]
    var responseArray = [JSONDictionary]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodesCell", for: indexPath) as! EpisodesCell
        cell.selectionStyle = .none
        
        let episodes = responseArray[indexPath.row]
        cell.episodeID.text     = String(episodes["id"] as? Int ?? 0)
        cell.episodeTitle.text  = episodes["name"] as? String
        cell.episodeNumber.text = episodes["episode"] as? String
        
        return cell
    }
    
}

