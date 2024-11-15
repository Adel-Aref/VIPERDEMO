//
//  KhaznaShadowView.swift
//  iOSTask
//
//  Created by Adel Aref on 14/11/2024.
//

import UIKit

class KhaznaShadowView: UIView {
    
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
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 4
    }
    
}
