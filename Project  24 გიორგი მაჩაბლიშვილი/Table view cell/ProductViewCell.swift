//
//  ProductViewCell.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 01.06.24.
//

import UIKit
import SnapKit

class ProductViewCell: UITableViewCell {
    
    static let identifier = "ProductViewCell"
    
    //MARK: -UI components
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
    
    //MARK: setup ui components
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
    
    //MARK: setup constraints
    func setupConfiguration() {
        separatorView.snp.remakeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(14)
        }
        
        backImageView.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(14.18)
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.bottom.equalTo(contentView.snp.bottom).offset(-14)
            make.width.equalTo(64)
        }
        
        itemImageView.snp.remakeConstraints { make in
            make.top.equalTo(backImageView.snp.top).offset(16)
            make.leading.equalTo(backImageView.snp.leading).offset(4)
            make.trailing.equalTo(backImageView.snp.trailing).offset(-5)
            make.bottom.equalTo(backImageView.snp.bottom).offset(7.8)
        }
        
        priceLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(22)
            make.leading.equalTo(itemImageView.snp.trailing).offset(22)
            make.height.equalTo(18)
        }
        
        itemNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.leading.equalTo(itemImageView.snp.trailing).offset(22)
            make.height.equalTo(23)
        }
        
        itemWeightLabel.snp.remakeConstraints { make in
            make.top.equalTo(itemNameLabel.snp.bottom)
            make.leading.equalTo(itemImageView.snp.trailing).offset(22)
            make.height.equalTo(18)
        }
        
        plusButton.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(14)
            make.trailing.equalTo(contentView.snp.trailing).offset(-19)
            make.height.equalTo(11.85)
            make.width.equalTo(12.83)
        }
        
        itemCountLabel.snp.remakeConstraints { make in
            make.top.equalTo(plusButton.snp.bottom).offset(14)
            make.centerX.equalTo(plusButton.snp.centerX)
            make.height.equalTo(23)
            make.width.equalTo(10)
        }
        
        minusButton.snp.remakeConstraints { make in
            make.centerX.equalTo(plusButton.snp.centerX)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.width.equalTo(12.8)
        }
    }
    
    func configure(with product: ProductList) {
        backImageView.image = product.backImageName
        itemImageView.image = product.imageName
        priceLabel.text = "Price: \(product.price)"
        itemNameLabel.text = product.name
        itemWeightLabel.text = "Quantity: \(product.quantity)"
    }
}


