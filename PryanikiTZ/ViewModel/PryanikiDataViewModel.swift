//
//  PryanikiDataViewModel.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import Foundation
import Alamofire
import RxSwift
import UIKit

class PryanikiListDataViewModel {
    
    var someData = BehaviorSubject(value: [DomainData]())
    
    // MARK: - Networking using Alamofire
    func fetchData() {
        // https://pryaniky.com/static/json/sample.json
        let url = "https://pryaniky.com/static/json/sample.json"
        AF.request(url).responseDecodable(of: PryanikiData.self) { response in
            switch response.result {
            case .success(let value):
                let newItems = self.createItems(dataPrya: value)
                self.someData.on(.next(newItems))
            case .failure(let error):
                print("Something went wrong: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Creating DomainData to use it in app insteed networking one
    private func createItems(dataPrya: PryanikiData) -> [DomainData] {
        var domainDataArray = [DomainData]()
        
        let hzTypeData = dataPrya.data.first { anotherData in
            anotherData.name == .hz
        }!.data
        
        let pictureTypeData = dataPrya.data.first { anotherData in
            anotherData.name == .picture
        }!.data
        
        let selectoeTypeData = dataPrya.data.first { anotherData in
            anotherData.name == .selector
        }!.data
        
        for type in dataPrya.view {
            switch type {
            case .hz:
                domainDataArray.append(DomainData(type: .hz, text: hzTypeData.text, url: hzTypeData.url, selectedId: hzTypeData.selectedId, variants: hzTypeData.variants, backgroundColor: .systemBlue))
            case .picture:
                domainDataArray.append(DomainData(type: .picture, text: pictureTypeData.text, url: pictureTypeData.url, selectedId: pictureTypeData.selectedId, variants: pictureTypeData.variants, backgroundColor: .systemPurple))
            case .selector:
                domainDataArray.append(DomainData(type: .selector, text: selectoeTypeData.text, url: selectoeTypeData.url, selectedId: selectoeTypeData.selectedId, variants: selectoeTypeData.variants, backgroundColor: .systemPink))
            }
        }
        
        return domainDataArray
    }

    // MARK: - Binding tableView
    func bind(tableView: UITableView, coordinator: AppCoordinator?, disposeBag: DisposeBag) {
        self.someData
            .bind(to: tableView.rx.items) { (tv, row, item) -> UITableViewCell in
                switch item.type {
                case .hz:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "hzCell", for: IndexPath.init(row: row, section: 0)) as! HzTableViewCell
                    cell.data = item
                    cell.selectionStyle = .none
                    return cell
                case .picture:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: IndexPath.init(row: row, section: 0)) as! ImageTableViewCell
                    cell.data = item
                    cell.selectionStyle = .none
                    return cell
                case .selector:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "selectorCell", for: IndexPath.init(row: row, section: 0)) as! SelectorTableViewCell
                    cell.data = item
                    cell.selectionStyle = .none
                    return cell
                }
            }.disposed(by: disposeBag)
        
        bindSelectedRow(tableView: tableView, coordinator: coordinator, disposeBag: disposeBag)
    }

    // MARK: - Bind row seelction
    private func bindSelectedRow(tableView: UITableView, coordinator: AppCoordinator?, disposeBag: DisposeBag) {
        tableView.rx.itemSelected
                            .subscribe(onNext: { [weak self] indexPath in
                                guard let data = try? self?.someData.value()[indexPath.row] else { return }
                                let name = data.type.rawValue
                                let color = data.backgroundColor
                                coordinator?.detailView(text: name, index: indexPath.row, color: color)
                            }).disposed(by: disposeBag)
    }
}
