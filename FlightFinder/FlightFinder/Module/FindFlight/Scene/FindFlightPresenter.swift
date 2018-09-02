//
//  FindFlightPresenter.swift
//  FlightFinder
//
//  Created by Himanshu Patwardhan on 14/06/18.
//  Copyright (c) 2018 The HP Apps. All rights reserved.
//

//****************************************************************************************************
// marshal the response into view models suitable for display
// pass view models back to view controller for display to user
//****************************************************************************************************

import UIKit

protocol FindFlightPresentationLogic {
    func present_FindFlightByRoute(response: FindFlight.Route.Response)
}

class FindFlightPresenter: FindFlightPresentationLogic {
    weak var viewController: FindFlightDisplayLogic?
    
    // MARK:- present searched flight data
    func present_FindFlightByRoute(response: FindFlight.Route.Response) {
        let findFlightResult = response.findFlightResult
        var arr_Fligths:[FindFlight.Route.Flight] = []
        
        if let flights = findFlightResult?.flights { // if flights available
            
            for flight in flights { // then for every flight
                
                if let segments = flight.segments { // if multiple segments available
                    
                    for segment in segments { // then for every segment
                        
                        let flight = FindFlight.Route.Flight(
                            ident: segment.ident
                            , airline: segment.airline ?? ""
                            , airline_iata: segment.airline_iata ?? ""
                            , flightnumber: segment.flightnumber ?? ""
                            , origin_code: segment.origin?.code ?? ""
                            , origin_city: segment.origin?.city ?? ""
                            , origin_alternate_ident: segment.origin?.alternate_ident ?? ""
                            , origin_airport_name: segment.origin?.airport_name ?? ""
                            , destination_code: segment.destination?.code ?? ""
                            , destination_city: segment.destination?.city ?? ""
                            , destination_alternate_ident: segment.destination?.alternate_ident ?? ""
                            , destination_airport_name: segment.destination?.airport_name ?? ""
                            , estimated_departure_tz: segment.estimated_departure_time?.tz ?? ""
                            , estimated_departure_time: segment.estimated_departure_time?.time ?? ""
                            , estimated_departure_date: segment.estimated_departure_time?.date ?? ""
                            , estimated_arrival_tz: segment.estimated_arrival_time?.tz ?? ""
                            , estimated_arrival_time: segment.estimated_arrival_time?.time ?? ""
                            , estimated_arrival_date: segment.estimated_arrival_time?.date ?? ""
                            , status: segment.status ?? ""
                        )
                        
                        arr_Fligths.append(flight)
                    }
                }
            }
        }
        let viewModel = FindFlight.Route.ViewModel(flights: arr_Fligths)
        viewController?.display_Something(viewModel: viewModel)
    }
}
