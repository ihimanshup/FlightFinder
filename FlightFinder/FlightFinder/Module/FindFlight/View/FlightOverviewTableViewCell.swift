//
//  FlightOverviewTableViewCell.swift
//  FlightFinder
//
//  Created by Himanshu SMIT on 6/19/18.
//  Copyright © 2018 The HP Apps. All rights reserved.
//

import UIKit

class FlightOverviewTableViewCell: UITableViewCell {
    // MARK:- Outlets
    @IBOutlet weak var lbl_flightStatus: UILabel!
    @IBOutlet weak var lbl_airline: UILabel!
    @IBOutlet weak var lbl_airlineIATA: UILabel!
    @IBOutlet weak var lbl_flightNumber: UILabel!
    @IBOutlet weak var lbl_departureDateLocal: UILabel!
    
    @IBOutlet weak var lbl_arrivalDateLocal: UILabel!
    @IBOutlet weak var lbl_departureTimeLocal: UILabel!
    @IBOutlet weak var lbl_arrivalTimeLocal: UILabel!
    
    @IBOutlet weak var lbl_originAirportCode: UILabel!
    @IBOutlet weak var lbl_destinationAirportCode: UILabel!
    @IBOutlet weak var lbl_originAirportName: UILabel!
    @IBOutlet weak var lbl_destinationAirportName: UILabel!
    @IBOutlet weak var lbl_originAirportCity: UILabel!
    @IBOutlet weak var lbl_destinationAirportCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(for flight: FindFlight.Route.Flight) {
        lbl_flightStatus.text = flight.status
        lbl_airline.text = flight.airline
        lbl_airlineIATA.text = flight.airline_iata
        lbl_flightNumber.text = flight.flightnumber
        // departure time
        let estimated_departure_date = flight.estimated_departure_date ?? ""
        lbl_departureDateLocal.text = estimated_departure_date
        let estimated_departure_time = flight.estimated_departure_time ?? ""
        let estimated_departure_tz = flight.estimated_departure_tz ?? ""
        lbl_departureTimeLocal.text = "\(estimated_departure_time) \(estimated_departure_tz)"
        // arrival time
        let estimated_arrival_date = flight.estimated_arrival_date ?? ""
        lbl_arrivalDateLocal.text = estimated_arrival_date
        let estimated_arrival_time = flight.estimated_arrival_time ?? ""
        let estimated_arrival_tz = flight.estimated_arrival_tz ?? ""
        lbl_arrivalTimeLocal.text = "\(estimated_arrival_time) \(estimated_arrival_tz)"
        // airport
        lbl_originAirportCode.text = "\(flight.origin_code ?? "") / \(flight.origin_alternate_ident ?? "")"
        lbl_destinationAirportCode.text = "\(flight.destination_code ?? "") / \(flight.destination_alternate_ident ?? "")"
        
        lbl_originAirportName.text = flight.origin_airport_name
        lbl_destinationAirportName.text = flight.destination_airport_name
        
        lbl_originAirportCity.text = flight.origin_city
        lbl_destinationAirportCity.text = flight.destination_city
    }
}
