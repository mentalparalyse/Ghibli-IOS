//
//  FilmCell.swift
//  StudioGhibli
//
//  Created by Lex Sava on 9/23/18.
//  Copyright © 2018 Lex Sava. All rights reserved.
//

import UIKit

final class FilmCell: UITableViewCell {

    public static let cellID = "FilmCell"
    
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    public var film: FilmModel? {
        didSet{
            guard let film = film else {
                return
            }
            self.descriptionLabel.text = film.description
            self.titleLabel.text = film.title
        }
    }
    
}
