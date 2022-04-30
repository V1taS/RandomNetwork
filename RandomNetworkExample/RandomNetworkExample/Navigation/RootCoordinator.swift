//
//  RootCoordinator.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit

final class RootCoordinator: Coordinator {
    
    // MARK: - Private variables
    
    private let window: UIWindow
    private let navigationController = UINavigationController()
    private var mainScreenCoordinator: Coordinator?
    
    
    // MARK: - Initialization
    
    /// - Parameter window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Internal func
    
    func start() {
        let mainScreenCoordinator: Coordinator = TestRequestNewsCoordinator(navigationController)
        self.mainScreenCoordinator = mainScreenCoordinator
        mainScreenCoordinator.start()
        
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
    }
}
