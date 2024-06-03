//
//  ViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 30.05.24.
//


import UIKit

class ViewController: UIViewController {
    //MARK: -UI components
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "oranges")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var customView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "FFFFFF")
        
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
        customView.roundTopCorners(radius: 50)
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
        //MARK: turn off auto layouts
        imageView.translatesAutoresizingMaskIntoConstraints = false
        customView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        paragraphLabel.translatesAutoresizingMaskIntoConstraints = false
        primaryButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: layout constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -282)
        ])
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 471.74),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 46.26),
            titleLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 47.1),
            titleLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -47),
            titleLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            paragraphLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 17),
            paragraphLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 47.1),
            paragraphLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -47),
            paragraphLabel.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        NSLayoutConstraint.activate([
            primaryButton.topAnchor.constraint(equalTo: paragraphLabel.bottomAnchor, constant: 91.74),
            primaryButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 17.1),
            primaryButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -17),
            primaryButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK: primary button action
    @objc func addCutomButton() {
        let welcomeVC = WelcomeViewController()
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

//MARK: view corner radius extension
extension UIView {
    func roundTopCorners(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
