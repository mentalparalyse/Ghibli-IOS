//
//  SGTabBarController.swift
//  StudioGhibli
//
//  Created by Lex Sava on 9/23/18.
//  Copyright © 2018 Lex Sava. All rights reserved.
//

import UIKit

final class SGTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filmsController = SGFilmController()
        let filmsNavigtion = UINavigationController(rootViewController: filmsController)
        filmsController.hidesBottomBarWhenPushed = true
        
        viewControllers = [filmsNavigtion]
    }


}
