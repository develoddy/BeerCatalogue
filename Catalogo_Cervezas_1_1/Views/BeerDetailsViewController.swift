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
    
    // UI Elements
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let ingredientsLabel = UILabel()

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

    /*private func setupUI() {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }*/
    
    private func setupUI() {
        // Configurar ImageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: beer.imageUrl) // Usando la imagen de la cerveza (ajusta la URL según sea necesario)
        view.addSubview(imageView)

        // Configurar Descripción
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Description: \(beer.description)" // Asegúrate de que tu modelo Beer tenga una propiedad de descripción
        descriptionLabel.textAlignment = .center
        view.addSubview(descriptionLabel)
        
        // Configurar Ingredientes
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.numberOfLines = 0
        ingredientsLabel.text = "Ingredientes: \(beer.ingredients)" // Asegúrate de que tu modelo Beer tenga una propiedad de ingredientes
        ingredientsLabel.textAlignment = .center
        view.addSubview(ingredientsLabel)

        // Establecer las restricciones para la imagen y las etiquetas
        NSLayoutConstraint.activate([
            // Imagen
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Descripción
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Ingredientes
            ingredientsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            ingredientsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ingredientsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}
