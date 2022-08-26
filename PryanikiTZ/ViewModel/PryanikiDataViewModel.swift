//
//  PryanikiDataViewModel.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import Foundation
import Alamofire
import RxSwift

class PryanikiListDataViewModel {
    
    var items = BehaviorSubject(value: [DomenData]())
    
    func fetchData() {
        // https://pryaniky.com/static/json/sample.json
        let url = "https://pryaniky.com/static/json/sample.json"
        AF.request(url).responseDecodable(of: PryanikiData.self) { response in
            switch response.result {
            case .success(let value):
                let newItems = self.createItems(dataPrya: value)
                self.items.on(.next(newItems))
            case .failure(let error):
                print("Something went wrong: \(error.localizedDescription)")
            }
        }
    }
    
    private func createItems(dataPrya: PryanikiData) -> [DomenData] {
        var domenDataArray = [DomenData]()
        
        let hzTypeData = dataPrya.data.first { anotherData in
            anotherData.name == .hz
        }!.data
        
        let pictureTypeData = dataPrya.data.first { anotherData in
            anotherData.name == .hz
        }!.data
        
        let selectoeTypeData = dataPrya.data.first { anotherData in
            anotherData.name == .hz
        }!.data
        
        for type in dataPrya.view {
            switch type {
            case .hz:
                domenDataArray.append(DomenData(type: .hz, text: hzTypeData.text, url: hzTypeData.url, selectedId: hzTypeData.selectedId, variants: hzTypeData.variants))
            case .picture:
                domenDataArray.append(DomenData(type: .picture, text: pictureTypeData.text, url: pictureTypeData.url, selectedId: pictureTypeData.selectedId, variants: pictureTypeData.variants))
            case .selector:
                domenDataArray.append(DomenData(type: .selector, text: selectoeTypeData.text, url: selectoeTypeData.url, selectedId: selectoeTypeData.selectedId, variants: selectoeTypeData.variants))
            }
        }
        
        return domenDataArray
    }
}
