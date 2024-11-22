//
//  ControladorPantallaPrincipal.swift
//  Final
//
//  Created by alumno on 11/21/24.
//
import UIKit
class ControladorPantallaPrincipal: UIViewController{
    @IBOutlet weak var outletSegmento: UISegmentedControl!
    
    @IBOutlet weak var inicioSegmentView: UIView!
    
    @IBOutlet weak var registroSegmentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        outletSegmento.setTitleTextAttributes(titleTextAttributes, for: .normal)
        self.view.bringSubviewToFront(inicioSegmentView)
    }
    
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex{
        case 0:
            self.view.bringSubviewToFront(inicioSegmentView)
        case 1:
            self.view.bringSubviewToFront(registroSegmentView)
        default:
            break
        }
    }
}
