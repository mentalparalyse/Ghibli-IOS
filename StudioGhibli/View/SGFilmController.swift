//
//  ViewController.swift
//  StudioGhibli
//
//  Created by Lex Sava on 9/23/18.
//  Copyright © 2018 Lex Sava. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

final class SGFilmController: UIViewController {

    private let disposeBag = DisposeBag()
    public var filmsArr = Variable([FilmModel]())
    
    
    private lazy var filmsTableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        tv.estimatedRowHeight = 80
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(filmsTableView)
        self.view.backgroundColor = .white
        
        registerCell()
        
        pinTableView()
        
        getFilms()
        
        bind()
    }

}
//MARK:- Consrtaints
extension SGFilmController{
    private func pinTableView(){
        NSLayoutConstraint(item: filmsTableView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: filmsTableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: filmsTableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: filmsTableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
    }
}

//MARK:- Registration
extension SGFilmController{
    private func registerCell(){
        filmsTableView.register(UINib(nibName: FilmCell.cellID, bundle: nil), forCellReuseIdentifier: FilmCell.cellID)
    }
    
}

//MARK:- Binding
extension SGFilmController{
    
    private func bind(){
        let cell = FilmCell.self
        
        filmsArr.asObservable().bind(to: filmsTableView.rx.items(cellIdentifier: "FilmCell", cellType: cell)) { (row, filmModel, cell) in
            cell.film = filmModel
        }.disposed(by: disposeBag)
        
    }
    
    
}



//MARK:- Getting result here
extension SGFilmController{
    
    private func getFilms(){
        let list = GhibliAPI.getFilms()
        
        list.subscribe(onNext: { (films) in
          self.filmsArr.value = films
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("completed")
        }).disposed(by: disposeBag)
        
    }
}


