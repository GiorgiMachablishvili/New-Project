//
//  ProductViewCell.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 01.06.24.
//

import UIKit

class ProductViewCell: UITableViewCell {
    
    static let identifier = "ProductViewCell"
    
    private lazy var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
        
    private lazy var itemImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.poppinsRegular(size: 12)
        label.textColor = UIColor(hexString: "6CC51D")
        label.textAlignment = .left
        label.clipsToBounds = true
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
    
    var delegate: ProductInfo?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setup()
            setupConfiguration()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setup()
            setupConfiguration()
        }
    
    func setup() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(itemWeightLabel)
    }
    
    func setupConfiguration() {
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.heightAnchor.constraint(equalToConstant: 55),
            itemImageView.widthAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            priceLabel.leadingAnchor.constraint(equalTo: itemImageView.leadingAnchor,constant: 22),
            priceLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            itemNameLabel.leadingAnchor.constraint(equalTo: itemImageView.leadingAnchor,constant: 22),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            itemWeightLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor),
            itemWeightLabel.leadingAnchor.constraint(equalTo: itemImageView.leadingAnchor,constant: 22),
            itemWeightLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
//        NSLayoutConstraint.activate([
//            plusButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
//            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -19.17),
//            plusButton.widthAnchor.constraint(equalToConstant: 12.83),
//            plusButton.heightAnchor.constraint(equalToConstant: 11.85)
//        ])
//        
//        NSLayoutConstraint.activate([
//            itemCountLabel.topAnchor.constraint(equalTo: plusButton.bottomAnchor,constant: 16.15),
//            itemCountLabel.centerXAnchor.constraint(equalTo: plusButton.centerXAnchor),
//            itemCountLabel.heightAnchor.constraint(equalToConstant: 23),
//            itemCountLabel.widthAnchor.constraint(equalToConstant: 10)
//        ])
//        
//        NSLayoutConstraint.activate([
//            minusButton.topAnchor.constraint(equalTo: itemCountLabel.bottomAnchor,constant: 16),
//            minusButton.centerXAnchor.constraint(equalTo: plusButton.centerXAnchor),
//            minusButton.heightAnchor.constraint(equalToConstant: 12.83),
////            minusButton.widthAnchor.constraint(equalToConstant: 11.85)
//        ])
    }
    func configure(with product: ProductList) {
        backImageView.image = product.backImageName
        itemImageView.image = product.imageName
        priceLabel.text = "Price: \(product.price)"
        itemNameLabel.text = product.name
        itemWeightLabel.text = "Quantity: \(product.quantity)"
        
    }
}

extension ProductViewCell: ProductInfo {
    func productInfo(_ backImage: UIImage, _ mainImage: UIImage, _ price: String, _ title: String, _ itemWeight: String) {
        backImageView.image = backImage
        itemImageView.image = mainImage
        priceLabel.text = price
        itemNameLabel.text = title
        itemWeightLabel.text = itemWeight
        
    }
}

