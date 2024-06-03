//
//  UIFont+Extention.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 30.05.24.
//

import UIKit

extension UIFont {
    //MARK: font extension
    static func poppinsMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Medium", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func poppinsRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func poppinsSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Poppins-SemiBold", size: size) ?? .systemFont(ofSize: size)
    }
}
