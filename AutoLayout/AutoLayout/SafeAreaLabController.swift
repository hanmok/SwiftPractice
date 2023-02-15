//
//  SafeAreaLab.swift
//  AutoLayout
//
//  Created by Mac mini on 2023/02/15.
//

import UIKit

class SafeAreaLabController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        let topLabel = makeLabel(withText: "top")
        view.addSubview(topLabel)
//        topLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        
        // Challenge: Add a bottom label
        
        let bottomLabel = makeLabel(withText: "Bottom")
        view.addSubview(bottomLabel)
        
        let leadingLabel = makeLabel(withText: "Leading")
        view.addSubview(leadingLabel)
        
        let trailingLabel = makeLabel(withText: "Trailing")
        view.addSubview(trailingLabel)
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leadingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            leadingLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            trailingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trailingLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }
}
