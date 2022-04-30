//
//  TestRequestNewsModuleViewController.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit

/// События которые отправляем из `текущего модуля` в  `другой модуль`
protocol TestRequestNewsModuleModuleOutput: AnyObject {
    
}

/// События которые отправляем из `другого модуля` в  `текущий модуль`
protocol TestRequestNewsModuleModuleInput {
    
    /// События которые отправляем из `текущего модуля` в  `другой модуль`
    var moduleOutput: TestRequestNewsModuleModuleOutput? { get set }
}

/// Готовый модуль `TestRequestNewsModuleModule`
typealias TestRequestNewsModuleModule = UIViewController & TestRequestNewsModuleModuleInput

/// Презентер
final class TestRequestNewsModuleViewController: TestRequestNewsModuleModule {
    
    // MARK: - Public properties
    
    // MARK: - Internal properties
    
    weak var moduleOutput: TestRequestNewsModuleModuleOutput?
    
    // MARK: - Private properties
    
    private let interactor: TestRequestNewsModuleInteractorInput
    private let moduleView: TestRequestNewsModuleViewProtocol
    private let factory: TestRequestNewsModuleFactoryInput
    
    // MARK: - Initialization
    
    /// Инициализатор
    /// - Parameters:
    ///   - interactor: интерактор
    ///   - moduleView: вью
    ///   - factory: фабрика
    init(interactor: TestRequestNewsModuleInteractorInput,
         moduleView: TestRequestNewsModuleViewProtocol,
         factory: TestRequestNewsModuleFactoryInput) {
        self.interactor = interactor
        self.moduleView = moduleView
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = moduleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - TestRequestNewsModuleViewOutput

extension TestRequestNewsModuleViewController: TestRequestNewsModuleViewOutput {
    
}

// MARK: - TestRequestNewsModuleInteractorOutput

extension TestRequestNewsModuleViewController: TestRequestNewsModuleInteractorOutput {
    
}

// MARK: - TestRequestNewsModuleFactoryOutput

extension TestRequestNewsModuleViewController: TestRequestNewsModuleFactoryOutput {
    
}

// MARK: - Appearance

private extension TestRequestNewsModuleViewController {
    struct Appearance {
        
    }
}
