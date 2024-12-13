//
//  DetailViewController.swift
//  HoroscopoXcode
//
//  Created by Tardes on 13/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope:Horoscope!
    var horoscopeService = HoroscopeService()
    
    @IBOutlet weak var imgHoroscopo: UIImageView!
    @IBOutlet weak var lbDate: UILabel!
    
    @IBOutlet weak var txtHoroscopeDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title=horoscope.name
        imgHoroscopo.image=horoscope.icon
        lbDate.text=horoscope.dates
        // Do any additional setup after loading the view.
        
        
        // Llamar al servicio para obtener el horóscopo de Aries
        horoscopeService.fetchHoroscope(for: "\(horoscope.name)", on: "TODAY") { [self] result in
                   switch result {
                   case .success(let horoscopeData):
                       print("Fecha: \(horoscopeData.date)")
                       print("Horóscopo: \(horoscopeData.horoscopeData)")
                       DispatchQueue.main.async {
                           self.txtHoroscopeDescription.text=horoscopeData.horoscopeData
                       }
                       
                       // Aquí puedes actualizar la UI con los datos del horóscopo
                   case .failure(let error):
                       print("Error al obtener el horóscopo: \(error)")
                   }
               }
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
