//
//  MainRouter.swift
//  Catalogo_Cervezas_1_1
//
//  Created by Eddy Donald Chinchay Lujan on 8/1/25.
//

import UIKit

class MainRouter: MainRouterProtocol {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func navigateToBeerDetails(with beer: Beer) {
        let detailsViewController = BeerDetailsViewController(beer: beer)
        viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
