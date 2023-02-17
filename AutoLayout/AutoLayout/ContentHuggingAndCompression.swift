//
//  ContentHuggingAndCompression.swift
//  AutoLayout
//
//  Created by Mac mini on 2023/02/16.
//

import UIKit

class ContentHuggingAndCompression: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        let nameLabel = makeLabel(withText: "Name")
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        // Content Hugging and Compression Resistance for label and textField is the same before.
//        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        nameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        
        let textField = makeTextField(withPlaceHolderText: "Enter name here")
        view.addSubview(textField)
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        textField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8).isActive = true
        
        textField.firstBaselineAnchor.constraint(equalTo: nameLabel.firstBaselineAnchor).isActive = true
        
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        return label
    }
    
    private func makeTextField(withPlaceHolderText text: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = text
        textField.backgroundColor = .lightGray
        return textField
    }
}
