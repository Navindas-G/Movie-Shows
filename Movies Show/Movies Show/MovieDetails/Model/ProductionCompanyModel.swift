//
//  ProductionCompanyModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation
// MARK: - ProductionCompany
struct ProductionCompanyModel: Codable, Identifiable, Hashable {
    var id: Int?
    var logoPath: String?
    var name, originCountry: String?

    enum ProductionCompanyModelKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: ProductionCompanyModelKeys.self)
        self.id = try? container?.decodeIfPresent(Int.self, forKey: .id)
        self.logoPath = try? container?.decodeIfPresent(String.self, forKey: .logoPath)
        self.name = try? container?.decodeIfPresent(String.self, forKey: .name)
        self.originCountry = try? container?.decodeIfPresent(String.self, forKey: .originCountry)
    }
}
