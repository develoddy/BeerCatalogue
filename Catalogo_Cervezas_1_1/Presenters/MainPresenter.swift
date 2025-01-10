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
    private let beerService: BeerService
    private var beers: [Beer] = []

    init(view: MainViewProtocol, router: MainRouterProtocol, beerService: BeerService) {
        self.view = view
        self.router = router
        self.beerService = beerService
    }

    func fetchBeers() {
        print("🟢 fetchBeers() called")
        beers = [
            Beer(id: 1, name: "Punk IPA", description: "A crisp and bitter IPA brewed with English and American hops.", firstBrewed: "2007", ingredients: "Water, Hops, Barley, Yeast", imageUrl: "placeholder-beer"),
            Beer(id: 2, name: "Elvis Juice", description: "A grapefruit-infused American IPA with bold, citrusy flavors.", firstBrewed: "2015", ingredients: "Water, Hops, Grapefruit, Barley, Yeast", imageUrl: "placeholder-beer")
        ]
        
        print("🟢 Beers fetched: \(beers.map { $0.name })")
        view?.displayBeers(beers)
    }
    
    // LLAMAR AL API SERVICE
    /*func fetchBeers() {
        print("🟢 fetchBeers() called")
        
        // Llamada al servicio para obtener las cervezas desde la API
        beerService.fetchBeers { [weak self] beers in
            guard let self = self else { return }
            if let beers = beers {
                print("🟢 Beers fetched: \(beers.map { $0.name })")
                self.beers = beers
                DispatchQueue.main.async {
                    self.view?.displayBeers(beers)
                }
            } else {
                print("🛑 Error fetching beers from API")
            }
        }
    }*/
    
    func didSelectBeer(_ beer: Beer) {
        print("Selected Beer: \(beer.name)")
        // Aquí se manejaría la lógica para navegar a la vista de detalles.
        router.navigateToBeerDetails(with: beer)
    }
}


