//
//  FindFlightViewController.swift
//  FlightFinder
//
//  Created by Himanshu Patwardhan on 14/06/18.
//  Copyright (c) 2018 The HP Apps. All rights reserved.
//

import UIKit

protocol FindFlightDisplayLogic: class {
    func display_Something(viewModel: FindFlight.Route.ViewModel)
}

class FindFlightViewController: UIViewController, FindFlightDisplayLogic {
    var interactor: FindFlightBusinessLogic?
    
    // MARK:- Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK:- Setup - hook up all the Clean Swift components
    private func setup() {
        let viewController = self
        let interactor = FindFlightInteractor()
        let presenter = FindFlightPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK:- Outlets
    @IBOutlet weak var tbl_FlightList: UITableView!
    // MARK:-
    fileprivate var arr_Flights: [FindFlight.Route.Flight] = []
    
    // MARK:- View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        perform_FindFlightByRoute()
    }
    
    // MARK:- find flights by route
    fileprivate func perform_FindFlightByRoute() {
        let request = FindFlight.Route.Request(origin: "MIA", destination: "BOM")
        interactor?.do_FindFlightByRoute(request: request)
    }
    
    func display_Something(viewModel: FindFlight.Route.ViewModel) {
        if viewModel.flights.count != 0 {
            arr_Flights.append(contentsOf: viewModel.flights)
        }
        // relaod the table view to show data
        tbl_FlightList.reloadData()
        ActivityIndicator.hide()
    }
}

// MARK:-
extension FindFlightViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK:- TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_Flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightOverviewDefaultDataTableViewCell", for: indexPath) as! FlightOverviewTableViewCell
        
        let flightData = arr_Flights[indexPath.row]
        cell.setData(for: flightData)
        
        return cell
    }
    
    // MARK:- TableView Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // MARK:- WARNING - add some delegate here
    }
}
