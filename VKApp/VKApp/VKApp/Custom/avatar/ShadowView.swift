//
//  ShadowView.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 18.08.2021.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setLayout), name: SingletonSettings.notificationName, object: nil)
    }
    
    @objc func setLayout(){
        layer.cornerRadius = SingletonSettings.shared.cornerRadius
        layer.shadowColor = SingletonSettings.shared.shadowColor
        layer.shadowRadius = SingletonSettings.shared.shadowRadius
        layer.shadowOffset = .zero
        layer.shadowOpacity = SingletonSettings.shared.shadowOpacity
    }
}
