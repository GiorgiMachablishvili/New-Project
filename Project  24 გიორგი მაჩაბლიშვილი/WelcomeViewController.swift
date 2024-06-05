//
//  WelcomeViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 30.05.24.
//

import UIKit
import SnapKit

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
    
    //MARK: setup constraints
    func setupConstraints() {        
        //MARK: layout constraints
        imageView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.top).offset(view.frame.height * 0.56)
        }
        
        imageViewLabel.snp.remakeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(view.frame.height * 0.07)
            make.centerX.equalTo(view.snp.centerX)
        }

        customView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(view.frame.height * 0.5)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(view.frame.height * 0.0033)
        }

        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(customView.snp.top).offset(view.frame.height * 0.05)
            make.leading.equalTo(customView.snp.leading).offset(view.frame.width * 0.03)
        }

        paragraphLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(view.frame.height * 0.0022)
            make.leading.equalTo(customView.snp.leading).offset(view.frame.width * 0.03)
        }

        textField1.snp.remakeConstraints { make in
            make.top.equalTo(customView.snp.top).offset(view.frame.height * 0.16)
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.04)
            make.height.equalTo(view.frame.height * 0.066)
        }
        
        textField1Image.snp.remakeConstraints { make in
            make.leading.equalTo(textField1.snp.leading).offset(view.frame.width * 0.067)
            make.centerY.equalTo(textField1.snp.centerY)
            make.height.equalTo(view.frame.width * 0.042)
            make.width.equalTo(view.frame.width * 0.055)
        }

        textField2.snp.remakeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(view.frame.height * 0.0033)
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.04)
            make.height.equalTo(view.frame.height * 0.066)
        }
        
        textField2Image1.snp.remakeConstraints { make in
            make.leading.equalTo(textField2.snp.leading).offset(view.frame.width * 0.067)
            make.centerY.equalTo(textField2.snp.centerY)
            make.height.equalTo(view.frame.height * 0.025)
            make.width.equalTo(view.frame.width * 0.042)
        }
        
        textField2Image2.snp.remakeConstraints { make in
            make.trailing.equalTo(textField2.snp.trailing).offset(-(view.frame.width * 0.044))
            make.centerY.equalTo(textField2.snp.centerY)
            make.height.equalTo(view.frame.height * 0.0187)
            make.width.equalTo(view.frame.width * 0.064)
        }
        
        switcherLabel.snp.remakeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(view.frame.height * 0.027)
            make.leading.equalTo(customView.snp.leading).offset(view.frame.width * 0.064)
            make.bottom.equalTo(primaryButton.snp.top).offset(-(view.frame.height * 0.022))
            make.width.equalTo(view.frame.width * 0.07)
        }
        
        rememberLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(switcherLabel.snp.centerY)
            make.leading.equalTo(switcherLabel.snp.trailing).offset(view.frame.width * 0.022)
        }

        forgotPasswordLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(switcherLabel.snp.centerY)
            make.trailing.equalTo(customView.snp.trailing).offset(-(view.frame.width * 0.062))
            make.width.equalTo(view.frame.width * 0.323)
        }
        
        primaryButton.snp.remakeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(view.frame.height * 0.068)
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.04)
            make.height.equalTo(view.frame.height * 0.066)
        }

        accountLabel.snp.remakeConstraints { make in
            make.top.equalTo(primaryButton.snp.bottom)
            make.leading.equalTo(customView.snp.leading).offset(view.frame.width * 0.178)
            make.height.equalTo(view.frame.height * 0.025)
        }
        
        signupButton.snp.remakeConstraints { make in
            make.top.equalTo(primaryButton.snp.bottom)
            make.leading.equalTo(accountLabel.snp.trailing)
            make.trailing.equalTo(customView.snp.trailing).offset(-(view.frame.width * 0.13))
            make.height.equalTo(view.frame.height * 0.025)
        }
    }
}

