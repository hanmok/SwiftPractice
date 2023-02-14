//
//  ViewController.swift
//  AutoLayout
//
//  Created by Mac mini on 2023/02/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
    }

    // UILabel doesn't have to have width and height constraint since it has intrinsic size, which is determined by font and text, and so on.
    func setupViews() {
        let upperLeftLabel = makeLabel(withText: "upperLeft")
        
        view.addSubview(upperLeftLabel)
        upperLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        // Challenge: Put a label in the upper right-hand-corner (padding of 8 pts top and right)
        let upperRightLabel = makeLabel(withText: "upperRight")
        view.addSubview(upperRightLabel)
        upperRightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperRightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        // Bottom Left
        let bottomLeftLabel = makeSecondaryLabel(withText: "lowerLeft")
        view.addSubview(bottomLeftLabel)
        bottomLeftLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        bottomLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        // Bottom Right
        let bottomRightButton = makeButton(withText: "Pay Bill")
        view.addSubview(bottomRightButton)
        bottomRightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        bottomRightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        let redView = makeView()
        view.addSubview(redView)
        
//        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Option 1: Size explicitly.
//        redView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Option 2: Size dynamically (pinning)
        
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        
        
        let largeLabel = makeLabel(withText: "Large", fontSize: 32)
        view.addSubview(largeLabel)
//        largeLabel.centerYAnchor.constraint(equalTo: bottomLeftLabel.centerYAnchor).isActive = true
        largeLabel.firstBaselineAnchor.constraint(equalTo: bottomLeftLabel.firstBaselineAnchor).isActive = true
        largeLabel.leadingAnchor.constraint(equalTo: bottomLeftLabel.trailingAnchor, constant: 10).isActive = true
        
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // important
        label.text = text
        label.backgroundColor = .yellow
        return label
    }
    
    func makeLabel(withText text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // important
        label.text = text
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
    
    func makeSecondaryLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // important
        label.text = text
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .blue
        return button
    }
    
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }
}

