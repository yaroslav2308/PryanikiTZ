//
//  ImageTableViewCell.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 27.08.2022.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    var data: DomenData?
    
    override func layoutSubviews() {
        textFromData.textColor = .white
        guard let safeData = data else { print("Unsafe data"); return }
        backgroundColor = safeData.backgroundColor
        textFromData.text = safeData.text
        guard let url = URL(string: safeData.url!) else { return }
        imageFromData.load(url: url)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var imageFromData: UIImageView!
    
    @IBOutlet weak var textFromData: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
