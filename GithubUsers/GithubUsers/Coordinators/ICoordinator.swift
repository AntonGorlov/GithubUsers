//
//  ICoordinator.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 01.10.2022.
//

import Foundation

/// Contract of describing mediator wich manages view controllers presentation flow
protocol ICoordinator {
    
    /// Starts of flow and presents initial flow view contorller
    func start()
}
