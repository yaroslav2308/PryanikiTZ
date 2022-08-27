//
//  DetailViewController.swift
//  PryanikiTZ
//
//  Created by Yaroslav Monastyrev on 27.08.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?

    var text: String = ""
    var index: Int = 0
    var color: UIColor = .white
    
    // Label
    private lazy var selectedIdLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 50)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        configureLayout()
        setProperties()
        self.navigationController?.navigationBar.tintColor = .white;
    }
    
    // Setting label text and navigation bar title 
    private func setProperties() {
        navigationItem.title = text
        selectedIdLabel.text = String(index)
    }
    
    // Configure layout (label)
    private func configureLayout() {
        view.addSubview(selectedIdLabel)
        selectedIdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectedIdLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        selectedIdLabel.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
    }

}

// MARK: - Title color change
extension DetailViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}
