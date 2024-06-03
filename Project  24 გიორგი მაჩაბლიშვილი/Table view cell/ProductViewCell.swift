//
//  ProductViewCell.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 01.06.24.
//

import UIKit

class ProductViewCell: UITableViewCell {
    
    static let identifier = "ProductViewCell"
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "F4F5F9")
        return view
    }()
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
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor(hexString: "6CC51D")
        return button
    }()
    
    private lazy var itemCountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 15)
        label.text = "5"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = UIColor(hexString: "6CC51D")
        return button
    }()
    

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
        contentView.addSubview(separatorView)
        contentView.addSubview(backImageView)
        contentView.addSubview(itemImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(itemWeightLabel)
        contentView.addSubview(plusButton)
        contentView.addSubview(itemCountLabel)
        contentView.addSubview(minusButton)
    }
    
    func setupConfiguration() {
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        itemCountLabel.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
//        NSLayoutConstraint.activate([
//            contentView.heightAnchor.constraint(equalToConstant: 100),
//            contentView.widthAnchor.constraint(equalToConstant: 380)
//        ])
        
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14.18),
            backImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            backImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            backImageView.widthAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 15.82),
            itemImageView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor,constant: 4),
            itemImageView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: -5),
            itemImageView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 7.82)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            priceLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor,constant: 22),
            priceLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            itemNameLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor,constant: 22),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            itemWeightLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor),
            itemWeightLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor,constant: 22),
            itemWeightLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -19.17),
            plusButton.widthAnchor.constraint(equalToConstant: 12.83),
            plusButton.heightAnchor.constraint(equalToConstant: 11.85)
        ])
        
        NSLayoutConstraint.activate([
            itemCountLabel.topAnchor.constraint(equalTo: plusButton.bottomAnchor,constant: 16.15),
            itemCountLabel.centerXAnchor.constraint(equalTo: plusButton.centerXAnchor),
            itemCountLabel.heightAnchor.constraint(equalToConstant: 23),
            itemCountLabel.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: itemCountLabel.bottomAnchor,constant: 16),
            minusButton.centerXAnchor.constraint(equalTo: plusButton.centerXAnchor),
            minusButton.heightAnchor.constraint(equalToConstant: 12.83),
//            minusButton.widthAnchor.constraint(equalToConstant: 11.85)
        ])
    }
    func configure(with product: ProductList) {
        backImageView.image = product.backImageName
        itemImageView.image = product.imageName
        priceLabel.text = "Price: \(product.price)"
        itemNameLabel.text = product.name
        itemWeightLabel.text = "Quantity: \(product.quantity)"
        
    }
}


