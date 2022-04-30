//
//  TestRequestNewsModuleAssembly.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit

/// Сборщик `TestRequestNewsModule`
final class TestRequestNewsModuleAssembly {
    
    /// Собирает модуль `TestRequestNewsModule`
    /// - Returns: Cобранный модуль `TestRequestNewsModule`
    func createModule() -> TestRequestNewsModuleModule {
        
        let interactor = TestRequestNewsModuleInteractor()
        let view = TestRequestNewsModuleView()
        let factory = TestRequestNewsModuleFactory()
        
        let presenter = TestRequestNewsModuleViewController(interactor: interactor, moduleView: view, factory: factory)
        
        view.output = presenter
        interactor.output = presenter
        factory.output = presenter
        return presenter
    }
}
