//
//  TestRequestNewsModuleAssembly.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit
import RandomNetwork

/// Сборщик `TestRequestNewsModule`
final class TestRequestNewsModuleAssembly {
    
    /// Собирает модуль `TestRequestNewsModule`
    /// - Parameter networkRequestPerformer: Сетевой слой
    /// - Returns: Cобранный модуль `TestRequestNewsModule`
    func createModule(networkRequestPerformer: NetworkRequestPerformer) -> TestRequestNewsModuleModule {
        
        let interactor = TestRequestNewsModuleInteractor(networkRequestPerformer: networkRequestPerformer)
        let view = TestRequestNewsModuleView()
        let factory = TestRequestNewsModuleFactory()
        
        let presenter = TestRequestNewsModuleViewController(interactor: interactor, moduleView: view, factory: factory)
        
        view.output = presenter
        interactor.output = presenter
        factory.output = presenter
        return presenter
    }
}
