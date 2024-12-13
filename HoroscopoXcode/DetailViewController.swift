//
//  DetailViewController.swift
//  HoroscopoXcode
//
//  Created by Tardes on 13/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope:Horoscope!
    @IBOutlet weak var imgHoroscopo: UIImageView!
    
    @IBOutlet weak var lbDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title=horoscope.name
        imgHoroscopo.image=horoscope.icon
        lbDate.text=horoscope.dates
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
