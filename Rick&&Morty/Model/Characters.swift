//
//  Characters.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//
import UIKit

struct CharactersUrls: Decodable {
    let characters: [URL]
}

enum Status : String, Decodable {
    case dead = "Dead", alive = "Alive"
}

struct CharacterInfo: Decodable {
    let id: Int
    let name: String
    let status: Status
}
