//
//  IntrinsicChallenge.swift
//  AutoLayout
//
//  Created by Mac mini on 2023/02/17.
//

import UIKit

class IntrinsicChallenge: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    let buttonHeight: CGFloat = 40
    let spacing: CGFloat = 8
    
    func setupViews() {
        
        // Comment in incrementally...
        let albumImage = makeImageView(named: "rush")
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush • Moving Pictures (2011 Remaster)")
        //
                let playButton = makePlayButton()
                let previewStartLabel = makePreviewLabel(withText: "0:00")
                let previewEndLabel = makePreviewLabel(withText: "0:30")
                let progressView = makeProgressView()
        //
                let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        //
        view.addSubview(albumImage)
        view.addSubview(trackLabel)
        view.addSubview(albumLabel)
        //
                view.addSubview(playButton)
                view.addSubview(previewStartLabel)
                view.addSubview(progressView)
                view.addSubview(previewEndLabel)
        //
                view.addSubview(spotifyButton)
        
        // Start your layout here...
        
//        albumImage.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
//        albumImage.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        
        NSLayoutConstraint.activate([
            
            albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            albumImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            albumImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor, multiplier: 1), // wow...
            albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor), // wow...
            albumImage.widthAnchor.constraint(equalToConstant: view.bounds.width), // wow...
            
            trackLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: spacing),
            trackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            albumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: spacing),
            
            playButton.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: spacing),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            playButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            playButton.widthAnchor.constraint(equalToConstant: buttonHeight),
            
            previewStartLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: spacing),
            previewStartLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            
            previewEndLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing),
            previewEndLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            
            progressView.leadingAnchor.constraint(equalTo: previewStartLabel.trailingAnchor, constant: spacing),
            progressView.trailingAnchor.constraint(equalTo: previewEndLabel.leadingAnchor, constant: -spacing),
            progressView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            
            spotifyButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 32),
            spotifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            
            
        ])
    }
    
    
    
    

    private func makeImageView(named: String) -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: named)

        // By making the image hug itself a little bit less and less resistant to being compressed
        // we allow the image to stretch and grow as required
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        view.backgroundColor = .magenta

        return view
    }

    private func makeTrackLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)

        return label
    }

    private func makeAlbumLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray

        return label
    }

    private func makePlayButton() -> UIButton {
        let image = UIImage(named: "play") as UIImage?

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)

        return button
    }

    private func makePreviewLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)

        return label
    }

    private func makeProgressView() -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.tintColor = .gray

        return progressView
    }

    private func makeSpotifyButton(withText title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.minimumScaleFactor = 0.5 // default 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true // default false
        button.backgroundColor = .spotifyGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonHeight / 2
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: buttonHeight, bottom: 10, right: buttonHeight)

        let attributedText = NSMutableAttributedString(string: title, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1 // amount of space between letters of the label, default: 0
            ])
        
        button.setAttributedTitle(attributedText, for: .normal) // Note how not button.setTitle()

        return button
    }
}



extension UIColor {
    static let spotifyGreen = UIColor(red: 28/255, green: 184/255, blue: 89/255, alpha: 1)
}


