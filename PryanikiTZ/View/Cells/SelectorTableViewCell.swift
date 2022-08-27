//
//  SelectorTableViewCell.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 27.08.2022.
//

import UIKit
import RxCocoa

class SelectorTableViewCell: UITableViewCell {
    
    var data: DomenData?
    var pickerData: [Variant] = [Variant]()
    
    override func layoutSubviews() {
        guard let safeData = data else { print("Unsafe data"); return }
        pickerData = safeData.variants ?? [Variant]()
        selectorFromData.delegate = self
        selectorFromData.dataSource = self
        backgroundColor = safeData.backgroundColor
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var selectorFromData: UIPickerView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SelectorTableViewCell: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].text
    }
}
