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
            make.height.equalTo(619)
        }
        
        customView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(471)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(customView.snp.top).offset(46.26)
            make.leading.equalTo(customView.snp.leading).offset(47)
            make.trailing.equalTo(customView.snp.trailing).offset(-47)
            make.height.equalTo(90)
        }
        
        paragraphLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(17)
            make.leading.equalTo(customView.snp.leading).offset(47)
            make.trailing.equalTo(customView.snp.trailing).offset(-47)
            make.height.equalTo(47)
        }
        
        primaryButton.snp.remakeConstraints { make in
            make.top.equalTo(paragraphLabel.snp.bottom).offset(91)
            make.leading.equalTo(customView.snp.leading).offset(17)
            make.trailing.equalTo(customView.snp.trailing).offset(-17)
            make.height.equalTo(60)
        }
    }
    
    //MARK: primary button action
    @objc func addCutomButton() {
        let welcomeVC = WelcomeViewController()
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

