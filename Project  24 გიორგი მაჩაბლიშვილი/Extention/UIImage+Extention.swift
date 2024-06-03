//
//  UIImage+Extention.swift
//  Project  24 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 31.05.24.
//

import UIKit

extension UIImage {
    
    //MARK: product images extension
    static func peachImage() -> UIImage {
        return UIImage(named: "peach") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func peachBackImage() -> UIImage {
        return UIImage(named: "pechColorImage") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func avocadoImage() -> UIImage {
        return UIImage(named: "avocado") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func avocadoBackImage() -> UIImage {
        return UIImage(named: "avocColorImage") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func pineappleImage() -> UIImage {
        return UIImage(named: "pineapple") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func pineappleBackImage() -> UIImage {
        return UIImage(named: "pinAppleColor") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func grapesImage() -> UIImage {
        return UIImage(named: "grapes") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func grapesBackImage() -> UIImage {
        return UIImage(named: "grapColorImage") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func pomegranateImage() -> UIImage {
        return UIImage(named: "pomegranate-11") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func pomegranateBackImage() -> UIImage {
        return UIImage(named: "pomegranateColor") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func broccoliImage() -> UIImage {
        return UIImage(named: "broccoli") ?? UIImage(systemName: "pencil.slash")!
    }
    
    static func brocolBackImage() -> UIImage {
        return UIImage(named: "brocolColorImage") ?? UIImage(systemName: "pencil.slash")!
    }
}
