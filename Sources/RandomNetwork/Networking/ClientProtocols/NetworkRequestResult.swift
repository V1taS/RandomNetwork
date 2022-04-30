//
//  NetworkRequestResult.swift
//  
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation

/// Результат сетевого запроса
public struct NetworkRequestResult {
    
    /// Данные
    public let data: Data?
    
    /// Ошибка
    public let error: Error?
}
