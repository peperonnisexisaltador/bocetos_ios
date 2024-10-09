//
//  ControladorPantallaPrincipalDecoleccion.swift
//  boceto_2
//
//  Created by alumno on 10/9/24.
//

import UIKit

private let identificador_de_celdas = "celda_pantalla_principal"

class ControladorPantallaPrincipalDecoleccion: UICollectionViewController {
    private var  lista_de_publicaciones: [Publicacion] = []
    private let url_de_publicaciones =
    "https://json.placeholder.typicode.com/posts"
    private let identificador_de_celdas = "celda_pantalla principal"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let ubicacion. URL(string: url_de_publicaciones)!
        URLSession.shared.dataTask(with: ubicacion){(datos,respuesta, error) in do{
            if let publicaciones_recibidas = datos{
                let prueba_de_interpretacion_de_Datos = try JSONDecoder().decode ([Publicacion].self, from: publicaciones_recibidas)
            DispatchQueue.main.async{self.lista_de_publicaciones = prueba_de_interpretacion_de_datos}
            }
        }
            else{
                print(respuesta)
            }
            catch{
                print("Error")
            }
        }.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda :VistaDeZelda = collectionView.dequeueReusableCell(withReuseIdentifier: identificador_de_celdas, for: indexPath) as! VistaDeZelda
       
        celda.etiqueta.text = "\(indexPath)"
    
        return celda
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print ("Se selecciono la celda \(indexPath)")
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
