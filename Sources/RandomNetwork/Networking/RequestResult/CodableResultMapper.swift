//
//  CodableResultMapper.swift
//  
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation

/// Универсальный тип данных `T` и ошибка `Error`
public typealias RemoteServiceResult<T> = Result<T, Error>

/// Класс для маппинга данных
public final class CodableResultMapper {
    
    // MARK: - Public func
    
    /// Делает маппинг из `JSON` в структуру данных типа `Generic`
    ///
    /// - parameter result: модель данных с сервера
    /// - returns: Результат маппинга в структуру `Generic` или ошибка `Error`.
    public func map<ResponseType: Codable>(_ result: NetworkRequestResult) -> RemoteServiceResult<ResponseType> {
        if let error = result.error {
            return .failure(error)
        } else {
            if let data = result.data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(ResponseType.self, from: data)
                    return .success(result)
                } catch {
                    return .failure(error)
                }
            } else {
                return .failure(NetworkError.unexpectedServerResponse)
            }
        }
    }
}
