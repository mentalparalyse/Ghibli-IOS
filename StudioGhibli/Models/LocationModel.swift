//
//  LocationModel.swift
//  StudioGhibli
//
//  Created by Lex Sava on 9/23/18.
//  Copyright © 2018 Lex Sava. All rights reserved.
//

import UIKit
import ObjectMapper


/*{
    "id": "11014596-71b0-4b3e-b8c0-1c4b15f28b9a",
    "name": "Irontown",
    "climate": "Continental",
    "terrain": "Mountain",
    "surface_water": "40",
    "residents": [
    "https://ghibliapi.herokuapp.com/people/ba924631-068e-4436-b6de-f3283fa848f0",
    "https://ghibliapi.herokuapp.com/people/030555b3-4c92-4fce-93fb-e70c3ae3df8b"
    ],
    "films": [
    "https://ghibliapi.herokuapp.com/films/0440483e-ca0e-4120-8c50-4c8cd9b965d6"
    ],
    "url": [
    "https://ghibliapi.herokuapp.com/locations/11014596-71b0-4b3e-b8c0-1c4b15f28b9a"
    ]
}*/



final class LocationModel: Mappable{
    
    public var id: String = ""
    public var name: String = ""
    public var climate: String = ""
    public var terrain: String = ""
    public var surface_water: String = ""
    public var residents: [String] = []
    public var films: [String] = []
    public var url: [String] = []
    
    required init?(map: Map) {
        
    }
    
    
    internal func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.climate <- map["climate"]
        self.terrain <- map["terrain"]
        self.surface_water <- map["surface_water"]
        self.residents <- map["residents"]
        self.films <- map["films"]
        self.url <- map["url"]
    }
}
