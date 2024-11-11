//
//  Video.swift
//  Final
//
//  Created by alumno on 11/11/24.
//

import Foundation
struct Video : Decodable{
    var videoId = ""
    var titulo = ""
    var descripcion = ""
    var miniatura = ""
    var fecha_de_publicacion = ""
    
    enum CodingKeys : String, CodingKey{
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case fecha_de_publicacion = "publishedAt"
        case titulo = "title"
        case descripcion = "description"
        case miniatura = "url"
        case videoId
    }
    init (from decoder: Decoder) throws {
        
        
    }
}
