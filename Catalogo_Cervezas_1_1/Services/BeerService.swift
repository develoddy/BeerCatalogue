//
//  BeerService.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 7/1/25.
//

import Foundation

class BeerService {
    func fetchBeers(completion: @escaping ([Beer]) -> Void) {
        let beers = [
            Beer(id: 1, name: "Punk IPA", description: "A crisp and bitter IPA brewed with English and American hops.", firstBrewed: "2007", ingredients: "Water, Hops, Barley, Yeast", imageUrl: "placeholder-beer"),
            Beer(id: 2, name: "Elvis Juice", description: "A grapefruit-infused American IPA with bold, citrusy flavors.", firstBrewed: "2015", ingredients: "Water, Hops, Grapefruit, Barley, Yeast", imageUrl: "placeholder-beer")
        ]
        completion(beers)
    }
}

// API Service
/*class BeerService {
    func fetchBeers(completion: @escaping ([Beer]?) -> Void) {
        let urlString = "https://api.punkapi.com/v2/beers"
        
        guard let url = URL(string: urlString) else {
            print("🛑 Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Manejo de errores
            if let error = error {
                print("🛑 Error fetching beers: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("🛑 No data received")
                completion(nil)
                return
            }
            
            do {
                // Decodificar los datos JSON
                let decoder = JSONDecoder()
                let beerResponses = try decoder.decode([BeerResponse].self, from: data)
                
                // Mapear a un arreglo de Beer
                let beers = beerResponses.map { beerResponse in
                    Beer(
                        id: beerResponse.id,
                        name: beerResponse.name,
                        description: beerResponse.description,
                        firstBrewed: beerResponse.firstBrewed,
                        ingredients: beerResponse.ingredients?.list ?? "",
                        imageUrl: beerResponse.imageUrl
                    )
                }
                
                // Pasar las cervezas decodificadas
                completion(beers)
            } catch {
                print("🛑 Error decoding data: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}*/

