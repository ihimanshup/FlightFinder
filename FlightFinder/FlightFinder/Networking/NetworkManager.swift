//
//  NetworkManager.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import Foundation

// MARK:-
struct NetworkManager {
    var baseURL_FlightStats: String {
        return "https://api.flightstats.com/flex/"
    }
    var baseURL_FlightAware: String {
        let username = Keys.FlightAware.username.rawValue
        let apiKey = Keys.FlightAware.apiKey.rawValue
        return "http://\(username):\(apiKey)@flightxml.flightaware.com/json/FlightXML3"
    }
}

// MARK:- API Request Headers
struct APIRequestHeaders {
    enum Key: String {
        case CONTENT_TYPE = "Content-type"
    }
    enum Value: String {
        case CONTENT_TYPE = "application/json"
    }
}

// MARK:- API Request Query
struct APIRequestQuery {
    enum Key: String {
        // FlightStats
        case APP_ID = "appId"
        case APP_KEY = "appKey"
        // FlightAware
        // NearbyAirports
        case LATITUDE = "latitude"
        case LONGITUDE = "longitude"
        case RADIUS = "radius"
        // AirportBoards
        case AIRPORT_CODE = "airport_code"
        case TYPE = "type"
        case HOW_MANY = "howMany"
        // FindFlight
        case ORIGIN = "origin"
        case DESTINATION = "destination"
    }
    enum Value: String {
        // FlightStats
        case APP_ID = "FlightStats_APP_ID"
        case APP_KEY = "FlightStats_APP_KEY"
        // FlightAware
    }
}

// MARK:- API Response
struct APIResponse {
    enum Key: String {
        case status
    }
    enum Value: String {
        case success
        case error
    }
}
