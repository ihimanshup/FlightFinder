import Foundation

struct Flights : Codable {
	let num_segments : Int?
	let segments : [Segments]?

	enum CodingKeys: String, CodingKey {

		case num_segments = "num_segments"
		case segments = "segments"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		num_segments = try values.decodeIfPresent(Int.self, forKey: .num_segments)
		segments = try values.decodeIfPresent([Segments].self, forKey: .segments)
	}

}
