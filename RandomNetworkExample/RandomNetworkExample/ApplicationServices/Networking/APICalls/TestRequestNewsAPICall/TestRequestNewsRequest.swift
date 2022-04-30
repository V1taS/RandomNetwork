//
//  TestRequestNewsRequest.swift
//  RandomNetworkExample
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation
import RandomNetwork

/// Моделька запроса для новостей
public struct TestRequestNewsRequest: NetworkRequest {
    
    /// Метод запроса
    public var httpMethod: NetworkRequestHTTPMethod = .get
    
    /// Адрес хоста
    public var host: String = "https://api.spaceflightnewsapi.net"
    
    /// Ручка хоста
    public var path: String = "/v3/info"
}
