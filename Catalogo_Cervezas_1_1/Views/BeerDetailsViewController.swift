//
//  BeerDetailsViewController.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 8/1/25.
//

import UIKit

import UIKit

class BeerDetailsViewController: UIViewController {
    private let beer: Beer

    init(beer: Beer) {
        self.beer = beer
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = beer.name
        setupUI()
    }

    private func setupUI() {
        let label = UILabel()
        label.text = "Details for \(beer.name)"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
