//
//  CheckoutViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 01.06.24.
//

import UIKit
import SnapKit

class CheckoutViewController: UIViewController {
    private lazy var topView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "FFFFFF")
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "000000")
        label.font = .poppinsSemiBold(size: 18)
        label.textAlignment = .left
        label.text = "Shopping Cart"
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "FFFFFF")
        return view
    }()
    
    private lazy var subTotalLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 12)
        label.textAlignment = .left
        label.text = "Subtotal"
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var subTotalPriceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 12)
        label.text = "56.7"
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var shippingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 12)
        label.textAlignment = .left
        label.text = "Shipping charges"
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var shippingPriceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "868889")
        label.font = .poppinsRegular(size: 12)
        label.text = "$1.6"
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "000000")
        label.font = .poppinsSemiBold(size: 18)
        label.textAlignment = .left
        label.text = "ToTal"
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "000000")
        label.font = .poppinsSemiBold(size: 18)
        label.text = "$58.2"
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = UIColor(hexString: "AEDC81")
        button.setTitle("Checkout", for: .normal)
        button.titleLabel?.font = .poppinsRegular(size: 15)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor(hexString: "F4F5F9")
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductViewCell.self, forCellReuseIdentifier: "ProductViewCell")
        return tableView
    }()
    
    private var productList: [ProductList] = [
        ProductList(imageName: UIImage.peachImage(), backImageName: UIImage.peachBackImage(), heartImage: UIImage.blackHeart, saleImage: UIImage.white, price: "$8.00", name: "Fresh Peach", quantity: "dozen", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.avocadoImage(), backImageName: UIImage.avocadoBackImage(), heartImage: UIImage.blackHeart, saleImage: UIImage.newSale, price: "$7.00", name: "Avacoda", quantity: "2.0 lbs", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.pineappleImage(), backImageName: UIImage.pineappleBackImage(), heartImage: UIImage.redHeart, saleImage: UIImage.white, price: "$9.90", name: "Pineapple", quantity: "1.50 lbs", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.grapesImage(), backImageName: UIImage.grapesBackImage(), heartImage: UIImage.blackHeart, saleImage: UIImage.onsale16, price: "$7.05", name: "Black Grapes", quantity: "5.0 lbs", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.pomegranateImage(), backImageName: UIImage.pomegranateBackImage(), heartImage: UIImage.blackHeart, saleImage: UIImage.newSale, price: "$2.09", name: "Pomegranate", quantity: "1.50 lbs", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.broccoliImage(), backImageName: UIImage.brocolBackImage(), heartImage: UIImage.redHeart, saleImage: UIImage.white, price: "$3.00", name: "Fresh B roccoli", quantity: "1 kg", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraint()
        
        self.view.backgroundColor = UIColor(hexString: "F4F5F9")
    }
    
    //MARK: back to next page
    @objc func goBack() {
        navigationController?.dismiss(animated: true)
    }
    
    //MARK: setup ui components
    func setup() {
        view.addSubview(tableView)
        view.addSubview(topView)
        topView.addSubview(titleLabel)
        view.addSubview(bottomView)
        bottomView.addSubview(subTotalLabel)
        bottomView.addSubview(subTotalPriceLabel)
        bottomView.addSubview(shippingLabel)
        bottomView.addSubview(shippingPriceLabel)
        bottomView.addSubview(totalLabel)
        bottomView.addSubview(totalPriceLabel)
        bottomView.addSubview(checkButton)
        
    }
    
    //MARK: layout constraints
    func setupConstraint() {
        tableView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(view.frame.height * 0.130)
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.041)
            make.bottom.equalTo(view.snp.bottom).offset(-(view.frame.height * 0.259))
        }
        
        topView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.131)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(topView.snp.top).offset(view.frame.height * 0.0688)
            make.centerX.equalTo(topView.snp.centerX)
            make.height.equalTo(view.frame.height * 0.0299)
        }
        
        bottomView.snp.remakeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.259)
        }
        
        subTotalLabel.snp.remakeConstraints { make in
            make.top.equalTo(bottomView.snp.top).offset(view.frame.height * 0.0244)
            make.leading.equalTo(bottomView.snp.leading).offset(view.frame.width * 0.041)
            make.height.equalTo(view.frame.height * 0.0199)
        }
        
        subTotalPriceLabel.snp.remakeConstraints { make in
            make.top.equalTo(bottomView.snp.top).offset(view.frame.height * 0.0199)
            make.trailing.equalTo(bottomView.snp.trailing).offset(-(view.frame.width * 0.041))
            make.height.equalTo(view.frame.height * 0.0199)
        }
        
        shippingLabel.snp.remakeConstraints { make in
            make.top.equalTo(subTotalLabel.snp.bottom).offset(view.frame.height * 0.0077)
            make.leading.equalTo(bottomView.snp.leading).offset(view.frame.width * 0.041)
            make.height.equalTo(view.frame.height * 0.0199)
        }
        
        shippingPriceLabel.snp.remakeConstraints { make in
            make.top.equalTo(subTotalPriceLabel.snp.bottom).offset(view.frame.height * 0.0077)
            make.trailing.equalTo(bottomView.snp.trailing).offset(-(view.frame.width * 0.041))
            make.height.equalTo(view.frame.height * 0.0199)
        }
        
        totalLabel.snp.remakeConstraints { make in
            make.top.equalTo(shippingLabel.snp.bottom).offset(view.frame.height * 0.033)
            make.leading.equalTo(bottomView.snp.leading).offset(view.frame.width * 0.041)
            make.height.equalTo(view.frame.height * 0.0299)
        }
        
        totalPriceLabel.snp.remakeConstraints { make in
            make.top.equalTo(shippingPriceLabel.snp.bottom).offset(view.frame.height * 0.033)
            make.trailing.equalTo(bottomView.snp.trailing).offset(-(view.frame.width * 0.041))
            make.height.equalTo(view.frame.height * 0.0299)
        }
        
        checkButton.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(view.frame.width * 0.041)
            make.bottom.equalTo(bottomView.snp.bottom).offset(-(view.frame.height * 0.0399))
            make.height.equalTo(view.frame.height * 0.066)
        }
    }
}

extension CheckoutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
}

extension CheckoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as? ProductViewCell else {
            return UITableViewCell()
        }
        let product = productList[indexPath.item]
        cell.configure(with: product)
        return cell
    }
}


