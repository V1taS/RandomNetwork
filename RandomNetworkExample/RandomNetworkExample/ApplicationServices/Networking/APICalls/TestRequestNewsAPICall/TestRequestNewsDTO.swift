//
//  TestRequestNewsDTO.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation

/// DTO  (data transfer object)
/// DTO — это так называемый value-object на стороне сервера, который хранит данные, используемые в слое представления.
public struct TestRequestNewsDTO: Codable {
    
    /// Версия
    let version: String
    
    /// Массив новостей
    let newsSites: [String]
}

// MARK: - Маппим DTO в простую модельку

extension TestRequestNewsDTO {
    
    func toModel() -> TestRequestNewsModel {
        TestRequestNewsModel(version: version,
                             newsSites: newsSites)
    }
}
