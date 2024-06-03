//
//  ItemCollectionViewCell.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 31.05.24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let identifier = "itemCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
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
        label.font = .poppinsSemiBold(size: 15)
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
    
    private lazy var addCartButtonItem: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(UIColor(hexString: "010101"), for: .normal)
        button.titleLabel?.font = .poppinsSemiBold(size: 18)
        return button
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
        contentView.addSubview(imageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(itemWeightLabel)
        contentView.addSubview(addCartButtonItem)
    }
    
    func setupConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        addCartButtonItem.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -119)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 73),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -74),
            priceLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 17),
            itemNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
            itemNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -43),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        NSLayoutConstraint.activate([
            itemWeightLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 1),
            itemWeightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 72),
            itemWeightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -72),
            itemWeightLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            itemWeightLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 23),
            itemWeightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 46),
            itemWeightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
            itemWeightLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}
