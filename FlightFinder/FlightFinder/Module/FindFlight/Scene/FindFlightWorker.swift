//
//  FindFlightWorker.swift
//  FlightFinder
//
//  Created by Himanshu Patwardhan on 14/06/18.
//  Copyright (c) 2018 The HP Apps. All rights reserved.
//

//****************************************************************************************************
// can be broken down into many workers, each doing one thing
// reuse the same workers elsewhere
// just provides an interface and implementation of the work it can do for interactor
//****************************************************************************************************

import UIKit

class FindFlightWorker {
    typealias responseHandler = (_ response: FindFlight.Route.Response) ->()
    
    var provider = MoyaCustomProvider<FindFlightAPI>()
    
    // MARK:-
    func doAPICall_FindFlightByRoute(
        dict_RouteData: [String : AnyObject]
        , success: @escaping(responseHandler)
        ) {
        provider.request(.findFlightByRoute(
            dict_QueryData: dict_RouteData)
            , success: { response in
                do {
                    let results = try JSONDecoder().decode(FindFlight.Route.Response.self, from: response.data)
                    success(results)
                } catch let err {
                    print(err)
                    CustomNotificationBanner.showErrorBanner(subtitle: err.localizedDescription)
                    ActivityIndicator.hide()
                }
        })
    }
}
