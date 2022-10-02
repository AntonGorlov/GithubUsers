//
//  IGithubSearchAPIEndpointsBuilder.swift
//  
//
//  Created by Anton Gorlov on 02.10.2022.
//

import Foundation

/// <#Description#>
public protocol IGithubSearchAPIEndpointsBuilder {
    
    var getSearchRepositoriesWithSortAndStars: URL { get }
}
