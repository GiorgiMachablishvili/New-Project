//
//  ViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 30.05.24.
//


import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: -UI components
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "oranges")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var customView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "bottomView")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "000000")
        label.font = .poppinsSemiBold(size: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Buy Premium Quality Fruits"
        return label
    }()
    
    private lazy var paragraphLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy"
        return label
    }()
    
    private lazy var primaryButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(hexString: "6CC51D")
        button.setTitle("Get started", for: .normal)
        button.titleLabel?.font = .poppinsRegular(size: 15)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(addCutomButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setup()
        setupConstraints()
    }
    
    //MARK: primary button action
    @objc func addCutomButton() {
        let welcomeVC = WelcomeViewController()
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    //MARK: setup ui components
    private func setup() {
        view.addSubview(imageView)
        view.addSubview(customView)
        customView.addSubview(titleLabel)
        customView.addSubview(paragraphLabel)
        customView.addSubview(primaryButton)
    }
    
    //MARK: setup ui components constraints
    private func setupConstraints() {
        //MARK: layout constraints
        imageView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.68)
        }
        
        customView.snp.remakeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.47)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(customView.snp.top).offset(view.frame.height * 0.071)
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.11)
            make.height.equalTo(view.frame.height * 0.1)
        }
        
        paragraphLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(view.frame.height * 0.0189)
            make.trailing.leading.equalToSuperview().inset(view.frame.width * 0.114)
            make.height.equalTo(view.frame.height * 0.052)
        }
        
        primaryButton.snp.remakeConstraints { make in
            make.bottom.equalTo(paragraphLabel.snp.bottom).offset(view.frame.height * 0.17)
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.041)
            make.height.equalTo(view.frame.height * 0.066)
        }
    }
}


