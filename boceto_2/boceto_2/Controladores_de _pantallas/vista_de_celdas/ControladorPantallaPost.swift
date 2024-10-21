//
//  ControladorPantallaPost.swift
//  boceto_2
//
//  Created by alumno on 10/14/24.
//

import UIKit

class ControladorPantallaPost: UIViewController {
    
    let proveedor_publicaciones =  ProveedorDePublicaciones.autoreferencia
    
    @IBOutlet weak var titulo_de_publicacion: UILabel!
    @IBOutlet weak var cuerpo_de_publicacion: UILabel!
    @IBOutlet weak var nombre_de_usuario: UILabel!
    @IBOutlet weak var seccion_comentarios: UILabel!
    public var id_publicacion: Int?
    
    private var publicacion: Publicacion?
    private var usuario: Usuario?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(actviar: true)
        
        
        realizar_descarga_de_informacion()
    }
    
    func realizar_descarga_de_informacion(){
        if self.publicacion == nil {
            proveedor_publicaciones.obtener_publicaicones(id: self.id_publicacion ?? -1, que_hacer_al_recibir: {
                [weak self] (publicacion) in self?.publicacion = publicacion
                DispatchQueue.main.async {
                    self?.dibujar_publicacion()
                }
            })
        }
        
        else if self.publicacion != nil{
            proveedor_publicaciones.obtener_usuario(id: publicacion!.userid, que_hacer_al_recibir: {[weak self] (usuario)in self?.usuario = usuario
                DispatchQueue.main.async {
                    self?.dibujar_publicacion()
                }
                
                }}
        }
        
        
    }
    
    func dibujar_publicacion(){
        guard let publicacion_actual = self.publicacion else
        {
            return
        }
        titulo_de_publicacion.text = publicacion_actual.title
}
