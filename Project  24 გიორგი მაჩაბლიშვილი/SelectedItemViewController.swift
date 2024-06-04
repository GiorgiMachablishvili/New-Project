//
//  SelectedItemViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 31.05.24.
//

import UIKit
import SnapKit

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
    
    private lazy var heart2ImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "heart 2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
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
        //        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: go back page
    @objc func goBackPage() {
        navigationController?.dismiss(animated: true)
    }
    
    @objc func goCheckPage() {
        let checkPageVC = CheckoutViewController()
        navigationController?.present(checkPageVC, animated: false)
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
        bottomView.addSubview(heart2ImageView)
        bottomView.addSubview(itemNameLabel)
        bottomView.addSubview(itemWeightLabel)
        bottomView.addSubview(ratingImageView)
        bottomView.addSubview(descriptionLabel)
        bottomView.addSubview(qualityImageView)
        bottomView.addSubview(addCartButton)
    }
    
    //MARK: setup ui components constraints
    func setupConstraint() {
        
        
        //MARK: layout constraints
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(68)
            make.leading.equalTo(view.snp.leading).offset(17)
            make.width.equalTo(23)
            make.height.equalTo(16)
        }
        
        imageView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(101)
            make.leading.equalTo(view.snp.leading).offset(44)
            make.trailing.equalTo(view.snp.trailing).offset(-46)
            make.height.equalTo(324)
        }
        
        bottomView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(438)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        priceLabel.snp.remakeConstraints { make in
            make.top.equalTo(bottomView.snp.top).offset(26)
            make.leading.equalTo(bottomView.snp.leading).offset(16)
            make.height.equalTo(27)
        }
        
        heart2ImageView.snp.remakeConstraints { make in
            make.top.equalTo(bottomView.snp.top).offset(33)
            make.trailing.equalTo(bottomView.snp.trailing).offset(-21)
            make.height.equalTo(18)
            make.width.equalTo(20)
        }
        
        itemNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.leading.equalTo(bottomView.snp.leading).offset(16)
            make.height.equalTo(30)
        }
        
        itemWeightLabel.snp.remakeConstraints { make in
            make.top.equalTo(itemNameLabel.snp.bottom).offset(3)
            make.leading.equalTo(bottomView.snp.leading).offset(16)
            make.height.equalTo(18)
        }
        
        ratingImageView.snp.remakeConstraints { make in
            make.top.equalTo(itemWeightLabel.snp.bottom).offset(9)
            make.leading.equalTo(bottomView.snp.leading).offset(17)
            make.trailing.equalTo(bottomView.snp.trailing).offset(-150)
            make.height.equalTo(18)
        }
        
        descriptionLabel.snp.remakeConstraints { make in
            make.top.equalTo(ratingImageView.snp.bottom).offset(14)
            make.leading.equalTo(bottomView.snp.leading).offset(17)
            make.trailing.equalTo(bottomView.snp.trailing).offset(-24)
            make.height.equalTo(124)
        }
        
        qualityImageView.snp.remakeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.leading.equalTo(bottomView.snp.leading).offset(17)
            make.trailing.equalTo(addCartButton.snp.trailing).offset(-17)
            make.height.equalTo(50)
        }
        
        addCartButton.snp.remakeConstraints { make in
            make.top.equalTo(qualityImageView.snp.bottom).offset(13)
            make.leading.equalTo(bottomView.snp.leading).offset(17)
            make.trailing.equalTo(bottomView.snp.trailing).offset(-17)
            make.height.equalTo(60)
        }
    }
}
