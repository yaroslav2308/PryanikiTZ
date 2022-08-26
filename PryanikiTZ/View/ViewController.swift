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
    
    let disposeBag = DisposeBag()
    private var viewModel: PryanikiListDataViewModel!
    
    func setUpVC(viewModel: PryanikiListDataViewModel) {
        self.viewModel = viewModel
    }
    // MARK: - Table View
    private lazy var tableView: UITableView = {
        let someTable = UITableView()
        someTable.translatesAutoresizingMaskIntoConstraints = false
        someTable.register(ItemTableViewCell.self, forCellReuseIdentifier: "cell")
        return someTable
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureLayout()
        viewModel.fetchData()

    }
    
    // MARK: - Configure Layout
    private func configureLayout() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension ViewController {
    func bindTableView() {
        
    }
}

