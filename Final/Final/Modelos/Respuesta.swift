//
//  Respuesta.swift
//  Final
//
//  Created by alumno on 11/13/24.
//

import Foundation
struct Respuesta:  Decodable {
    var items: [Video]?
    enum CodingKeys: String, CodingKey{
        case items
    }
    init (from decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
