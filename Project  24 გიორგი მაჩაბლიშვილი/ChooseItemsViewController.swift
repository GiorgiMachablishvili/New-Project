//
//  ChooseItemsViewController.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 31.05.24.
//

import UIKit
import SnapKit

//MARK: product list struct
struct ProductList {
    let imageName: UIImage
    let backImageName: UIImage
    let heartImage: UIImage
    let saleImage: UIImage
    let price: String
    let name: String
    let quantity: String
    let lineImage : UIImage
    let bagImage: UIImage
}

class ChooseItemsViewController: UIViewController {
    //MARK: -UI components
    private lazy var topLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(hexString: "000000")
        label.font = .poppinsSemiBold(size: 18)
        label.textAlignment = .left
        label.text = "Featured products"
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(hexString: "FFFFFF")
        return collectionView
    }()
    
    //MARK: product array
    let products: [ProductList] = [
        ProductList(imageName: UIImage.peachImage(), backImageName: UIImage.peachBackImage(), heartImage: UIImage.blackHeart, saleImage: UIImage.white, price: "$8.00", name: "Fresh Peach", quantity: "dozen", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.avocadoImage(), backImageName: UIImage.avocadoBackImage(), heartImage: UIImage.blackHeart, saleImage: UIImage.newSale, price: "$7.00", name: "Avacoda", quantity: "2.0 lbs", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.pineappleImage(), backImageName: UIImage.pineappleBackImage(), heartImage: UIImage.redHeart, saleImage: UIImage.white, price: "$9.90", name: "Pineapple", quantity: "1.50 lbs", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.grapesImage(), backImageName: UIImage.grapesBackImage(), heartImage: UIImage.blackHeart, saleImage: UIImage.onsale16, price: "$7.05", name: "Black Grapes", quantity: "5.0 lbs", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.pomegranateImage(), backImageName: UIImage.pomegranateBackImage(), heartImage: UIImage.blackHeart, saleImage: UIImage.newSale, price: "$2.09", name: "Pomegranate", quantity: "1.50 lbs", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!),
        ProductList(imageName: UIImage.broccoliImage(), backImageName: UIImage.brocolBackImage(), heartImage: UIImage.redHeart, saleImage: UIImage.white, price: "$3.00", name: "Fresh B roccoli", quantity: "1 kg", lineImage: UIImage.line, bagImage: UIImage(named: "bagImage")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hexString: "F4F5F9")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setup()
        setupConstraints()
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
        
    }
    
    //MARK: setup ui components
    func setup() {
        view.addSubview(topLabel)
        view.addSubview(collectionView)
    }
    
    //MARK: setup ui components constraints
    func setupConstraints() {
        //MARK: layout constraints
        
        
        topLabel.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(view.frame.height * 0.05)
            make.leading.equalTo(view.snp.leading).offset(view.frame.width * 0.041)
            make.height.equalTo(view.frame.height * 0.023)
        }
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(view.frame.height * 0.103)
            make.leading.equalTo(view.snp.leading).offset(view.frame.width * 0.041)
            make.trailing.equalTo(view.snp.trailing).offset(-(view.frame.width * 0.0386))
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}

extension ChooseItemsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        let product = products[indexPath.item]
        cell.configure(with: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.item]
        let selectedItemVC = SelectedItemViewController()
        selectedItemVC.modalPresentationStyle = .fullScreen
        selectedItemVC.delegate = selectedProduct
        navigationController?.present(selectedItemVC, animated: false)
    }
}

