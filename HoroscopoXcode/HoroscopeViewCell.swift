//
//  HoroscopeViewCell.swift
//  HoroscopoXcode
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    
    @IBOutlet weak var imgFavorite: UIImageView!
    
    var sesion:SessionManager!

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func render(_ horoscope: Horoscope) {
        
        sesion=SessionManager()
        
        nameLb.text = horoscope.name
        dateLb.text = horoscope.dates
        iconImageView.image = horoscope.icon
        
        //para desocultar el corazon imagen de favorito
        if(sesion.isFavorite(horoscopeId: horoscope.id)){
            imgFavorite.isHidden=false
           
        }
        else{
            imgFavorite.isHidden=true
           
        }
       
       
        
    }

}
