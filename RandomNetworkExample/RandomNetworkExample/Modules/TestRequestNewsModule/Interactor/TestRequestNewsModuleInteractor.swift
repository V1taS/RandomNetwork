//
//  TestRequestNewsModuleInteractor.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit

/// События которые отправляем из Interactor в Presenter
protocol TestRequestNewsModuleInteractorOutput: AnyObject {
    
}

/// События которые отправляем от Presenter к Interactor
protocol TestRequestNewsModuleInteractorInput {
    
}

/// Интерактор
final class TestRequestNewsModuleInteractor: TestRequestNewsModuleInteractorInput {
    
    // MARK: - Internal properties
    
    weak var output: TestRequestNewsModuleInteractorOutput?
    
    // MARK: - Private properties
    
}

// MARK: - Appearance

private extension TestRequestNewsModuleInteractor {
    struct Appearance {
        
    }
}
