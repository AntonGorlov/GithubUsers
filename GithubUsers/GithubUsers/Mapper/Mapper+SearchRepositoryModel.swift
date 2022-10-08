//
//  Mapper+SearchRepositoryModel.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 08.10.2022.
//

import Foundation
import BackendAPI

extension Mapper {
    
    func map(_ model: SearchRepositoriesResponseData) -> [SearchRepositoryModel] {
        
        return model.items.map { map($0) }
    }
    
    func map(_ model: [SearchRepositoryResponseData]) -> [SearchRepositoryModel] {
        
        return model.map { Mapper<SearchRepositoryModel>().map($0) }
    }
    
    func map(_ model: SearchRepositoryResponseData) -> SearchRepositoryModel {
        
        let owner = model.owner
        let unknownLanguage = "Unknown language"
        
        return .init(name: model.name,
                     login: owner.login,
                     language: model.language ?? unknownLanguage,
                     stars: model.starsCount,
                     imageURL: owner.imageURL,
                     userURL: owner.userURL)
    }
    
    //Optional value
    
    func map(_ model: SearchRepositoriesResponseData?) -> [SearchRepositoryModel]? {
        
        return model?.items.map { map($0) }
    }
    
    func map(_ model: [SearchRepositoryResponseData]?) -> [SearchRepositoryModel]? {
        
        return model.map { Mapper<SearchRepositoryModel>().map($0) }
    }
    
    
}
