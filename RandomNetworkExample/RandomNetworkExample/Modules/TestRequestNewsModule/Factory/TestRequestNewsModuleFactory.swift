//
//  TestRequestNewsModuleFactory.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit

/// Cобытия которые отправляем из Factory в Presenter
protocol TestRequestNewsModuleFactoryOutput: AnyObject {
    
}

/// Cобытия которые отправляем от Presenter к Factory
protocol TestRequestNewsModuleFactoryInput {
    
}

/// Фабрика
final class TestRequestNewsModuleFactory: TestRequestNewsModuleFactoryInput {
    
    // MARK: - Internal properties
    
    weak var output: TestRequestNewsModuleFactoryOutput?
    
    // MARK: - Private properties
    
}

// MARK: - Appearance

private extension TestRequestNewsModuleFactory {
    struct Appearance {
        
    }
}
