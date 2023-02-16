//
//  Challenge.swift
//  BasicAnchors
//
//  Created by Jonathan Rasmusson (Contractor) on 2019-08-26.
//  Copyright © 2019 Jonathan Rasmusson. All rights reserved.
//

import UIKit

class ChallengeController: UIViewController {

    let margin: CGFloat = 20
    let spacing: CGFloat = 32

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    func setupNavigationBar() {
//        view.backgroundColor = .magenta
        navigationItem.title = "Playback"
    }

    func setupViews() {

        // Comment in incrementally ...
        let offlineLabel = makeLabel(withText: "Offline")
        let offlineSwitch = makeSwitch(isOn: false)
        let offlineSublabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        
        let crossfadeLabel = makeBoldLabel(withText: "Crossfade")
        let crossfadeMinLabel = makeSubLabel(withText: "0s")
        let crossfadeMaxLabel = makeSubLabel(withText: "12s")
        let crossfadeProgressView = makeProgressView()
        
        let gaplessPlaybackLabel = makeLabel(withText: "Gapless Playback")
        let gaplessPlaybackSwitch = makeSwitch(isOn: true)
        
        let hideSongsLabel = makeLabel(withText: "Hide Unplayable Songs")
        let hideSongsSwitch = makeSwitch(isOn: true)
        
        let enableNormalizationLabel = makeLabel(withText: "Enable Audio Normalization")
        let enableNormalizationSwitch = makeSwitch(isOn: true)
        
        view.addSubview(offlineLabel)
        view.addSubview(offlineSwitch)
        view.addSubview(offlineSublabel)
        
        view.addSubview(crossfadeLabel)
        view.addSubview(crossfadeMinLabel)
        view.addSubview(crossfadeProgressView)
        view.addSubview(crossfadeMaxLabel)

        view.addSubview(gaplessPlaybackLabel)
        view.addSubview(gaplessPlaybackSwitch)

        view.addSubview(hideSongsLabel)
        view.addSubview(hideSongsSwitch)

        view.addSubview(enableNormalizationLabel)
        view.addSubview(enableNormalizationSwitch)
        
        // Start your layout here...

        NSLayoutConstraint.activate([
            offlineLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
//            offlineLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            offlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            
            offlineSwitch.centerYAnchor.constraint(equalTo: offlineLabel.centerYAnchor),
            offlineSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            offlineSublabel.topAnchor.constraint(equalTo: offlineLabel.bottomAnchor, constant: margin),
            offlineSublabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            offlineSublabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            crossfadeLabel.topAnchor.constraint(equalTo: offlineSublabel.bottomAnchor, constant: spacing),
            crossfadeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            crossfadeMinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            crossfadeMinLabel.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: spacing),
            
            crossfadeMaxLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            crossfadeMaxLabel.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: spacing),
            
            crossfadeProgressView.leadingAnchor.constraint(equalTo: crossfadeMinLabel.trailingAnchor),
            crossfadeProgressView.trailingAnchor.constraint(equalTo: crossfadeMaxLabel.leadingAnchor),
//            crossfadeProgressView.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: spacing),
            crossfadeProgressView.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor),
            crossfadeProgressView.heightAnchor.constraint(equalToConstant: 5),
            
            gaplessPlaybackLabel.topAnchor.constraint(equalTo: crossfadeMinLabel.bottomAnchor, constant: spacing),
            gaplessPlaybackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            
            gaplessPlaybackSwitch.centerYAnchor.constraint(equalTo: gaplessPlaybackLabel.centerYAnchor),
            gaplessPlaybackSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            
            hideSongsLabel.topAnchor.constraint(equalTo: gaplessPlaybackLabel.bottomAnchor, constant: spacing),
            hideSongsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            
            hideSongsSwitch.centerYAnchor.constraint(equalTo: hideSongsLabel.centerYAnchor),
            hideSongsSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            
            enableNormalizationLabel.topAnchor.constraint(equalTo: hideSongsLabel.bottomAnchor, constant: spacing),
            enableNormalizationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            
            enableNormalizationSwitch.centerYAnchor.constraint(equalTo: enableNormalizationLabel.centerYAnchor),
            enableNormalizationSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
        ])
    }
}





//
//  Factories.swift
//  BasicAnchors
//
//  Created by Jonathan Rasmusson (Contractor) on 2019-08-26.
//  Copyright © 2019 Jonathan Rasmusson. All rights reserved.
//

//import UIKit

func makeLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 17)

    return label
}

func makeSubLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .gray
    label.font = UIFont.systemFont(ofSize: 13)
    label.numberOfLines = 0 // multiline

    return label
}

func makeBoldLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 17)

    return label
}

func makeSwitch(isOn: Bool) -> UISwitch {
    let theSwitch = UISwitch()
    theSwitch.translatesAutoresizingMaskIntoConstraints = false
    theSwitch.isOn = isOn

    return theSwitch
}

func makeProgressView() -> UIProgressView {
    let progressView = UIProgressView(progressViewStyle: .default)
    progressView.translatesAutoresizingMaskIntoConstraints = false
//    progressView.tintColor = .gray
    progressView.tintColor = .magenta

    return progressView
}

func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 8.0

    return stackView
}

public extension NSLayoutConstraint {
    @objc func setActiveBreakable(priority: UILayoutPriority = UILayoutPriority(900)) {
        self.priority = priority
        isActive = true
    }
}

extension UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
//    static let darkBlue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
//    static let darkGreen = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
    static let darkOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    static let darkRed = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
    static let darkTeal = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    static let darkYellow = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
    static let offBlack = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
}

