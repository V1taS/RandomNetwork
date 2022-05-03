//
//  URLSessionRequestPerformer.swift
//
//
//  Created by Vitalii Sosin on 30.04.2022.
//

import Foundation

/// Исполнитель запроса сеанса URL
public final class URLSessionRequestPerformer {
    
    // MARK: - Private variable
    
    private lazy var session: URLSession = {
        let appearance = Appearance()
        let config = URLSession.shared
        
        /// Время ожидания для запросов URL
        config.configuration.timeoutIntervalForRequest = appearance.timeOutInterval
        
        /// Время ожидания для ответов URL
        config.configuration.timeoutIntervalForResource = appearance.timeOutInterval
        return config
    }()
    
    private lazy var networkReachability: NetworkReachability? = {
        DefaultNetworkReachability()
    }()
    
    private lazy var codableResultMapper = CodableResultMapper()
    
    // MARK: - Initialization
    
    public init() {}
}

// MARK: - NetworkRequestPerformer

public extension URLSessionRequestPerformer: NetworkRequestPerformer {
    
    public func perform(_ request: NetworkRequest, completion: ((NetworkRequestResult) -> Void)?) {
        guard networkReachability?.isReachable ?? false else {
            completion?(NetworkRequestResult(data: nil, error: NetworkError.noInternetConnection))
            return
        }
        
        guard let urlRequest = URLRequest(networkRequest: request,
                                          additionalHeaders: request.httpHeaders) else {
            completion?(NetworkRequestResult(data: nil, error: NetworkError.invalidURLRequest))
            return
        }
        
        if request.logRequest {
            print("\n\nRequest:\n\(urlRequest.curlString)")
        }
        
        DispatchQueue.global(qos: .default).async { [weak self] in
            guard let self = self else { return }
            let task = self.session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    completion?(NetworkRequestResult(data: data, error: error))
                } else {
                    if let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode {
                        completion?(NetworkRequestResult(data: data, error: nil))
                    } else {
                        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? .zero
                        completion?(NetworkRequestResult(data: data, error: NetworkError.unacceptedHTTPStatus(code: statusCode)))
                    }
                }
            }
            task.resume()
        }
    }
    
    public func perform<ResponseType>(
        _ request: NetworkRequest,
        _ responseType: ResponseType.Type,
        completion: ((RemoteServiceResult<ResponseType>) -> Void)?
    ) where ResponseType : Decodable, ResponseType : Encodable {
        perform(request) { result in
            let mappedResult: RemoteServiceResult<ResponseType> = self.codableResultMapper.map(result)
            completion?(mappedResult)
        }
    }
}

// MARK: - Appearance

private extension URLSessionRequestPerformer {
    struct Appearance {
        let timeOutInterval: Double = 90
    }
}
