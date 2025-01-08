//
//  BeerService.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 7/1/25.
//

import Foundation

class BeerService {
    func fetchBeers(completion: @escaping ([Beer]) -> Void) {
        // Mock API Call
        let beers = [
            Beer(id: 1, name: "Punk IPA", firstBrewed: "2007"),
            Beer(id: 2, name: "Elvis Juice", firstBrewed: "2015")
        ]
        completion(beers)
    }
}
