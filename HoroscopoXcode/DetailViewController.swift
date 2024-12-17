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
    var sesion:SessionManager!
  
    
    
    @IBOutlet weak var imgHoroscopo: UIImageView!
    @IBOutlet weak var lbDate: UILabel!
    
    @IBOutlet weak var txtHoroscopeDescription: UITextView!
    
    
    @IBOutlet weak var btFavorite: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title=horoscope.name
        imgHoroscopo.image=horoscope.icon
        lbDate.text=horoscope.dates
        // Do any additional setup after loading the view.
        cargarApi(tipo: "daily")
        sesion = SessionManager()
        
        cambio_corazon_favorito()
            
            
            
        
        
        
      
    }
    
    func cambio_corazon_favorito(){
        
        if(sesion.isFavorite(horoscopeId: horoscope.id)){
            btFavorite.image = UIImage(systemName: "heart.fill")
            btFavorite.tintColor = UIColor.red // Cambiar el color
        }
        else{
            
            
            btFavorite.image = UIImage(systemName: "heart")
            btFavorite.tintColor = UIColor.red // Cambiar el color
        }
    }
    
    
    @IBAction func pulsar_favorito(_ sender: Any) {
        
        if(sesion.isFavorite(horoscopeId: horoscope.id)){
            sesion.setFavorite(horoscopeId: "")
         
            
        }
        else{
            
            sesion.setFavorite(horoscopeId: horoscope.id)
           
        }
        cambio_corazon_favorito()
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
