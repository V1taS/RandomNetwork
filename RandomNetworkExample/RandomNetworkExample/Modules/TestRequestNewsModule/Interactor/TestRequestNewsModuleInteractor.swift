//
//  TestRequestNewsModuleInteractor.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import UIKit
import RandomNetwork

/// События которые отправляем из Interactor в Presenter
protocol TestRequestNewsModuleInteractorOutput: AnyObject {
    
    /// Были получены новости
    ///  - Parameter news: Модель Новостей
    func didRecive(news: TestRequestNewsModel)
}

/// События которые отправляем от Presenter к Interactor
protocol TestRequestNewsModuleInteractorInput {
    
    /// Получаем список новостей
    func getContent()
}

/// Интерактор
final class TestRequestNewsModuleInteractor: TestRequestNewsModuleInteractorInput {
    
    // MARK: - Internal properties
    
    weak var output: TestRequestNewsModuleInteractorOutput?
    
    // MARK: - Private properties
    
    private let networkRequestPerformer: NetworkRequestPerformer
    
    // MARK: - Initialization
    
    /// Инициализатор
    /// - Parameter networkRequestPerformer: Сетевой слой
    init(networkRequestPerformer: NetworkRequestPerformer) {
        self.networkRequestPerformer = networkRequestPerformer
    }
    
    func getContent() {
        let testRequestNewsRequest = TestRequestNewsRequest()
        networkRequestPerformer.perform(testRequestNewsRequest,
                                        TestRequestNewsDTO.self) { [weak self] result in
            switch result {
            case .success(let result):
                let news = result.toModel()
                DispatchQueue.main.async {
                    self?.output?.didRecive(news: news)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
