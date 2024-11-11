//
//  ViewController.swift
//  Final
//
//  Created by alumno on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    
    var modelo = Modelo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
        modelo.obtenerVideos()
    }


}

