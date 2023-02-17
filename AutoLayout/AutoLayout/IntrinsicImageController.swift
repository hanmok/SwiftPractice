//
//  IntrinsicImageController.swift
//  AutoLayout
//
//  Created by Mac mini on 2023/02/17.
//

import UIKit

class IntrinsicImageController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        let image = makeImageView(named: "puppy")
        let label = makeLabel(withText: "Title")
        let button = makeButton(withText: "Get Started")
        
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(button)
        
//        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // initial intrinsic size: image size itself
//        image.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 300),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        
        
    }
    
    private func makeImageView(named: String) -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: named)
        
        // free to stretch and grow
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical) // 더 작아져도 돼
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical) // 더 커져도 돼
        
        return view
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        return label
    }
    
    private func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.backgroundColor = .blue
        return button
    }
}
