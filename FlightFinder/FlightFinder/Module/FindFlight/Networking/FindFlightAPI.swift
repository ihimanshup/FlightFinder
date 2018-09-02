//
//  FindFlightAPI.swift
//  FlightFinder
//
//  Created by Himanshu Patwardhan on 14/06/18.
//  Copyright © 2018 The HP Apps. All rights reserved.
//

import Foundation
import Moya

enum FindFlightAPI {
    case findFlightByRoute(dict_QueryData: [String: AnyObject])
}

extension FindFlightAPI: TargetType {
    var baseURL: URL {
        let baseUrl = NetworkManager().baseURL_FlightAware
        guard let url = URL(string: baseUrl) else {
            fatalError("base url could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .findFlightByRoute:
            return "/FindFlight"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .findFlightByRoute:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .findFlightByRoute(let dict_QueryData):
            // Always sends parameters in URL, regardless of which HTTP method is used
            return .requestParameters(parameters: dict_QueryData, encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .findFlightByRoute:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .findFlightByRoute:
            return [APIRequestHeaders.Key.CONTENT_TYPE.rawValue: APIRequestHeaders.Value.CONTENT_TYPE.rawValue]
        }
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
