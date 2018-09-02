import Foundation

struct FindFlightResult : Codable {
	let num_flights : Int?
	let flights : [Flights]?
	let next_offset : Int?

	enum CodingKeys: String, CodingKey {

		case num_flights = "num_flights"
		case flights = "flights"
		case next_offset = "next_offset"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		num_flights = try values.decodeIfPresent(Int.self, forKey: .num_flights)
		flights = try values.decodeIfPresent([Flights].self, forKey: .flights)
		next_offset = try values.decodeIfPresent(Int.self, forKey: .next_offset)
	}

}
