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
    
    /// Создаем список Новостей из модели
    ///  - Parameter news: Модель Новостей
    func configureList(news: TestRequestNewsModel)
    
    /// Запустить лоадер
    func startLoader()
    
    /// Остановить лоадер
    func stopLoader()
}

/// Псевдоним протокола UIView & TestRequestNewsModuleViewInput
typealias TestRequestNewsModuleViewProtocol = UIView & TestRequestNewsModuleViewInput

/// View для экрана
final class TestRequestNewsModuleView: TestRequestNewsModuleViewProtocol {

    // MARK: - Internal properties
    
    weak var output: TestRequestNewsModuleViewOutput?
    
    // MARK: - Private properties
    
    private let tableView = UITableView()
    private let loaderView = UIActivityIndicatorView()
    private var news: [String] = []
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        applyDefaultBehavior()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal func
    
    func configureList(news: TestRequestNewsModel) {
        self.news = news.newsSites
        tableView.reloadData()
    }
    
    func startLoader() {
        loaderView.isHidden = false
        loaderView.startAnimating()
    }
    
    func stopLoader() {
        loaderView.isHidden = true
        loaderView.stopAnimating()
    }
    
    // MARK: - Private func
    
    private func configureLayout() {
        [tableView, loaderView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            loaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func applyDefaultBehavior() {
        backgroundColor = .white
        loaderView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Appearance().cell)
    }
}

// MARK: - UITableViewDelegate

extension TestRequestNewsModuleView: UITableViewDelegate {

}

// MARK: - UITableViewDelegate

extension TestRequestNewsModuleView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Appearance().cell, for: indexPath as IndexPath)
        let oneNews = news[indexPath.row]
        cell.textLabel?.text = oneNews
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Appearance

private extension TestRequestNewsModuleView {
    struct Appearance {
        let cell = "MyCell"
    }
}
