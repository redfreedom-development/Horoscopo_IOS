//
//  ViewController.swift
//  HoroscopoXcode
//
//  Created by Tardes on 12/12/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    var horoscopeList: [Horoscope] = Horoscope.getAll()
  
    
    
    @IBOutlet weak var imgFavorito: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        //implementacion barra de busqueda
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horoscopeList.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
        
        let horoscope=horoscopeList[indexPath.row]
        
        cell.render(horoscope)
        
        
        return cell
        
        }
    
    // MARK: SearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) {
            horoscopeList = Horoscope.getAll()
        } else {
            // BUSCA SOLO POR EL NOMBRE DEL HOROSCOPO
            /*horoscopeList = Horoscope.getAll().filter({ horoscope in
                horoscope.name.range(of: searchText, options: .caseInsensitive) != nil
            })*/
            
            //BUSCA TANTO EN EL NOMBRE COMO EN LAS FECHAS
           horoscopeList = Horoscope.getAll().filter { horoscope in
                let searchTextLowercased = searchText.lowercased()
                let nameMatches = horoscope.name.lowercased().range(of: searchTextLowercased) != nil
                let dateMatches = horoscope.dates.lowercased().range(of: searchTextLowercased) != nil
                return nameMatches || dateMatches
            }
            
            
            
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        horoscopeList = Horoscope.getAll()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail"{
            
            let detailViewController = segue.destination as! DetailViewController
            
            let indexPath = tableView.indexPathForSelectedRow!
            let horoscopo = horoscopeList[indexPath.row]
            detailViewController.horoscope = horoscopo
            
            
            
            
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Recargar las celdas para reflejar cambios en la sesión
        tableView.reloadData()
    }
}
