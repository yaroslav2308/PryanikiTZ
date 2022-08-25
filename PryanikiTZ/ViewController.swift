//
//  ViewController.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let dataManager = DataManager()
        
        dataManager.fetchData().subscribe { pryaniki in
            print(pryaniki)
        }.disposed(by: disposeBag)

    }


}

