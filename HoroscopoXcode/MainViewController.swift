//
//  ViewController.swift
//  HoroscopoXcode
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let horoscopeList: [Horoscope] = Horoscope.getAll()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
        
        let horoscope=horoscopeList[indexPath.row]
        
        cell.render(horoscope)
        
        
        return cell
        
        
        
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail"{
            
            let detailViewController = segue.destination as! DetailViewController
            
            let indexPath = tableView.indexPathForSelectedRow!
            let horoscopo = horoscopeList[indexPath.row]
            detailViewController.horoscope = horoscopo
            
            
            
            
            
        }
        
    }
}
