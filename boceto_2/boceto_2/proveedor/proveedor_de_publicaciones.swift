//
//  provedor_publicaciones.swift
//  boceto_2_CellView
//
//  Created by Jadzia Gallegos on 09/10/24.
//

import Foundation
import UIKit

class ProveedorDePublicaciones{
    let url_de_publicaciones = "https://jsonplaceholder.typicode.com/posts"
    var  lista_de_publicaciones: [Publicacion] = []
    
    /*
    static var autoreferencia: ProveedorDePublicaciones = {
        // Esta version es solo para añadir configuracion o cosas importatnes durante la inicializacion
        let instancia = ProveedorDePublicaciones()
        return instancia
    }()
     */
    static var autoreferencia = ProveedorDePublicaciones()
    
    private init() {}
    
    func obtener_publicaicones(que_hacer_al_recibir: @escaping ([Publicacion]) -> Void) {
    // func obtener_publicaicones() async throws -> [Publicacion] {
        let ubicacion = URL(string: "\(url_de_publicaciones)posts")!
        URLSession.shared.dataTask(with: ubicacion) {
                (datos, respuesta, error) in do {
                    if let publicaciones_recibidas = datos{
                        let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Publicacion].self, from: publicaciones_recibidas)
                        
                        self.lista_de_publicaciones = prueba_de_interpretacion_de_datos
                        que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                    }
                    else {
                        print(respuesta)
                    }
                } catch {
                    print("Error")
                }
        }.resume()
    }
    func obtener_publicacion(id: Int, que_hacer_al_recibir: @escaping (Publicacion) -> Void) {
           /// Acmodamos la url para descargar en esta funcion los post directamente
           let ubicacion = URL(string: "\(url_de_publicaciones)posts/\(id)")!
           URLSession.shared.dataTask(with: ubicacion) {
                   (datos, respuesta, error) in do {
                       if let publicaciones_recibidas = datos{
                           let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(Publicacion.self, from: publicaciones_recibidas)
                           
                           que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                       }
                       else {
                           print(respuesta)
                       }
                   } catch {
                       print("Error")
                   }
           }.resume()
       }
       
    func obtener_usuario(id: Int, que_hacer_al_recibir: @escaping (Usuario) -> Void) {
            /// Acmodamos la url para descargar en esta funcion los post directamente
            let ubicacion = URL(string: "\(url_de_publicaciones)users/\(id)")!
            URLSession.shared.dataTask(with: ubicacion) {
                    (datos, respuesta, error) in do {
                        if let publicaciones_recibidas = datos{
                            let prueba_de_interpretacion_de_datos = try JSONDecoder().decode(Usuario.self, from: publicaciones_recibidas)
                            
                            que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                        }
                        else {
                            print(respuesta)
                        }
                    } catch {
                        print("Error :)")
                    }
            }.resume()
        }
    }
    
func realizar_subida_de_publicacion(publicaicon_nueva: Publicacion) {
       // func obtener_publicaicones() async throws -> [Publicacion] {
       let ubicacion = URL(string: url_de_publicaciones)!
       URLSession.shared.dataTask(with: ubicacion) {
           (datos, respuesta, error) in do {}
       }.resume()
       
   }
func obtener_cmentarios_en_publicaciones(id_ Int, que_hacer_al_recibir: @escaping ([Comentario]) -> Void) {
// func obtener_publicaicones() async throws -> [Publicacion] {
    let ubicacion = URL(string: "\(url_de_publicaciones)posts/\(id)/comments")!
    URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {
                if let publicaciones_recibidas = datos{
                    let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Comentario].self, from: publicaciones_recibidas)
                    
                    
                    que_hacer_al_recibir(prueba_de_interpretacion_de_datos)
                }
                else {
                    print(respuesta)
                }
            } catch {
                print("Error")
            }
    }.resume()
}
