//
//  Modelo.swift
//  Final
//
//  Created by alumno on 11/11/24.
//

import Foundation
class Modelo {
    func obtenerVideos (){
        
        let url = URL (string: Constantes.URL_API)
        guard url != nil else {
            return
        }
        
        let sesion = URLSession.shared
        
        let dataTask = sesion.dataTask(with: url!) { (data, response, error)in
        
            
            if error != nil || data == nil {
                return
            }
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
               let respuesta = try decoder.decode(Respuesta.self, from: data!)
                dump(response)
            }
            catch{
                
            }
            
        }
        
        
        dataTask.resume()
        
    }
    
}
