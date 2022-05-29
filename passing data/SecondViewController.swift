//
//  SecondViewController.swift
//  passing data
//
//  Created by Мария Межова on 29.05.2022.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var onButtonPush: (()-> Void)?
    var autocapitalize: ((_ text: String)-> Void)?
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func popVC() {
        if let text = textLabel.text {
            textLabel.text = text.uppercased()
            self.autocapitalize?(textLabel.text ?? "")
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        setupUI()
        self.onButtonPush?()
    }
    
    func setupUI() {
        view.addSubview(textLabel)
        view.addSubview(backButton)
        
        let constraints = [
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            backButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            backButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
