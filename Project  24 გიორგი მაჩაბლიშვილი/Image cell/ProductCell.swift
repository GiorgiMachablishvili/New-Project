//
//  ProductCell.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 31.05.24.
//

import UIKit
import SnapKit

class ProductCell: UICollectionViewCell {
    
    static let identifier = "ProductCell"
    
    //MARK: -UI components
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
    
    //MARK: setup ui components
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
    
    //MARK: setup constraints
    func setupConstraints() {
        backImageView.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(21)
            make.leading.equalTo(contentView.snp.leading).offset(41)
            make.trailing.equalTo(contentView.snp.trailing).offset(-48)
            make.bottom.equalTo(contentView.snp.bottom).offset(-119)
        }
        
//        backImageView.snp.remakeConstraints { make in
//            make.top.equalTo(contentView.snp.top).offset(contentView.frame.height * 0.023)
//            make.leading.equalTo(contentView.snp.leading).offset(contentView.frame.width * 0.01)
//            make.trailing.equalTo(contentView.snp.trailing).offset(-(contentView.frame.width * 0.053))
//            make.bottom.equalTo(contentView.snp.bottom).offset(-(contentView.frame.height * 0.132))
//        }
        
        imageView.snp.remakeConstraints { make in
            make.top.equalTo(backImageView.snp.top).offset(22)
            make.leading.equalTo(backImageView.snp.leading).offset(-7)
            make.trailing.equalTo(backImageView.snp.trailing)
            make.bottom.equalTo(backImageView.snp.bottom).offset(10)
        }
        
        heartImageView.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(9)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8)
            make.height.equalTo(16)
            make.width.equalTo(18)
        }
        
        saleImage.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading)
            make.height.equalTo(18)
            make.width.equalTo(38)
        }
        
        priceLabel.snp.remakeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(3)
            make.centerX.equalTo(imageView.snp.centerX)
            make.height.equalTo(18)
        }
        
        itemNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalTo(imageView.snp.centerX)
            make.height.equalTo(23)
        }
        
        itemWeightLabel.snp.remakeConstraints { make in
            make.top.equalTo(itemNameLabel.snp.bottom).offset(1)
            make.centerX.equalTo(imageView.snp.centerX)
            make.height.equalTo(18)
        }
        
        line.snp.remakeConstraints { make in
            make.top.equalTo(itemWeightLabel.snp.bottom).offset(11)
            make.centerX.equalTo(itemWeightLabel.snp.centerX)
            make.width.equalTo(171)
            make.height.equalTo(1)
        }
        
        stackView.snp.remakeConstraints { make in
            make.centerX.equalTo(itemNameLabel.snp.centerX)
            make.top.equalTo(line.snp.bottom).offset(12)
            make.width.equalTo(90)
            make.height.equalTo(18)
        }
        
        bagImageView.snp.remakeConstraints { make in
            make.width.equalTo(13)
            make.height.equalTo(15)
        }
        
        addCartButtonItem.snp.remakeConstraints { make in
            make.leading.equalTo(bagImageView.snp.trailing).offset(9)
            make.width.equalTo(68)
            make.height.equalTo(18)
        }
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
