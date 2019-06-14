//
//  ViewController.swift
//  TabelaYT
//
//  Created by Piotr_Brus on 01/06/2019.
//  Copyright © 2019 Piotr_Brus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    final let url = URL(string: "http://my-json-server.typicode.com/Biodru/api/db")

    var citiesArray = [City]()
    
    @IBOutlet weak var citiesTable: UITableView!
    
    //MARK: - Funkcje tabeli
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return citiesArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CitiesCell else {
            
            return UITableViewCell()
            
        }
        
        cell.nameLabel.text = citiesArray[indexPath.row].name
        cell.descLabel.text = citiesArray[indexPath.row].description
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(citiesArray[indexPath.row].name)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON()
        
    }
    
    //MARK: - Pobieranie danych
    
    func downloadJSON() {
        
        guard let downloadURL = url else {return}
        
        URLSession.shared.dataTask(with: downloadURL) {data, response, error in
            
            guard let data = data, error == nil, response != nil else {
                
                print("error")
                return
                
            }
            
            print("Got data!")
            
            do {
                
                let decoder = JSONDecoder()
                let downloadedCities = try decoder.decode(Cities.self, from: data)
                self.citiesArray = downloadedCities.cities
                DispatchQueue.main.async {
                    self.citiesTable.reloadData()
                }
                print(downloadedCities.cities[0].name)
                
            } catch {
                print("error after downloading data")
            }
            
        }.resume()
        
    }


}

