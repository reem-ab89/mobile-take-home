//
//  CharacterDetailsViewController.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    var characterID: String?
    
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var charactarSpecies: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var characterOrigin: UILabel!
    @IBOutlet weak var characterLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacterDetails()
    }
    
    fileprivate func getCharacterDetails() {
        let endpoint  = "https://rickandmortyapi.com/api/character/\(characterID ?? "1")"
        guard let url = URL(string: endpoint) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            
            do {
                let singleCharacter = try JSONDecoder().decode(SingleCharacter.self, from: data)
                print(singleCharacter)
                
                DispatchQueue.main.sync { [ weak self] in
                    self?.characterImage?.imageFromServerURL(urlString: "\(singleCharacter.image)", PlaceHolderImage: UIImage.init(named: "noPhoto")!)
                    self?.characterName.text     = singleCharacter.name
                    self?.characterStatus.text   = singleCharacter.status
                    self?.charactarSpecies.text  = singleCharacter.species
                    self?.characterGender.text   = singleCharacter.gender
                    self?.characterOrigin.text   = singleCharacter.origin.name
                    self?.characterLocation.text = singleCharacter.location.name
                }
            } catch let jsonError {
                print("Error Serializing JSON:", jsonError)
            }
            
            }.resume()
    }
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}



