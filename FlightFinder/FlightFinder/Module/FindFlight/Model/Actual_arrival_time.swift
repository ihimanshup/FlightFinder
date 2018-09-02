import Foundation

struct Actual_arrival_time : Codable {
	let epoch : Int?

	enum CodingKeys: String, CodingKey {

		case epoch = "epoch"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		epoch = try values.decodeIfPresent(Int.self, forKey: .epoch)
	}

}
