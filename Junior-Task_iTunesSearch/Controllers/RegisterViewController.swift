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
    let nameValidType: String.ValidTypes = .name
    let emailValidType: String.ValidTypes = .email
    let passwordValidType: String.ValidTypes = .password

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setConstraints()
        setupDelegate()
        setupDatePicker()
        registerKeyboardNotification()
    }
    
    deinit {
        removeKeyboardNotification()
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
    
    private func setTextField(textField: UITextField, label: UILabel, validType: String.ValidTypes, validMessage: String, wrongMessage: String, string: String, range: NSRange) {
        if string.isValid(validType: nameValidType) {
            print("+")
        } else {
            print("-")
        }
        
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        textField.text = result
        
        if result.isValid(validType: validType) {
            label.text = validMessage
            label.textColor = .green
        } else {
            label.text = wrongMessage
            label.textColor = .red
        }
    }
    
    private func setPhoneNumberMask(textField: UITextField, mask: String, string: String, range: NSRange) -> String {
        let text = textField.text ?? ""
        let phone = (text as NSString).replacingCharacters(in: range, with: string)
        let number = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = number.startIndex
        for char in mask where index < number.endIndex {
            if char == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(char)
            }
        }
        
        if result.count == 17 {
            phonNumberValidLabel.text = "Phone is valid"
            phonNumberValidLabel.textColor = .green
        } else {
            phonNumberValidLabel.text = "Phone is invalid"
            phonNumberValidLabel.textColor = .red
        }
        
        return result
    }
    
    private func ageIsValid() -> Bool {
        let calendar = NSCalendar.current
        let dateNow = Date()
        let birthdate = datePicker.date
        
        let age = calendar.dateComponents([.year], from: birthdate, to: dateNow)
        let ageYear = age.year
        
        guard let ageUser = ageYear else {
            return false
        }
        
        return (ageUser < 18 ? false : true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case firstNameTextField:
            setTextField(textField: firstNameTextField,
                         label: firstNameValidLabel,
                         validType: nameValidType,
                         validMessage: "Name is valid",
                         wrongMessage: "Only A-Z characters are allowed, min 1 character",
                         string: string,
                         range: range)
            
        case secondNameTextField:
            setTextField(textField: secondNameTextField,
                         label: secondNameValidLabel,
                         validType: nameValidType,
                         validMessage: "Name is valid",
                         wrongMessage: "Only A-Z characters are allowed, min 1 character",
                         string: string,
                         range: range)
            
        case emailTextField:
            setTextField(textField: emailTextField,
                         label: emailValidLabel,
                         validType: emailValidType,
                         validMessage: "Email is valid",
                         wrongMessage: "Email is not valid",
                         string: string,
                         range: range)
        case passwrodTextField:
            setTextField(textField: passwrodTextField,
                         label: passwordValidLabel,
                         validType: passwordValidType,
                         validMessage: "Password is valid",
                         wrongMessage: "Password is not valid",
                         string: string,
                         range: range)
        case phoneNumberTextField: phoneNumberTextField.text = setPhoneNumberMask(textField: phoneNumberTextField,
                                                                                  mask: "+XXX (XX) XXX-XX-XX",
                                                                                  string: string,
                                                                                  range: range)
        default:
            break
        }
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

extension RegisterViewController {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        print("Keyboard opened!")
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight.height/2)
    }
    
    @objc private func keyboardWillHide() {
        print("Keyboard closed!")
        scrollView.contentOffset = CGPoint.zero
    }
}
