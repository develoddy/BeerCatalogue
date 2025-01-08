//
//  MainPresenter.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 7/1/25.
//

import Foundation

// MainPresenter.swift
import Foundation



class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    private let router: MainRouterProtocol
    private var beers: [Beer] = []

    init(view: MainViewProtocol, router: MainRouterProtocol) {
        self.view = view
        self.router = router
    }

    func fetchBeers() {
        print("🟢 fetchBeers() called")
        // Mock data
        beers = [
            Beer(id: 1, name: "Punk IPA", firstBrewed: "2007"),
            Beer(id: 2, name: "Elvis Juice", firstBrewed: "2015")
        ]
        
        print("🟢 Beers fetched: \(beers.map { $0.name })")
        view?.displayBeers(beers)
    }
    
    func didSelectBeer(_ beer: Beer) {
        print("Selected Beer: \(beer.name)")
        // Aquí se manejaría la lógica para navegar a la vista de detalles.
        router.navigateToBeerDetails(with: beer)
    }
}


