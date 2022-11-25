//
//  UIView+Extensions.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 23.11.2022.
//

import UIKit

extension UIView {
    
    func addShadowView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1.0
    }
}
