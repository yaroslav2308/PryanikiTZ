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
    // MARK: - Table View
    private lazy var tableView: UITableView = {
        let someTable = UITableView()
        someTable.translatesAutoresizingMaskIntoConstraints = false
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
        viewModel.fetchData()
        bindTableView()
        didTapBind()

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
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.someData
            .bind(to: tableView.rx.items) { (tv, row, item) -> UITableViewCell in
                switch item.type {
                case .hz:
                    let cell = self.tableView.dequeueReusableCell(withIdentifier: "hzCell", for: IndexPath.init(row: row, section: 0)) as! HzTableViewCell
                    cell.data = item
                    cell.selectionStyle = .none
                    return cell
                case .picture:
                    let cell = self.tableView.dequeueReusableCell(withIdentifier: "imageCell", for: IndexPath.init(row: row, section: 0)) as! ImageTableViewCell
                    cell.data = item
                    cell.selectionStyle = .none
                    return cell
                case .selector:
                    let cell = self.tableView.dequeueReusableCell(withIdentifier: "selectorCell", for: IndexPath.init(row: row, section: 0)) as! SelectorTableViewCell
                    cell.data = item
                    cell.selectionStyle = .none
                    return cell
                }
            }.disposed(by: disposeBag)
    }
    
    func didTapBind() {
        tableView.rx.itemSelected
                            .subscribe(onNext: { [weak self] indexPath in
                                print("HELLO")
                                guard let data = try? self?.viewModel.someData.value()[indexPath.row] else { return }
                                let name = data.type.rawValue
                                let color = data.backgroundColor
                                print("HEEELLLL" + name)
                                self?.coordinator?.detailView(text: name, index: indexPath.row, color: color)
                            }).disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let data = try? viewModel.someData.value()[indexPath.row] else { return }
//        let name = data.type.rawValue
//        let color = data.backgroundColor
//        coordinator?.detailView(text: name, index: indexPath.row, color: color)
//    }
}

