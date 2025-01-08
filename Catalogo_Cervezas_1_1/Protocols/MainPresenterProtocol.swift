//
//  MainPresenterProtocol.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 8/1/25.
//

import Foundation
protocol MainPresenterProtocol: AnyObject {
    func fetchBeers()
    func didSelectBeer(_ beer: Beer)
}
