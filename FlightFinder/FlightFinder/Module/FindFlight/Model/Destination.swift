import Foundation

struct Destination : Codable {
	let code : String?
	let city : String?
	let alternate_ident : String?
	let airport_name : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case city = "city"
		case alternate_ident = "alternate_ident"
		case airport_name = "airport_name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		alternate_ident = try values.decodeIfPresent(String.self, forKey: .alternate_ident)
		airport_name = try values.decodeIfPresent(String.self, forKey: .airport_name)
	}

}
