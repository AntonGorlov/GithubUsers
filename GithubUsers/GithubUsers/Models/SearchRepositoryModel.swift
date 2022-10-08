//
//  SearchRepositoryModel.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 05.10.2022.
//

import Foundation

/// This model for an UI layer
struct SearchRepositoryModel: Equatable {
    
    let name: String
    let login: String
    let language: String
    let stars: Int
    let imageURL: String
    let userURL: String
}
