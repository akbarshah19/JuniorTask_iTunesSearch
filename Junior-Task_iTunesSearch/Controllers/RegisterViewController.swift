//
//  RegisterViewController.swift
//  Junior-Task_iTunesSearch
//
//  Created by Akbarshah Jumanazarov on 6/10/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Register"
        return label
    }()
    
    private let firstNameTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "First name"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let firstNameValidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Required field"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let secondNameTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Second name"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let secondNameValidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Required field"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let ageValidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Required field"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let phoneNumberTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Phone number"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let phonNumberValidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Required field"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Email address"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let emailValidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Required field"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let passwrodTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Password"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let passwordValidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Required field"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .green
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    private var elementsStackView = UIStackView()
    private var datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setConstraints()
        setupDelegate()
        setupDatePicker()
    }
    
    private func setup() {
        title = "Register"
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        elementsStackView = UIStackView(arrangedSubviews: [firstNameTextField,
                                                           firstNameValidLabel,
                                                           secondNameTextField,
                                                           secondNameValidLabel,
                                                           datePicker,
                                                           ageValidLabel,
                                                           phoneNumberTextField,
                                                           phonNumberValidLabel,
                                                           emailTextField,
                                                           emailValidLabel,
                                                           passwrodTextField,
                                                           passwordValidLabel,
        ])
        elementsStackView.axis = .vertical
        elementsStackView.spacing = 10
        elementsStackView.distribution = .fillProportionally
        elementsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(elementsStackView)
        containerView.addSubview(registerLabel)
        containerView.addSubview(registerButton)
        
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant:0),
            scrollView.bottomAnchor.constraint (equalTo: view.bottomAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint (equalTo: scrollView.centerYAnchor),
            containerView.centerXAnchor.constraint (equalTo: scrollView.centerXAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            elementsStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            elementsStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            elementsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            elementsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            registerLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            registerLabel.bottomAnchor.constraint(equalTo: elementsStackView.topAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: elementsStackView.bottomAnchor, constant: 30),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            registerButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupDelegate() {
        firstNameTextField.delegate = self
        secondNameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailTextField.delegate = self
        passwrodTextField.delegate = self
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .secondarySystemBackground
        datePicker.layer.borderColor = UIColor.secondaryLabel.cgColor
        datePicker.layer.borderWidth = 1
        datePicker.clipsToBounds = true
        datePicker.layer.masksToBounds = true
        datePicker.layer.cornerRadius = 8
        datePicker.tintColor = .label
    }
    
    @objc private func didTapRegister() {
        
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        secondNameTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwrodTextField.resignFirstResponder()
        return true
    }
}
