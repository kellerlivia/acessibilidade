//
//  ViewController.swift
//  acessibilidade
//
//  Created by Livia Keller on 09/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: ViewControllerScreen?
    
    override func loadView() {
        screen = ViewControllerScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(self)
        configAccessbility()
    }
    
    func configAccessbility() {
        screen?.positionOneLabel.isAccessibilityElement = true
        screen?.positionTwoLabel.isAccessibilityElement = true
        screen?.positionThreeLabel.isAccessibilityElement = true
        screen?.positionFourLabel.isAccessibilityElement = true
        screen?.positionFiveLabel.isAccessibilityElement = true
        screen?.loginButton.isAccessibilityElement = true
        screen?.titleLabel.isAccessibilityElement = true
        screen?.personImageView.isAccessibilityElement = true
        
        screen?.positionOneLabel.accessibilityLabel = "primeiro"
        
        screen?.positionOneLabel.accessibilityTraits = .staticText
        screen?.titleLabel.accessibilityTraits = .header
        screen?.personImageView.accessibilityTraits = .image
        
        guard let primeiro = screen?.positionOneLabel,
              let sengundo = screen?.positionTwoLabel,
              let terceiro = screen?.positionThreeLabel,
              let quarto = screen?.positionFourLabel,
              let quinto = screen?.positionFiveLabel,
              let image = screen?.personImageView else { return }
        
        // oredenacao
        view.accessibilityElements = [image, primeiro, sengundo, terceiro, quarto, quinto]
    }
}

extension ViewController: ViewControllerScreenProtocol {
    func tappedLoginButton() {
        UIAccessibility.post(notification: .announcement, argument: "botao pressionado")
        UIAccessibility.post(notification: .screenChanged, argument: screen?.positionOneLabel)
    }
}
