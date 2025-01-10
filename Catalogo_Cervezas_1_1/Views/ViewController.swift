//
//  ViewController.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 13/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var presenter: MainPresenterProtocol?
    private var beers: [Beer] = []
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.title = "Catálogo de cervezas"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.frame = view.bounds
    }
    
    func setupView() {
        view.backgroundColor = .orange
        view.addSubview(mainView)
        
        let router = MainRouter(viewController: self)
        let beerService = BeerService()
        presenter = MainPresenter(view: self, router: router, beerService: beerService)
        
        setupTableView()
        presenter?.fetchBeers()
    }
    
    private func setupTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: BeerTableViewCell.identifier)
    }
}

// MARK: - MainViewProtocol
extension ViewController: MainViewProtocol {
    func displayBeers(_ beers: [Beer]) {
        print("displayBers: \(beers)")
        self.beers = beers
        mainView.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("beers.count: \(beers.count)")
        return beers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeuing de manera opcional
        if let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for: indexPath) as? BeerTableViewCell {
            let beer = beers[indexPath.row]
            print("🟢 Configuring cell for beer: \(beer.name)")

            // Asignar los valores de las etiquetas
            cell.nameLabel.text = beer.name
            cell.detailLabel.text = "Creada en: \(beer.firstBrewed)"
            
            return cell
        } else {
            // En caso de que no se pueda hacer el casting correctamente
            return UITableViewCell() // Puedes retornar una celda por defecto si lo prefieres
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beers[indexPath.row]
        print("🟢 Beer selected: \(selectedBeer.name)")
        presenter?.didSelectBeer(selectedBeer)
    }
}
