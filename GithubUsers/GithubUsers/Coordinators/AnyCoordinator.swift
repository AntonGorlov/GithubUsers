//
//  AnyCoordinator.swift
//  GithubUsers
//
//  Created by Anton Gorlov on 01.10.2022.
//

import Foundation

class AnyCoordinator: ICoordinator, Hashable {
    
    weak var parent: AnyCoordinator?
    
    var childs: [AnyCoordinator] = []
    
    func start() {
        
        assertionFailure(SUBCLASSES_IMPLEMENTATION_REQUIRED)
    }
    
    func finish() {
        
        self.parent?.childs.removeAll(where: { $0 == self })
    }
    
    func coordinate(to coordinator: AnyCoordinator) {
        
        // Protection against duplication
        childs.removeAll(where: { $0 == coordinator })
        
        childs.append(coordinator)
        
        coordinator.parent = self
        
        coordinator.start()
    }
    
    func hash(into hasher: inout Hasher) {
        
        hasher.combine(Mirror(reflecting: self).description)
    }
    
    static func == (lhs: AnyCoordinator, rhs: AnyCoordinator) -> Bool {
        
        lhs.hashValue == rhs.hashValue
    }
}
