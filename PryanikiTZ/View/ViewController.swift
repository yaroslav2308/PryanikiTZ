//
//  ViewController.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    
    private let disposeBag = DisposeBag()
    private var viewModel: PryanikiListDataViewModel!
    
    func setUpVC(viewModel: PryanikiListDataViewModel) {
        self.viewModel = viewModel
    }
    
    // Table View
    private lazy var tableView: UITableView = {
        let someTable = UITableView()
        someTable.translatesAutoresizingMaskIntoConstraints = false
        // Custom cells registration
        someTable.register(UINib.init(nibName: "HzTableViewCell", bundle: nil), forCellReuseIdentifier: "hzCell")
        someTable.register(UINib.init(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "imageCell")
        someTable.register(UINib.init(nibName: "SelectorTableViewCell", bundle: nil), forCellReuseIdentifier: "selectorCell")
        return someTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = "PRYANIKI TZ"
        configureLayout()
        
        // fetching data and binding tableView
        viewModel.fetchData()
        viewModel.bind(tableView: tableView, coordinator: coordinator, disposeBag: disposeBag)
    }
    
    // Configure Layout
    private func configureLayout() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// TableView Delegate
extension ViewController: UITableViewDelegate { }

