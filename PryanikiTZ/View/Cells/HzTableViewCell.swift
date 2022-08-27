//
//  HzTableViewCell.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 27.08.2022.
//

import UIKit

class HzTableViewCell: UITableViewCell {
    
    var data: DomenData?
    
    override func layoutSubviews() {
        textFromData?.textColor = .white
        guard let safeData = data else { print("Unsafe data"); return }
        backgroundColor = safeData.backgroundColor
        textFromData?.text = safeData.text
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var textFromData: UILabel?
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
