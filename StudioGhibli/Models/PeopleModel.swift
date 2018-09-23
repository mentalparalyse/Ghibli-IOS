//
//  PeopleModel.swift
//  StudioGhibli
//
//  Created by Lex Sava on 9/23/18.
//  Copyright © 2018 Lex Sava. All rights reserved.
//

import UIKit
import ObjectMapper


/*
"id": "ba924631-068e-4436-b6de-f3283fa848f0",
"name": "Ashitaka",
"gender": "male",
"age": "late teens",
"eye_color": "brown",
"hair_color": "brown",
"films": [
"https://ghibliapi.herokuapp.com/films/030555b3-4c92-4fce-93fb-e70c3ae3df8b"
],
"species": "https://ghibliapi.herokuapp.com/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2",
"url": "https://ghibliapi.herokuapp.com/people/ba924631-068e-4436-b6de-f3283fa848f0"
*/


final class PeopleModel: Mappable{
    
    public var id: String = ""
    public var name: String = ""
    public var gender: String = ""
    public var age: String = ""
    public var eye_color: String = ""
    public var hair_color: String = ""
    public var films: [String] = []
    public var species: String = ""
    public var url: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.gender <- map["gender"]
        self.age <- map["age"]
        self.eye_color <- map["eye_color"]
        self.hair_color <- map["hair_color"]
        self.films <- map["films"]
        self.species <- map["species"]
        self.url <- map["url"]
    }
}


