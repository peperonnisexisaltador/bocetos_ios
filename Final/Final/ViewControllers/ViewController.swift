//
//  ViewController.swift
//  Final
//
//  Created by alumno on 11/11/24.
//

import UIKit


class ControladorYoutube: UIViewController, UITableViewDataSource, UITableViewDelegate, ModeloDelegate {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    var modelo = Modelo()
    var videos = [Video]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
      
        modelo.delegate = self
        
        modelo.obtenerVideos()
    }
    //Modelo delegate
    
    func VideosAtrapados(_ videos: [Video]) {
    
        self.videos = videos
        
        tableView.reloadData()
    }
    
    
    //Metodo del TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: Constantes.CELDAVIDEO_ID, for: indexPath) as!VideoTableViewCell
       
        let video = self.videos[indexPath.row]
        
        celda.setCell(v: video)
        
        return celda
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

