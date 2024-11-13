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
    var fecha_de_publicacion = Date()
    
    enum CodingKeys : String, CodingKey {
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
        let contenedor = try decoder.container(keyedBy: CodingKeys.self)
        
        let contenedorSnippet = try contenedor.nestedContainer(keyedBy:  CodingKeys.self, forKey: .snippet)
        
        // titulo
        self.titulo = try contenedorSnippet.decode(String.self, forKey: .titulo)
        
        //desccripcion
        self .descripcion = try contenedorSnippet.decode(String.self, forKey: .descripcion)
        
        //fecha de publicacion
        self .fecha_de_publicacion = try contenedorSnippet.decode(Date.self, forKey: .fecha_de_publicacion)
        
        //miniaturas
        let contenedorMiniaturas = try contenedorSnippet.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let contenedorAltura = try contenedorMiniaturas.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.miniatura = try contenedorAltura.decode(String.self, forKey: .miniatura)
        
        // id del video
        let contenedorResourceId = try contenedorSnippet.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try contenedorResourceId.decode(String.self, forKey: .videoId)
    }
}
