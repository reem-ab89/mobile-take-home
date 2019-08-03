//
//  EpisodesViewController.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController, UITableViewDelegate {
    
    var dataSource = EpisodesDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getEpisodes()
    }
    
    private func setupTableView() {
        tableView.dataSource     = dataSource
        tableView.separatorColor = UIColor.clear
    }
    
    private func getEpisodes() {
        DispatchQueue.main.async { [ weak self ] in
            APIManager.sharedInstance.getData(serviceIdentifier: APIManager.ServiceIdentifiers.getEpisodes, completion: { (result, url) in
                self?.dataSource.responseArray = (result) as! [EpisodesDataSource.JSONDictionary]
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }, onError: { [ weak self ] (error, url) in
                Alert.showBasic(title: "Error!", message: "Something went wrong, please try again later.", vc: self!)
            })
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let episodeDetailsVC = storyboard.instantiateViewController(withIdentifier: "charactersViewController") as! CharactersViewController
        
        if let cell = tableView.cellForRow(at: indexPath) as? EpisodesCell {
            episodeDetailsVC.episodeID = cell.episodeID.text
        }
        present(episodeDetailsVC, animated: true, completion: nil)
    }
}

