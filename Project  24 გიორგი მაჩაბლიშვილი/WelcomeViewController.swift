//
//  WelcomeViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 30.05.24.
//

import UIKit

class WelcomeViewController: UIViewController {
    //MARK: -UI components
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "woman")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.font = .poppinsSemiBold(size: 18)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Welcome"
        return label
    }()
    
    private lazy var customView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "F4F5F9")
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "000000")
        label.font = .poppinsSemiBold(size: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Welcome back !"
        return label
    }()
    
    private lazy var paragraphLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Sign in to your account"
        return label
    }()
    
    private lazy var textField1: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "                Email Address"
        textField.backgroundColor = UIColor(hexString: "FFFFFF")
        textField.font = .poppinsRegular(size: 15)
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var textField1Image: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "mail")
        imageView.tintColor = UIColor(hexString: "868889")
        return imageView
    }()
    
    private lazy var textField2: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "                . . . . . . . ."
        textField.backgroundColor = UIColor(hexString: "FFFFFF")
        textField.font = .poppinsRegular(size: 15)
        textField.textAlignment = .left
        return textField
    }()
    
    private lazy var textField2Image1: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "lock")
        imageView.tintColor = UIColor(hexString: "868889")
        return imageView
    }()
    
    private lazy var textField2Image2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "eye")
        imageView.tintColor = UIColor(hexString: "868889")
        return imageView
    }()
    
    private lazy var switcherLabel: UIImageView = {
        let label = UIImageView(frame: .zero)
        label.tintColor = UIColor(hexString: "868889")
        label.image = UIImage(named: "swicher")
        return label
    }()
    
    private lazy var rememberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Remember me"
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 15)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Forgot password"
        label.textColor = UIColor(hexString: "407EC7")
        label.font = .poppinsRegular(size: 15)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var primaryButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(hexString: "AEDC81")
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .poppinsRegular(size: 15)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(goNextPage), for: .touchUpInside)
        return button
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Don’t have an account ? "
        label.textColor = UIColor(hexString: "407EC7")
        label.font = .poppinsRegular(size: 15)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var signupButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(" Sign up", for: .normal)
        button.setTitleColor(UIColor(hexString: "000000"), for: .normal)
        button.backgroundColor = UIColor(hexString: "F4F5F9")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: don't show navigation bar
        self.navigationController?.isNavigationBarHidden = true
        
        setup()
        setupConstraints()
    }
    
    //MARK: go next page
    @objc func goNextPage() {
        let nextPage = TabBarController()
        navigationController?.pushViewController(nextPage, animated: true)
    }
    
    //MARK: setup ui components
    func setup() {
        view.addSubview(imageView)
        imageView.addSubview(imageViewLabel)
        view.addSubview(customView)
        customView.addSubview(titleLabel)
        customView.addSubview(paragraphLabel)
        customView.addSubview(textField1)
        textField1.addSubview(textField1Image)
        customView.addSubview(textField2)
        textField2.addSubview(textField2Image1)
        textField2.addSubview(textField2Image2)
        customView.addSubview(switcherLabel)
        customView.addSubview(rememberLabel)
        customView.addSubview(forgotPasswordLabel)
        customView.addSubview(primaryButton)
        customView.addSubview(accountLabel)
        customView.addSubview(signupButton)
    }
    
    //MARK: setup ui components constraints
    func setupConstraints() {
        //MARK: turn off auto layouts
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewLabel.translatesAutoresizingMaskIntoConstraints = false
        customView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        paragraphLabel.translatesAutoresizingMaskIntoConstraints = false
        textField1.translatesAutoresizingMaskIntoConstraints = false
        textField1Image.translatesAutoresizingMaskIntoConstraints = false
        textField2.translatesAutoresizingMaskIntoConstraints = false
        textField2Image1.translatesAutoresizingMaskIntoConstraints = false
        textField2Image2.translatesAutoresizingMaskIntoConstraints = false
        switcherLabel.translatesAutoresizingMaskIntoConstraints = false
        rememberLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        primaryButton.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: layout constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -385)
        ])
        
        NSLayoutConstraint.activate([
            imageViewLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 63),
            imageViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageViewLabel.widthAnchor.constraint(equalToConstant: 90),
            imageViewLabel.heightAnchor.constraint(equalTo: imageViewLabel.heightAnchor, constant: 27)
        ])
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.topAnchor,constant: 446),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            paragraphLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            paragraphLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 16),
            paragraphLabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            textField1.topAnchor.constraint(equalTo: paragraphLabel.bottomAnchor, constant: 26),
            textField1.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 17),
            textField1.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -17),
            textField1.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            textField1Image.topAnchor.constraint(equalTo: textField1.topAnchor, constant: 21),
            textField1Image.leadingAnchor.constraint(equalTo: textField1.leadingAnchor, constant: 28),
            textField1Image.bottomAnchor.constraint(equalTo: textField1.bottomAnchor, constant: -21.48),
            textField1Image.widthAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 5),
            textField2.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 17),
            textField2.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -17),
            textField2.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            textField2Image1.topAnchor.constraint(equalTo: textField2.topAnchor, constant: 18),
            textField2Image1.leadingAnchor.constraint(equalTo: textField2.leadingAnchor, constant: 28),
            textField2Image1.bottomAnchor.constraint(equalTo: textField2.bottomAnchor, constant: -19),
            textField2Image1.widthAnchor.constraint(equalToConstant: 17.25)
        ])
        
        NSLayoutConstraint.activate([
            textField2Image2.topAnchor.constraint(equalTo: textField2.topAnchor, constant: 22),
            textField2Image2.trailingAnchor.constraint(equalTo: textField2.trailingAnchor, constant: -28.52),
            textField2Image2.bottomAnchor.constraint(equalTo: textField2.bottomAnchor, constant: -21.12),
            textField2Image2.widthAnchor.constraint(equalToConstant: 26.48)
        ])
        
        NSLayoutConstraint.activate([
            switcherLabel.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 25),
            switcherLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 26.57),
            switcherLabel.bottomAnchor.constraint(equalTo: primaryButton.topAnchor, constant: -20),
            switcherLabel.widthAnchor.constraint(equalToConstant: 29)
        ])
        
        NSLayoutConstraint.activate([
            rememberLabel.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 21),
            rememberLabel.leadingAnchor.constraint(equalTo: switcherLabel.trailingAnchor, constant: 9.43),
            rememberLabel.bottomAnchor.constraint(equalTo: primaryButton.topAnchor, constant: -17),
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordLabel.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 21),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -26),
            forgotPasswordLabel.bottomAnchor.constraint(equalTo: primaryButton.topAnchor, constant: -17),
            forgotPasswordLabel.widthAnchor.constraint(equalToConstant: 134)
        ])
        
        NSLayoutConstraint.activate([
            primaryButton.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 61),
            primaryButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 17),
            primaryButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -17),
            primaryButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            accountLabel.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 0),
            accountLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 74),
            accountLabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 0),
            signupButton.leadingAnchor.constraint(equalTo: accountLabel.trailingAnchor, constant: 0),
            signupButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -60),
            signupButton.heightAnchor.constraint(equalToConstant: 23)
        ])
    }
}

