//
//  NetworkRequestHTTPMethod.swift
//  
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation

/// HTTP-метод сетевого запроса
public enum NetworkRequestHTTPMethod: String {
    
    /// Получить данные
    case get = "GET"
    
    /// Отправить данные
    case post = "POST"
    
    /// Обновить данные. Перезаписывает данные (даже если файл не изменился)
    case put = "PUT"
    
    /// Метод запроса HTTP PATCH частично изменяет ресурс. Такой же как и метод `PUT`,
    /// только `PATCH` не перезапишет данные если они не изменились, а `PUT` перезапишет
    case patch = "PATCH"
    
    /// Удалить данные
    case delete = "DELETE"
    
    /// HTTP-метод `HEAD` запрашивает заголовки `httpHeaders`.
    case head = "HEAD"
    
    /// HTTP Метод TRACE выполняет проверку обратной связи по пути к целевому ресурсу `code 200`
    case trace = "TRACE"
    
    /// Метод HTTP CONNECTзапускает двустороннюю связь с запрошенным ресурсом.
    case connect = "CONNECT"
    
    /// Запрос `OPTIONS` вернет список доступных методов `GET, Post ...`
    case options = "OPTIONS"
}
