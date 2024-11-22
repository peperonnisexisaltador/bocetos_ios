//
//  VideoTableViewCell.swift
//  Final
//
//  Created by alumno on 11/15/24.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var miniaturaImageView: UIImageView!
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    
    @IBOutlet weak var fechaLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell( v:Video){
        
        self.video = v
        
        guard self.video != nil else{
            return
        }
        
        self.tituloLabel.text = video?.titulo
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyyy"
        self.fechaLabel.text = df.string(from: video!.fecha_de_publicacion)
        
        guard self.video!.miniatura != "" else{
            return
        }
        
        let url = URL(string: self.video!.miniatura)
        
        let sesion = URLSession.shared
        
        let dataTask = sesion.dataTask(with: url!) { (data, respuesta, error) in
          
            if error == nil && data != nil{
                
                if url!.absoluteString != self.video?.miniatura{
                    return
                }
                
                
                let imagen = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.miniaturaImageView.image = imagen
                }
            }
        }
        dataTask.resume()
    }

}
