//
//  NetworkError.swift
//  
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation

/// Сетевая ошибка
public enum NetworkError: Error {
    
    /// Подключение к Интернету отсутствует
    case noInternetConnection
    
    /// Неверный URL-запрос
    case invalidURLRequest
    
    /// Неприемлемый код состояния HTTP
    case unacceptedHTTPStatus(code: Int)
    
    /// Непредвиденный ответ сервера
    case unexpectedServerResponse
}
