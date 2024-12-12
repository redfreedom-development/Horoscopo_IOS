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
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func render(_ horoscope: Horoscope) {
        
        nameLb.text = horoscope.name
        dateLb.text = horoscope.dates
        iconImageView.image = horoscope.icon
       
       
        
    }

}
