//
//  FilmModel.swift
//  StudioGhibli
//
//  Created by Lex Sava on 9/23/18.
//  Copyright © 2018 Lex Sava. All rights reserved.
//

import UIKit
import ObjectMapper

/*
 "id": "2baf70d1-42bb-4437-b551-e5fed5a87abe",
 "title": "Castle in the Sky",
 "description": "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world.",
 "director": "Hayao Miyazaki",
 "producer": "Isao Takahata",
 "release_date": "1986",
 "rt_score": "95"
*/


final class FilmModel: Mappable{
    public var id: String = ""
    public var title: String = ""
    public var description: String = ""
    public var director: String = ""
    public var producer: String = ""
    public var release_date: String = ""
    public var rt_score: String = ""
    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.description <- map["description"]
        self.director <- map["director"]
        self.producer <- map["producer"]
        self.release_date <- map["release_date"]
        self.rt_score <- map["rt_score"]
    }
}

