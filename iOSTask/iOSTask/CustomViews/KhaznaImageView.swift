//
//  KhaznaImageView.swift
//  iOSTask
//
//  Created by Adel Aref on 14/11/2024.
//


import UIKit

class KhaznaImageView: UIImageView {

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
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }

}
