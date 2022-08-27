//
//  AppCoordinator.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import Foundation
import UIKit

class AppCoordinator {
    var navigationController: UINavigationController
    
    init(nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func start() {
        let vc = ViewController()
        vc.coordinator = self
        vc.setUpVC(viewModel: PryanikiListDataViewModel())
        navigationController.pushViewController(vc, animated: false)
    }
    
    func detailView(text: String, index: Int, color: UIColor) {
        let vc = DetailViewController()
        vc.text = text
        vc.index = index
        vc.color = color
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
