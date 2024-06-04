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
            make.bottom.equalTo(view.snp.bottom).offset(-385)
        }
        
        imageViewLabel.snp.remakeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(63)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(imageViewLabel.snp.height).offset(27)
        }
        
        customView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(446)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(3)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(customView.snp.top).offset(30)
            make.leading.equalTo(customView.snp.leading).offset(16)
            make.height.equalTo(38)
        }
        
        paragraphLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.equalTo(customView.snp.leading).offset(16)
            make.height.equalTo(23)
        }
        
        textField1.snp.remakeConstraints { make in
            make.top.equalTo(customView.snp.top).offset(119)
            make.leading.equalTo(customView.snp.leading).offset(17)
            make.trailing.equalTo(customView.snp.trailing).offset(-17)
            make.height.equalTo(60)
        }
        
        textField1Image.snp.remakeConstraints { make in
            make.top.equalTo(textField1.snp.top).offset(21)
            make.leading.equalTo(textField1.snp.leading).offset(28)
            make.bottom.equalTo(textField1.snp.bottom).offset(-21.5)
            make.width.equalTo(23)
        }
        
        textField2.snp.remakeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(3)
            make.leading.equalTo(customView.snp.leading).offset(17)
            make.trailing.equalTo(customView.snp.trailing).offset(-17)
            make.height.equalTo(60)
        }
        
        textField2Image1.snp.remakeConstraints { make in
            make.top.equalTo(textField2.snp.top).offset(18)
            make.leading.equalTo(textField2.snp.leading).offset(28)
            make.bottom.equalTo(textField2.snp.bottom).offset(-19)
            make.width.equalTo(17.25)
        }
        
        textField2Image2.snp.remakeConstraints { make in
            make.top.equalTo(textField2.snp.top).offset(22)
            make.trailing.equalTo(textField2.snp.trailing).offset(-28.5)
            make.bottom.equalTo(textField2.snp.bottom).offset(-21.12)
            make.width.equalTo(26.5)
        }
        
        switcherLabel.snp.remakeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(25)
            make.leading.equalTo(customView.snp.leading).offset(26.57)
            make.bottom.equalTo(primaryButton.snp.top).offset(-20)
            make.width.equalTo(29)
        }
        
        rememberLabel.snp.remakeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(21)
            make.leading.equalTo(switcherLabel.snp.trailing).offset(9.5)
            make.bottom.equalTo(primaryButton.snp.top).offset(-17)
        }
        
        forgotPasswordLabel.snp.remakeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(21)
            make.trailing.equalTo(customView.snp.trailing).offset(-26)
            make.bottom.equalTo(primaryButton.snp.top).offset(-17)
            make.width.equalTo(134)
        }
        
        primaryButton.snp.remakeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(61)
            make.leading.equalTo(customView.snp.leading).offset(17)
            make.trailing.equalTo(customView.snp.trailing).offset(-17)
            make.height.equalTo(60)
        }
        
        accountLabel.snp.remakeConstraints { make in
            make.top.equalTo(primaryButton.snp.bottom)
            make.leading.equalTo(customView.snp.leading).offset(74)
            make.height.equalTo(23)
        }
        
        signupButton.snp.remakeConstraints { make in
            make.top.equalTo(primaryButton.snp.bottom)
            make.leading.equalTo(accountLabel.snp.trailing)
            make.trailing.equalTo(customView.snp.trailing).offset(-60)
            make.height.equalTo(23)
        }
    }
}

