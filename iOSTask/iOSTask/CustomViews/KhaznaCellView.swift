//
//  KhaznaCellView.swift
//  iOSTask
//
//  Created by Adel Aref on 14/11/2024.
//


import UIKit

class KhaznaCellView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(named: "PrimaryColor")
        layer.cornerRadius = 15
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 1)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4.0
    }
    
    func setCustomCorner(_ raduis: CGFloat) {
        layer.cornerRadius = raduis

    }
    
}
