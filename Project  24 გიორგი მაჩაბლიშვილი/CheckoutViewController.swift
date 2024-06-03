//
//  CheckoutViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 01.06.24.
//

import UIKit

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
        navigationController?.popViewController(animated: true)
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
    
    //MARK: setup ui components constraints
    func setupConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        subTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        subTotalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        shippingLabel.translatesAutoresizingMaskIntoConstraints = false
        shippingPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: layout constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 118),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -234)
        ])
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 118)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor,constant: 62),
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 234)
        ])
        
        NSLayoutConstraint.activate([
            subTotalLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 22),
            subTotalLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 17),
            subTotalLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            subTotalPriceLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 22),
            subTotalPriceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -17),
            subTotalPriceLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            shippingLabel.topAnchor.constraint(equalTo: subTotalLabel.bottomAnchor, constant: 7),
            shippingLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 17),
            shippingLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            shippingPriceLabel.topAnchor.constraint(equalTo: subTotalPriceLabel.bottomAnchor, constant: 7),
            shippingPriceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -17),
            shippingPriceLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            totalLabel.topAnchor.constraint(equalTo: shippingLabel.bottomAnchor, constant: 30),
            totalLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 17),
            totalLabel.heightAnchor.constraint(equalToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            totalPriceLabel.topAnchor.constraint(equalTo: shippingPriceLabel.bottomAnchor, constant: 30),
            totalPriceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -17),
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            checkButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 17),
            checkButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -17),
            checkButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -36),
            checkButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension CheckoutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
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
 

