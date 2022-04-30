//
//  URL+CustomInit.swift
//  
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation

extension URL {
    
    // MARK: - Initialization
    
    /// Кастомный инициализатор для `URL`
    ///
    /// - parameters:
    ///  - host: Адрес хоста.
    ///  - path: Ручка запроса
    ///  - params: Параметры запроса
    init?(host: String, path: String, params: [String: Any]) {
        var components = URLComponents(string: host)
        
        components?.path += path
        
        for parameter in params {
            if let parameterArray = parameter.value as? Array<Any> {
                components?.queryItems = parameterArray.map {
                    URLQueryItem(name: parameter.key, value: String(describing: $0))
                }
            } else {
                components?.queryItems?.append(
                    URLQueryItem(name: parameter.key, value: String(describing: parameter.value))
                )
            }
        }
        
        guard let url = components?.url else { return nil }
        self = url
    }
}
