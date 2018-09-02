import Foundation

struct Segments : Codable {
	let ident : String?
	let faFlightID : String?
	let airline : String?
	let airline_iata : String?
	let flightnumber : String?
	let type : String?
	let blocked : Bool?
	let diverted : Bool?
	let cancelled : Bool?
	let origin : Origin?
	let destination : Destination?
	let filed_ete : Int?
	let filed_airspeed_kts : Int?
	let distance_filed : Int?
	let filed_departure_time : Filed_departure_time?
	let estimated_departure_time : Estimated_departure_time?
	let actual_departure_time : Actual_departure_time?
	let departure_delay : Int?
	let filed_arrival_time : Filed_arrival_time?
	let estimated_arrival_time : Estimated_arrival_time?
	let actual_arrival_time : Actual_arrival_time?
	let arrival_delay : Int?
	let status : String?
	let progress_percent : Int?
	let adhoc : Bool?

	enum CodingKeys: String, CodingKey {

		case ident = "ident"
		case faFlightID = "faFlightID"
		case airline = "airline"
		case airline_iata = "airline_iata"
		case flightnumber = "flightnumber"
		case type = "type"
		case blocked = "blocked"
		case diverted = "diverted"
		case cancelled = "cancelled"
		case origin = "origin"
		case destination = "destination"
		case filed_ete = "filed_ete"
		case filed_airspeed_kts = "filed_airspeed_kts"
		case distance_filed = "distance_filed"
		case filed_departure_time = "filed_departure_time"
		case estimated_departure_time = "estimated_departure_time"
		case actual_departure_time = "actual_departure_time"
		case departure_delay = "departure_delay"
		case filed_arrival_time = "filed_arrival_time"
		case estimated_arrival_time = "estimated_arrival_time"
		case actual_arrival_time = "actual_arrival_time"
		case arrival_delay = "arrival_delay"
		case status = "status"
		case progress_percent = "progress_percent"
		case adhoc = "adhoc"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		ident = try values.decodeIfPresent(String.self, forKey: .ident)
		faFlightID = try values.decodeIfPresent(String.self, forKey: .faFlightID)
		airline = try values.decodeIfPresent(String.self, forKey: .airline)
		airline_iata = try values.decodeIfPresent(String.self, forKey: .airline_iata)
		flightnumber = try values.decodeIfPresent(String.self, forKey: .flightnumber)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		blocked = try values.decodeIfPresent(Bool.self, forKey: .blocked)
		diverted = try values.decodeIfPresent(Bool.self, forKey: .diverted)
		cancelled = try values.decodeIfPresent(Bool.self, forKey: .cancelled)
        origin = try values.decodeIfPresent(Origin.self, forKey: .origin)
        destination = try values.decodeIfPresent(Destination.self, forKey: .destination)
		filed_ete = try values.decodeIfPresent(Int.self, forKey: .filed_ete)
		filed_airspeed_kts = try values.decodeIfPresent(Int.self, forKey: .filed_airspeed_kts)
		distance_filed = try values.decodeIfPresent(Int.self, forKey: .distance_filed)
        filed_departure_time = try values.decodeIfPresent(Filed_departure_time.self, forKey: .filed_departure_time)
        estimated_departure_time = try values.decodeIfPresent(Estimated_departure_time.self, forKey: .estimated_departure_time)
        actual_departure_time = try values.decodeIfPresent(Actual_departure_time.self, forKey: .actual_departure_time)
		departure_delay = try values.decodeIfPresent(Int.self, forKey: .departure_delay)
        filed_arrival_time = try values.decodeIfPresent(Filed_arrival_time.self, forKey: .filed_arrival_time)
        estimated_arrival_time = try values.decodeIfPresent(Estimated_arrival_time.self, forKey: .estimated_arrival_time)
        actual_arrival_time = try values.decodeIfPresent(Actual_arrival_time.self, forKey: .actual_arrival_time)
		arrival_delay = try values.decodeIfPresent(Int.self, forKey: .arrival_delay)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		progress_percent = try values.decodeIfPresent(Int.self, forKey: .progress_percent)
		adhoc = try values.decodeIfPresent(Bool.self, forKey: .adhoc)
	}

}
