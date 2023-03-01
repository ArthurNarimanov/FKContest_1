//
//  ViewController.swift
//  FKContest_1
//
//  Created by Arthur Narimanov on 3/1/23.
//

import UIKit

final class ViewController: UIViewController {

    private let gradientView: GradientView = {
        let view = GradientView()
        view.set(colors: .systemYellow, .systemRed, .systemBlue)
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.layer.cornerCurve = .circular
        view.layer.cornerRadius = 16
        view.layer.shadowRadius = 16
        view.layer.shadowOpacity = 0.6
        view.layer.shadowOffset = CGSize(width: 4, height: 8)
        view.layer.shadowColor = UIColor.red.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gradientView)
        
        NSLayoutConstraint.activate([
            gradientView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 100),
            gradientView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}

final class GradientView: UIView {
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    func set(colors: UIColor...) {
        let layer = self.layer as! CAGradientLayer
        layer.colors = colors.map { $0.cgColor }
    }
}
