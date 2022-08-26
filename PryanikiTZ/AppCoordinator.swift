//
//  AppCoordinator.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import Foundation
import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let vc = ViewController()
        vc.setUpVC(viewModel: PryanikiListDataViewModel())
        let navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
    }
}
