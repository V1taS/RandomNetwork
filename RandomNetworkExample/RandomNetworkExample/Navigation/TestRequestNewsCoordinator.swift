//
//  TestRequestNewsCoordinator.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit

final class TestRequestNewsCoordinator: Coordinator {
    
    // MARK: - Private variables
    
    private let navigationController: UINavigationController
    private var testRequestNewsModule: TestRequestNewsModuleModule?
    
    // MARK: - Initialization
    
    /// - Parameters:
    ///   - navigationController: UINavigationController
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal func
    
    func start() {
        let testRequestNewsModule = TestRequestNewsModuleAssembly().createModule()
        self.testRequestNewsModule = testRequestNewsModule
        navigationController.pushViewController(testRequestNewsModule, animated: true)
    }
}
