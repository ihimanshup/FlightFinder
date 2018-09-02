//
//  FindFlightModels.swift
//  FlightFinder
//
//  Created by Himanshu Patwardhan on 14/06/18.
//  Copyright (c) 2018 The HP Apps. All rights reserved.
//

import UIKit

enum FindFlight {
    // MARK:-
    enum Route {
        // MARK:-
        struct Request {
            let origin: String!
            let destination: String!
        }
        // MARK:-
        struct Response: Codable {
            let findFlightResult : FindFlightResult?
            enum CodingKeys: String, CodingKey {
                case findFlightResult  = "FindFlightResult"
            }
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                findFlightResult = try values.decodeIfPresent(FindFlightResult.self, forKey: .findFlightResult)
            }
        }
        
        /*
        struct Response: Codable {
            let findFlightResult: FindFlightResult
            
            enum CodingKeys: String, CodingKey {
                case findFlightResult = "FindFlightResult"
            }
        }
        
        struct FindFlightResult: Codable {
            let numFlights: Int
            let flights: [Flight]
            let nextOffset: Int
            
            enum CodingKeys: String, CodingKey {
                case numFlights = "num_flights"
                case flights
                case nextOffset = "next_offset"
            }
        }
        
        struct Flight: Codable {
            let numSegments: Int
            let segments: [Segment]
            
            enum CodingKeys: String, CodingKey {
                case numSegments = "num_segments"
                case segments
            }
        }
        
        struct Segment: Codable {
            let ident, faFlightID, airline, airlineIata: String
            let flightnumber: String
            let type: TypeEnum
            let blocked, diverted, cancelled: Bool
            let origin, destination: Destination
            let filedEte, filedAirspeedKts, distanceFiled: Int
            let filedDepartureTime, estimatedDepartureTime: Time
            let actualDepartureTime: ActualTime
            let departureDelay: Int
            let filedArrivalTime, estimatedArrivalTime: Time
            let actualArrivalTime: ActualTime
            let arrivalDelay: Int
            let status: Status
            let progressPercent: Int
            let adhoc: Bool
            let aircrafttype, fullAircrafttype, tailnumber: String?
            
            enum CodingKeys: String, CodingKey {
                case ident, faFlightID, airline
                case airlineIata = "airline_iata"
                case flightnumber, type, blocked, diverted, cancelled, origin, destination
                case filedEte = "filed_ete"
                case filedAirspeedKts = "filed_airspeed_kts"
                case distanceFiled = "distance_filed"
                case filedDepartureTime = "filed_departure_time"
                case estimatedDepartureTime = "estimated_departure_time"
                case actualDepartureTime = "actual_departure_time"
                case departureDelay = "departure_delay"
                case filedArrivalTime = "filed_arrival_time"
                case estimatedArrivalTime = "estimated_arrival_time"
                case actualArrivalTime = "actual_arrival_time"
                case arrivalDelay = "arrival_delay"
                case status
                case progressPercent = "progress_percent"
                case adhoc, aircrafttype
                case fullAircrafttype = "full_aircrafttype"
                case tailnumber
            }
        }
        
        struct ActualTime: Codable {
            let epoch: Int
        }
        
        struct Destination: Codable {
            let code: Code
            let city: City
            let alternateIdent: AlternateIdent
            let airportName: AirportName
            
            enum CodingKeys: String, CodingKey {
                case code, city
                case alternateIdent = "alternate_ident"
                case airportName = "airport_name"
            }
        }
        
        enum AirportName: String, Codable {
            case bengaluruIntL = "Bengaluru Int'l"
            case chatrapatiShivajiIntL = "Chatrapati Shivaji Int'l"
        }
        
        enum AlternateIdent: String, Codable {
            case blr = "BLR"
            case bom = "BOM"
        }
        
        enum City: String, Codable {
            case bangaloreKarnataka = "Bangalore, Karnataka"
            case mumbai = "Mumbai"
        }
        
        enum Code: String, Codable {
            case vabb = "VABB"
            case vobl = "VOBL"
        }
        
        struct Time: Codable {
            let epoch: Int
            let tz: Tz
            let dow: Dow
            let time: String
            let date: Date
            let localtime: Int
        }
        
        enum Date: String, Codable {
            case the15062018 = "15/06/2018"
        }
        
        enum Dow: String, Codable {
            case friday = "Friday"
        }
        
        enum Tz: String, Codable {
            case ist = "IST"
        }
        
        enum Status: String, Codable {
            case scheduled = "Scheduled"
        }
        
        enum TypeEnum: String, Codable {
            case formAirline = "Form_Airline"
        }
*/
        // MARK:-
        struct ViewModel {
            let flights: [Flight]
        }
        struct Flight {
            // flight details
            let ident : String?
            let airline : String?
            let airline_iata : String?
            let flightnumber : String?
            // origin
            let origin_code : String?
            let origin_city : String?
            let origin_alternate_ident : String?
            let origin_airport_name : String?
            // destination
            let destination_code : String?
            let destination_city : String?
            let destination_alternate_ident : String?
            let destination_airport_name : String?
            // timing
            let estimated_departure_tz : String?
            let estimated_departure_time : String?
            let estimated_departure_date : String?
            let estimated_arrival_tz : String?
            let estimated_arrival_time : String?
            let estimated_arrival_date : String?
            // status
            let status : String?
        }
    }
}
