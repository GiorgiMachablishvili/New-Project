//
//  ProductCell.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 31.05.24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static let identifier = "ProductCell"
    
    private lazy var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var saleImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "6CC51D")
        label.font = .poppinsSemiBold(size: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var itemNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "000000")
        label.font = .poppinsSemiBold(size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var itemWeightLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var line : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.tintColor = UIColor(hexString: "F4F5F9")
        imageView.image = UIImage(named: "line")
        return imageView
    }()
    
    private lazy var bagImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
//        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var addCartButtonItem: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(UIColor(hexString: "010101"), for: .normal)
        button.titleLabel?.font = .poppinsSemiBold(size: 12)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.spacing = 9
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setup() {
        contentView.addSubview(backImageView)
        contentView.addSubview(heartImageView)
        contentView.addSubview(saleImage)
        backImageView.addSubview(imageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(itemWeightLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(line)
        stackView.addSubview(bagImageView)
        stackView.addSubview(addCartButtonItem)
    }
    
    func setupConstraints() {
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        saleImage.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        bagImageView.translatesAutoresizingMaskIntoConstraints = false
        addCartButtonItem.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            backImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42),
            backImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
            backImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -119)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 22),
            imageView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: -7),
            imageView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            heartImageView.heightAnchor.constraint(equalToConstant: 16),
            heartImageView.widthAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            saleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            saleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            saleImage.heightAnchor.constraint(equalToConstant: 18),
            saleImage.widthAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 3),
            priceLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            itemNameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            itemWeightLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 1),
            itemWeightLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            itemWeightLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: itemWeightLabel.bottomAnchor, constant: 11),
            line.centerXAnchor.constraint(equalTo: itemWeightLabel.centerXAnchor),
            line.widthAnchor.constraint(equalToConstant: 171),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: itemNameLabel.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 12),
            stackView.widthAnchor.constraint(equalToConstant: 90),
            stackView.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            bagImageView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            bagImageView.widthAnchor.constraint(equalToConstant: 13),
            bagImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            addCartButtonItem.leadingAnchor.constraint(equalTo: bagImageView.trailingAnchor, constant: 9),
            addCartButtonItem.centerYAnchor.constraint(equalTo: bagImageView.centerYAnchor),
            addCartButtonItem.widthAnchor.constraint(equalToConstant: 68),
            addCartButtonItem.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func configure(with product: ProductList) {
        backImageView.image = product.backImageName
        imageView.image = product.imageName
        heartImageView.image = product.heartImage
        saleImage.image = product.saleImage
        itemNameLabel.text = product.name
        priceLabel.text = product.price
        itemWeightLabel.text = product.quantity
        bagImageView.image = product.bagImage
    }
    
}
