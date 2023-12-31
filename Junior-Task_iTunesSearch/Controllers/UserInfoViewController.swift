//
//  UserInfoViewController.swift
//  Junior-Task_iTunesSearch
//
//  Created by Akbarshah Jumanazarov on 6/11/23.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First Name"
        return label
    }()
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Second Name"
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Age"
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "phone"
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        return label
    }()
    
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setContraints()
        setModel()
    }
    
    private func setup() {
        title = "User info"
        view.backgroundColor = .systemBackground
        
        stackView = UIStackView(arrangedSubviews: [firstNameLabel,
                                                   secondNameLabel,
                                                   ageLabel,
                                                   phoneLabel,
                                                   emailLabel,
                                                   passwordLabel])
        view.addSubview(stackView)
    }
    
    private func setModel() {
        guard let activeUser = Database.shared.activeUser else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: activeUser.age)
        
        firstNameLabel.text = activeUser.firstName
        secondNameLabel.text = activeUser.secondName
        phoneLabel.text = activeUser.phone
        emailLabel.text = activeUser.email
        passwordLabel.text = activeUser.password
        ageLabel.text = dateString
    }
    
    private func setContraints() {
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:-20),
            stackView.leadingAnchor.constraint (equalTo: view.leadingAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
