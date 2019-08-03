//
//  SingleCharacter.swift
//  RickandMorty
//
//  Created by Reem Abdalla on 2019-07-30.
//  Copyright © 2019 Reem Abdalla. All rights reserved.
//
struct SingleCharacter: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let origin: Origin
    let location: Location
}

struct Origin: Decodable {
    let name: String
}

struct Location: Decodable {
    let name: String
}
