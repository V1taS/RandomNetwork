//
//  NetworkRequestPerformer.swift
//  
//
//  Created by Vitalii Sosin on 30.04.2022.
//

/// Исполнитель сетевых запросов
public protocol NetworkRequestPerformer {
    
    /// Выполняет новый запрос
    ///
    /// - parameter request: Протокол запроса `NetworkRequest`.
    ///
    /// - returns: Результат запроса `NetworkRequestResult`.
    func perform(_ request: NetworkRequest, completion: ((NetworkRequestResult) -> Void)?)

    /// Выполняет новый запрос и сразу маппит в DTO
    /// - Parameters:
    ///   - request: Протокол запроса `NetworkRequest`.
    ///   - responseType: Тип данных для маппинга. Например `String.self`
    /// - returns: Смапленные данные в конкретную DTO
    func perform<ResponseType: Codable>(_ request: NetworkRequest,
                                        _ responseType: ResponseType.Type,
                                        completion: ((RemoteServiceResult<ResponseType>) -> Void)?)
}
