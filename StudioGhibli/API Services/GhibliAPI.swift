//
//  GhibliAPI.swift
//  StudioGhibli
//
//  Created by Lex Sava on 9/23/18.
//  Copyright © 2018 Lex Sava. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Alamofire
import ObjectMapper


final class GhibliAPI{
    
    typealias PeopleResponse = Observable<[PeopleModel]>
    typealias FilmResponse = Observable<[FilmModel]>
    typealias LocationResponse = Observable<[LocationModel]>
    
    class func getLocations() -> LocationResponse{
        return Observable.create({ (observer) -> Disposable in
            let request = Alamofire.request(NetworkAccess.locationsUrl!).responseJSON(completionHandler: { (responseData) in
                switch responseData.result{
                case .success(let json):
                    let responseObject = Mapper<LocationModel>().mapArray(JSONObject: json)
                    if let statusCode = responseData.response?.statusCode, statusCode == 200{
                        observer.onNext(responseObject!)
                        observer.onCompleted()
                    }else{
                        observer.onError(NSError(domain: "\(NetworkAccess.locationsUrl!)", code: -1))
                    }
                    break
                case .failure(let error):
                    observer.onError(error)
                    break
                    
                }
            })
            return Disposables.create {
                request.cancel()
            }
        })
    }
    
    
    class func getFilms() -> FilmResponse{
        return Observable.create({ (observer) -> Disposable in
            let request = Alamofire.request(NetworkAccess.filmsUrl!).responseJSON(completionHandler: { (responseData) in
                switch responseData.result{
                case .success(let json):
                    let response = Mapper<FilmModel>().mapArray(JSONObject: json)
                    
                    if let statusCode = responseData.response?.statusCode, statusCode == 200{
                        observer.onNext(response ?? [])
                        observer.onCompleted()
                    }else{
                        print("Something went wrong please check it and try again")
                        observer.onError(NSError(domain: "film", code: -1))
                    }
                    
                    break
                case .failure(let error):
                    print("shish take a look here")
                    observer.onError(error)
                    break
                }
            })
            return Disposables.create{
                request.cancel()
            }
        })
    }
    
    
    class func getPeople() -> PeopleResponse{
        return Observable.create({ (observer) -> Disposable in
            let request =  Alamofire.request(NetworkAccess.peopleUrl!).responseJSON(completionHandler: { (responseData) in
                switch responseData.result{
                case .success(let json):
                    let response = Mapper<PeopleModel>().mapArray(JSONObject: json)
                    
                    if let statusCode = responseData.response?.statusCode, statusCode == 200{
                        observer.onNext(response ?? [])
                        observer.onCompleted()
                    }else{
                        print("Something went wrong with result please check it and try again later")
                        observer.onError(NSError(domain: "main", code: -1))
                    }
                    break
                case .failure(let error):
                    print("something went wrong check it")
                    observer.onError(error)
                    break
                }
            })
            
            return Disposables.create{
                request.cancel()
            }
        })
    }
}
