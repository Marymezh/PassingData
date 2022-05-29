//
//  ViewController.swift
//  passing data
//
//  Created by Мария Межова on 29.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let textField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(pushNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc func pushNext() {
        let secondVC = SecondViewController()
        secondVC.onButtonPush = {[weak self] in
            secondVC.textLabel.text = self?.textField.text
        }
        secondVC.autocapitalize = {(text: String) in
            self.textField.text = text
        }
        
        navigationController?.pushViewController(secondVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupUI()
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//    }
//    
//    
    func setupUI () {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemGray2
        
        view.addSubview(textField)
        view.addSubview(nextButton)
        
        
        let constraints = [
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            nextButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }


}

