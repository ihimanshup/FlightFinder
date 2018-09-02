//
//  FindFlightInteractor.swift
//  FlightFinder
//
//  Created by Himanshu Patwardhan on 14/06/18.
//  Copyright (c) 2018 The HP Apps. All rights reserved.
//

//****************************************************************************************************
// business logic
// retrieves some models and asks some workers to do the work
// view controller collects the user inputs from the UI and passes it here
//****************************************************************************************************

import UIKit

protocol FindFlightBusinessLogic {
    func do_FindFlightByRoute(request: FindFlight.Route.Request)
}

protocol FindFlightDataStore {
    //var name: String { get set }
}

class FindFlightInteractor: FindFlightBusinessLogic, FindFlightDataStore {
    var presenter: FindFlightPresentationLogic?
    var worker: FindFlightWorker?
    //var name: String = ""
    
    // MARK:- find flights by route
    func do_FindFlightByRoute(request: FindFlight.Route.Request) {
        worker = FindFlightWorker()
        
        let dict_RouteData = [
            APIRequestQuery.Key.ORIGIN.rawValue: request.origin
            , APIRequestQuery.Key.DESTINATION.rawValue: request.destination
            ] as [String : String]
        
        worker?.doAPICall_FindFlightByRoute(
            dict_RouteData: dict_RouteData as [String : AnyObject]
            , success: { (response) in
                self.presenter?.present_FindFlightByRoute(response: response)
        })
    }
}
