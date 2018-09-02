//
//  Constants.swift
//
//
//  Created by Himanshu Patwardhan.
//
//

import UIKit

// MARK:- Storyboard file names
enum Storyboard: String {
    case Main
    case FindFlight

    var filename: String {
        return rawValue
    }
}

// MARK:-
enum Keys {
    enum FlightAware: String {
        case username = "FlightAware_UserName"
        case apiKey = "FlightAware_API_KEY"
    }
}

// MARK:- image resources file names
enum Assets {
    enum NotificationBanner: String {
        case ExclamationMark = "ic_exclamation_mark"
    }
}
