//
//  RootCoordinator.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit
import RandomNetwork

final class RootCoordinator: Coordinator {
    
    // MARK: - Private variables
    
    private let window: UIWindow
    private let navigationController = UINavigationController()
    private var mainScreenCoordinator: Coordinator?
    private let networkRequestPerformer = URLSessionRequestPerformer()
    
    
    // MARK: - Initialization
    
    /// - Parameter window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Internal func
    
    func start() {
        let mainScreenCoordinator: Coordinator = TestRequestNewsCoordinator(navigationController,
                                                                            networkRequestPerformer)
        self.mainScreenCoordinator = mainScreenCoordinator
        mainScreenCoordinator.start()
        
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
    }
}
