//
//  TestRequestNewsModuleView.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit

/// События которые отправляем из View в Presenter
protocol TestRequestNewsModuleViewOutput: AnyObject {
    
}

/// События которые отправляем от Presenter ко View
protocol TestRequestNewsModuleViewInput: AnyObject {
    
}

/// Псевдоним протокола UIView & TestRequestNewsModuleViewInput
typealias TestRequestNewsModuleViewProtocol = UIView & TestRequestNewsModuleViewInput

/// View для экрана
final class TestRequestNewsModuleView: TestRequestNewsModuleViewProtocol {
    
    // MARK: - Public properties
    
    // MARK: - Internal properties
    
    weak var output: TestRequestNewsModuleViewOutput?
    
    // MARK: - Private properties
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public func
    
    // MARK: - Internal func
    
    // MARK: - Private func
    
    private func configureLayout() {
        
    }
    
    private func applyDefaultBehavior() {
        backgroundColor = .blue
    }
}

// MARK: - Appearance

private extension TestRequestNewsModuleView {
    struct Appearance {
        
    }
}
