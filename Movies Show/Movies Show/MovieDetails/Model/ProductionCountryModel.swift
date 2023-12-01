//
//  ProductionCountryModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation

// MARK: - ProductionCountry
struct ProductionCountryModel: Codable {
    var iso3166_1, name: String?

    enum ProductionCountryModelKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: ProductionCountryModelKeys.self)
        self.iso3166_1 = try? container?.decodeIfPresent(String.self, forKey: .iso3166_1)
        self.name = try? container?.decodeIfPresent(String.self, forKey: .name)
    }
}
