//
//  NetworkRequest.swift
//  
//
//  Created by Vitalii Sosin on 30.04.2022.
//

/// Сетевой запрос
public protocol NetworkRequest {
    
    /// Тип запроса `"GET"`, `"POST"`,`"PUT"`,`"DELETE"`,`"HEAD"`,`"PATCH"`,`"TRACE"`,`"CONNECT"`,`"OPTIONS"`
    var httpMethod: NetworkRequestHTTPMethod { get }
    
    /// Хост (Домен) сервера. Например `https://SosinVitalii.com`
    var host: String { get }
    
    /// Ручка (Путь) конкретного запроса. Например `\top\listNews`
    var path: String { get }
    
    /// Создаем информацию о HTTP-запросе `[String: String]`
    var httpHeaders: [String: String] { get }
    
    /// Дополнительная информация, которую можно добавить в URL-адрес `[String: Any]`
    var queryParameters: [String: Any] { get }
    
    /// Добавить `httpHeaders`.  По умолчанию `true`
    var shouldAddDefaultHeaders: Bool { get }
    
    /// Выводить информацию запроса в консоль. По умолчанию `true`
    var logRequest: Bool { get }
}

// MARK: - Применение по умолчанию

public extension NetworkRequest {
    var httpHeaders: [String: String] {
        [:]
    }
    
    var queryParameters: [String: Any] {
        [:]
    }
    
    var shouldAddDefaultHeaders: Bool {
        true
    }
    
    var logRequest: Bool {
        true
    }
}
