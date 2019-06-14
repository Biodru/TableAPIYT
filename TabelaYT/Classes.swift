//
//  Classes.swift
//  TabelaYT
//
//  Created by Piotr_Brus on 13/06/2019.
//  Copyright © 2019 Piotr_Brus. All rights reserved.
//

import UIKit

class City: Codable {
    
    let name: String
    let description: String
    let photo: String
    
    init(name: String, description: String, photo: String) {
        
        self.name = name
        self.description = description
        self.photo = photo
        
    }

}

class Cities: Codable {
    
    let cities:[City]
    
    init(cities:[City]) {
        
        self.cities = cities
        
    }
    
}
