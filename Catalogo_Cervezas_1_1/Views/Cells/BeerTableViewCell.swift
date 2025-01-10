//
//  BeerTableViewCell.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 8/1/25.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    static let identifier = "BeerTableViewCell"
    let nameLabel = UILabel()
    let detailLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        // Configurar las etiquetas
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        contentView.addSubview(detailLabel)
        
        // Configurar el color gris para detailLabel
        detailLabel.textColor = .gray

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

