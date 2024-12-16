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
        cargarApi(tipo: "daily")
        
        
      
    }
    
    @IBAction func btDay(_ sender: Any) {
        cargarApi(tipo: "daily")
    }
    
    @IBAction func btSemanal(_ sender: Any) {
        cargarApi(tipo: "weekly")
    }
    
    @IBAction func btMensual(_ sender: Any) {
        cargarApi(tipo: "monthly")
    }
    
    func cargarApi(tipo:String){
        // Mostrar un indicador de carga (opcional)
               txtHoroscopeDescription.text = "Cargando horóscopo..."

               
               // Llamar al servicio para obtener el horóscopo
               horoscopeService.fetchHoroscope(for: horoscope.name, timeFrame: tipo) { result in
                   DispatchQueue.main.async {
                       switch result {
                       case .success(let data):
                           // Mostrar los datos obtenidos en la interfaz
                           self.txtHoroscopeDescription.text = data.horoscopeData // Descripción del horóscopo
                       case .failure(let error):
                           // Mostrar un error en caso de que falle la solicitud
                        
                           self.txtHoroscopeDescription.text = "Error: \(error.localizedDescription)"
                       }
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
