//
//  URLRequest+CustomInit.swift
//  
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation

extension URLRequest {
    
    // MARK: - Initialization
    
    /// Кастомный инициализатор для `URL Request`
    ///
    /// - parameters:
    ///  - networkRequest: Сетевой запрос
    ///  - additionalHeaders: Дополнительные заголовки
    init?(networkRequest: NetworkRequest,
          additionalHeaders: [String: String] = [:]) {
        
        guard let url = URL(host: networkRequest.host,
                            path: networkRequest.path,
                            params: networkRequest.queryParameters) else {
            return nil
        }
        self.init(url: url)
        
        let appearance = Appearance()
        
        httpMethod = networkRequest.httpMethod.rawValue
        setValue(appearance.headerFieldValue, forHTTPHeaderField: appearance.headerFieldAccept)
        setValue(appearance.headerFieldValue, forHTTPHeaderField: appearance.headerFieldContentType)
        
        additionalHeaders.forEach {
            setValue($1, forHTTPHeaderField: $0)
        }
        
        switch networkRequest.httpMethod {
        case .post, .put, .head, .patch, .trace, .connect:
            if let jsonBody = try? JSONSerialization.data(withJSONObject: networkRequest.queryParameters) {
                httpBody = jsonBody
            }
        default:
            break
        }
    }
}

// MARK: - Appearance

private extension URLRequest {
    struct Appearance {
        let headerFieldAccept = "Accept"
        let headerFieldContentType = "Content-Type"
        let headerFieldValue = "application/json"
    }
}
