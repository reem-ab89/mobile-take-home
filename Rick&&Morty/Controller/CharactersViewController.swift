//
//  CharactersViewController.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController, UITableViewDelegate {
    
    var dataSource = CharactersDataSource()
    var episodeID: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getCharactersUrls()
    }
    
    private func setupTableView() {
        tableView.dataSource     = dataSource
        tableView.separatorColor = UIColor.clear
        tableView.allowsSelectionDuringEditing = false
    }
    
    fileprivate func getCharactersUrls() {
        let endpoint  = "https://rickandmortyapi.com/api/episode/\(episodeID ?? "1")"
        guard let endPointURL = URL(string: endpoint) else { return }
        
        let group = DispatchGroup()
        
        let outertask = URLSession.shared.dataTask(with: endPointURL) { data, response, error in
            guard let data = data else { print(error!); return }
            
            do {
                let charactersUrls = try JSONDecoder().decode(CharactersUrls.self, from: data)
                print("Characters URLS: \(charactersUrls)")
                for infoURL in charactersUrls.characters {
                    group.enter()
                    let innertask = URLSession.shared.dataTask(with: infoURL) { data, response, error in
                        defer{ group.leave() }
                        guard let data = data else { print(error!); return }
                        do {
                            let characterInfo = try JSONDecoder().decode(CharacterInfo.self, from: data)
                            self.dataSource.characterInfos.append(characterInfo)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        } catch {
                            print("Error Getting Info for \(infoURL):", error)
                        }
                    }
                    innertask.resume()
                }
                group.notify(queue: .main) { [ weak self] in
                    print(self?.dataSource.characterInfos as Any)
                }
                
            } catch {
                print("Error Serializing JSON:", error)
            }
        }
        outertask.resume()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let characterDetailsVC = storyboard.instantiateViewController(withIdentifier: "characterDetailsViewController") as! CharacterDetailsViewController
        
        if let cell = tableView.cellForRow(at: indexPath) as? CharctersCell {
            characterDetailsVC.characterID = cell.characterIdLabel.text
        }
        present(characterDetailsVC, animated: true, completion: nil)
    }
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

