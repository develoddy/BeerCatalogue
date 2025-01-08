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
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.frame = view.bounds
    }
    
    func setupView() {
        view.backgroundColor = .orange
        
        view.addSubview(mainView)
        presenter = MainPresenter(view: self)
        setupTableView()
        presenter?.fetchBeers()
    }
    
    private func setupTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BeerCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath)
        let beer = beers[indexPath.row]
        print("🟢 Configuring cell for beer: \(beer.name)")
        cell.textLabel?.text = beer.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beers[indexPath.row]
        print("🟢 Beer selected: \(selectedBeer.name)")
        presenter?.didSelectBeer(selectedBeer)
    }
}
