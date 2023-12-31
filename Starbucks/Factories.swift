//
//  Factories.swift
//  Starbucks
//
//  Created by Andrea Yong on 22/12/23.
//

import UIKit

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}

extension UIColor {
    static let starYellow = UIColor(red: 204/255, green: 153/255, blue: 51/255, alpha: 1)
    static let titleBrown = UIColor(red: 225/255, green: 235/255, blue: 228/255, alpha: 1)
    static let darkGreen = UIColor(red: 0/255, green: 133/255, blue: 67/255, alpha: 1)
    static let lightGreen = UIColor(red: 0/255, green: 171/255, blue: 90/255, alpha: 1)
    static let backgroundWhite = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
}

func makeSymbolImageView(systemName: String, scale: UIImage.SymbolScale = .large) -> UIImageView {
    let configuration = UIImage.SymbolConfiguration(scale: scale)
    let image = UIImage(systemName: systemName, withConfiguration: configuration)
    return UIImageView(image: image)
}

func makeGreenButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    
    var config = UIButton.Configuration.plain()
    config.title = text
    config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    button.configuration = config
    
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.layer.cornerRadius = 40/2
    button.backgroundColor = .darkGreen
    
    return button
    
    // Older method
//    button.setTitle(text, for: .normal)
//    button.titleLabel?.adjustsFontSizeToFitWidth = true
//    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
//    button.layer.cornerRadius = 40/2
//    button.backgroundColor = .darkGreen
}


func makeClearButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    
    // Newer method
    var config = UIButton.Configuration.plain()
    config.title = text
    config.baseForegroundColor = .label
    config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    button.configuration = config // Applying the configuration to the button
    
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    
    button.layer.cornerRadius = 40/2
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.label.cgColor
    button.backgroundColor = .systemBackground
    
    return button
    
    // Older method
//    button.setTitle(text, for: .normal) // "text" here uses internal parameter name
//    button.titleLabel?.adjustsFontSizeToFitWidth = true
//    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
//    button.layer.cornerRadius = 40/2
//    button.layer.borderWidth = 0.5
//
//    button.setTitleColor(.label, for: .normal)
//    button.layer.borderColor = UIColor.label.cgColor
//    button.backgroundColor = .systemBackground
}
