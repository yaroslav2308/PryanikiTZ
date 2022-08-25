//
//  DataManager.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 25.08.2022.
//

import Foundation
import RxSwift
import Alamofire

class DataManager {
    
    func fetchData() -> Observable<PryanikiData> {
        
        return Observable.create { observer in
            // https://pryaniky.com/static/json/sample.json
            let url = "https://pryaniky.com/static/json/sample.json"
            AF.request(url).responseDecodable(of: PryanikiData.self) { response in
                guard response.error == nil else {
                    observer.onError(response.error as! Error)
                    return
                }
                
                guard let data = response.value else {
                    observer.onError(NSError(domain: "", code: -2, userInfo: nil))
                    return
                }
                
                observer.onNext(data)
            }
            return Disposables.create()
        }
    }
}
