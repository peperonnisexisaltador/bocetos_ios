//
//  cita.swift
//  boceto_1
//
//  Created by alumno on 9/23/24.
//

import Foundation
struct Cita{
    var nombre: String
    
    var texto: String
    
    init(quien_lo_dijo: String, que_dijo: String){
        nombre = quien_lo_dijo
        texto = que_dijo
    }
}
