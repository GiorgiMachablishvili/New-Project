//
//  CheckoutViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 01.06.24.
//

import UIKit

protocol ProductInfo: AnyObject {
    func productInfo(_ backImage: UIImage, _ mainImage: UIImage, _ price: String, _ title: String, _ itemWeight: String)
}

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
        label.textAlignment = .center
        return label
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = UIColor(hexString: "6CC51D")
        return button
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
        label.text = "$"
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
        label.text = "$"
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
        label.text = "$"
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductViewCell.self, forCellReuseIdentifier: "ProductViewCell")
        return tableView
    }()
    
    private var productList: [ProductList] = []
    
    var delegate: ProductList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraint()
    }
    
    //MARK: back to next page
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: setup ui components
    func setup() {
        view.addSubview(topView)
        topView.addSubview(titleLabel)
        view.addSubview(bottomView)
        tableView.addSubview(plusButton)
        tableView.addSubview(itemCountLabel)
        tableView.addSubview(minusButton)
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
        //        view.translatesAutoresizingMaskIntoConstraints = false
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
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        itemCountLabel.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: layout constraints
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
            plusButton.topAnchor.constraint(equalTo: tableView.topAnchor,constant: 16),
            plusButton.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -19.17),
            plusButton.heightAnchor.constraint(equalToConstant: 11.85),
            plusButton.widthAnchor.constraint(equalToConstant: 12.83)
        ])
        
        NSLayoutConstraint.activate([
            itemCountLabel.topAnchor.constraint(equalTo: plusButton.topAnchor,constant: 16.15),
            itemCountLabel.centerXAnchor.constraint(equalTo: plusButton.centerXAnchor),
            itemCountLabel.heightAnchor.constraint(equalToConstant: 23),
            itemCountLabel.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: itemCountLabel.topAnchor,constant: 17),
            minusButton.centerXAnchor.constraint(equalTo: plusButton.centerXAnchor),
            minusButton.heightAnchor.constraint(equalToConstant: 0),
            minusButton.widthAnchor.constraint(equalToConstant: 12.83)
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
        50
    }
}

extension CheckoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
        if let product = delegate {
            cell.configure(with: product)
        }
        return cell
    }
}
 
