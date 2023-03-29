//
//  RMRequest.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 28.03.2023.
//

import Foundation

final class RMRequest {
    //    1. Base url
    //    2. Endpoint
    //    3. Path components
    //    4. Query parameters
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndPoint
    
    private let pathComponents: Set<String>
    
    private let queryParameters: [URLQueryItem]
    //URLQueryItem: name -> value turn on.
    
    private var urlString : String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
            
//       https://rickandmortyapi.com/api/character?name=rick&status=alive
        }
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endpoint: RMEndPoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = [] ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
