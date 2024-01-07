//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Andrea Yong on 22/12/23.
//

import UIKit

class HomeHeaderView: UIView {
    
    let greeting = UILabel()
    let inboxButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    func style() {
        backgroundColor = .white
        
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good afternoon, Tofu ☀️"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
    }
    
    func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: topAnchor, multiplier: 1),
            greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1),
//            greeting.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 1)
        ])
    }
}

// MARK: Factories
extension HomeHeaderView {
    func makeInboxButton() {
        // Create a UIButton.Configuration for a standard button
        var config = UIButton.Configuration.plain()
        
        // Set image and text
        config.image = UIImage(systemName: "envelope", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        config.title = "Inbox"
        
        // Set color for image and text
        config.imagePlacement = .leading  // Image on the left side of text
        config.imagePadding = 8  // Space between the image and text
        config.baseForegroundColor = .secondaryLabel // Color for text and image
        
        // Apply the configuration to the button
        inboxButton.configuration = config
        
        // Set additional button properties
        inboxButton.translatesAutoresizingMaskIntoConstraints = false
        inboxButton.imageView?.contentMode = .scaleAspectFit
    }
}
