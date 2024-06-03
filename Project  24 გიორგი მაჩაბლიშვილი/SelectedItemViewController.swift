//
//  SelectedItemViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 31.05.24.
//

import UIKit

class SelectedItemViewController: UIViewController {
    
    //MARK: -UI components
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = UIColor(hexString: "000000")
        button.addTarget(self, action: #selector(goBackPage), for: .touchUpInside)
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "F4F5F9")
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "6CC51D")
        label.font = .poppinsSemiBold(size: 12)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var itemNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "000000")
        label.font = .poppinsSemiBold(size: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var itemWeightLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 12)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var ratingImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ratingsReviews")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing"
        return label
    }()
    
    private lazy var qualityImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "quantity")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var addCartButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(hexString: "AEDC81")
        button.setTitle("Add to cart", for: .normal)
        button.titleLabel?.font = .poppinsRegular(size: 15)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(goCheckPage), for: .touchUpInside)
        return button
    }()
    
    //MARK: delegate
    var delegate: ProductList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "F2FFE6")
        self.navigationController?.isNavigationBarHidden = true
        setup()
        setupConstraint()
        configuration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: go back page
    @objc func goBackPage() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goCheckPage() {
        let checkPageVC = CheckoutViewController()
        navigationController?.pushViewController(checkPageVC, animated: true)
    }
    
    //MARK: ui configuration
    func configuration() {
        if let product = delegate {
            imageView.image = product.imageName
            priceLabel.text = product.price
            itemNameLabel.text = product.name
            itemWeightLabel.text = product.quantity
        }
    }
    
    //MARK: setup ui components
    func setup() {
        view.addSubview(backButton)
        view.addSubview(imageView)
        view.addSubview(bottomView)
        bottomView.addSubview(priceLabel)
        bottomView.addSubview(itemNameLabel)
        bottomView.addSubview(itemWeightLabel)
        bottomView.addSubview(ratingImageView)
        bottomView.addSubview(descriptionLabel)
        bottomView.addSubview(qualityImageView)
        bottomView.addSubview(addCartButton)
    }
    
    //MARK: setup ui components constraints
    func setupConstraint() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        qualityImageView.translatesAutoresizingMaskIntoConstraints = false
        addCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: layout constraints
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            backButton.widthAnchor.constraint(equalToConstant: 23),
            backButton.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 101),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46),
            imageView.heightAnchor.constraint(equalToConstant: 324)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: view.topAnchor, constant: 458),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 26),
            priceLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 16),
            priceLabel.heightAnchor.constraint(equalToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0),
            itemNameLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 16),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            itemWeightLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 3),
            itemWeightLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 16),
            itemWeightLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            ratingImageView.topAnchor.constraint(equalTo: itemWeightLabel.bottomAnchor, constant: 9),
            ratingImageView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 17),
            ratingImageView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -150),
            ratingImageView.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: ratingImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 17),
            descriptionLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -24),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 124)
        ])
        
        NSLayoutConstraint.activate([
            qualityImageView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 17),
            qualityImageView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -17),
            qualityImageView.bottomAnchor.constraint(equalTo: addCartButton.topAnchor, constant: -13),
            qualityImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            addCartButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50),
            addCartButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 17),
            addCartButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -17),
            addCartButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
