import Foundation

struct Filed_arrival_time : Codable {
	let epoch : Int?
	let tz : String?
	let dow : String?
	let time : String?
	let date : String?
	let localtime : Int?

	enum CodingKeys: String, CodingKey {

		case epoch = "epoch"
		case tz = "tz"
		case dow = "dow"
		case time = "time"
		case date = "date"
		case localtime = "localtime"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		epoch = try values.decodeIfPresent(Int.self, forKey: .epoch)
		tz = try values.decodeIfPresent(String.self, forKey: .tz)
		dow = try values.decodeIfPresent(String.self, forKey: .dow)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		localtime = try values.decodeIfPresent(Int.self, forKey: .localtime)
	}

}
