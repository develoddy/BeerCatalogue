//
//  Beer.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 7/1/25.
//

import Foundation

// Estructura para la respuesta de la API (PunkAPI)
/*struct BeerResponse: Decodable {
    let id: Int
    let name: String
    let description: String
    let firstBrewed: String
    let ingredients: Ingredients?
    let imageUrl: String
    
    // Para asegurar que 'ingredients' es opcional (puede no existir en todos los casos)
    struct Ingredients: Decodable {
        let list: String
    }
}*/

// Modelo Beer (que usaremos en la UI)
struct Beer {
    let id: Int
    let name: String
    let description: String
    let firstBrewed: String // Fecha de creación
    let ingredients: String // O una lista de ingredientes, si prefieres
    let imageUrl: String // URL o nombre de la imagen
}

