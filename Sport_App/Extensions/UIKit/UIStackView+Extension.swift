//
//  UIStackView+Extension.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 25.11.2022.
//

import UIKit

/*
let stackView = UIStackView()
stackView.addArrangedSubview(yourView)
stackView.addArrangedSubview(yourView2)
stackView.axis = .horizontal
stackView.spacing = 10
stackView.translatesAutoresizingMaskIntoConstraints = false
*/

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing:CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
            self.axis = axis
            self.spacing = spacing
            self.translatesAutoresizingMaskIntoConstraints = false
    }
}
