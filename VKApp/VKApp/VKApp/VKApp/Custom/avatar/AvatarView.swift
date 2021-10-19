//
//  AvatarView.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 18.08.2021.
//

import UIKit

class AvatarView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setLayout), name: SingletonSettings.notificationName, object: nil)
    }
    
    @objc func setLayout(){
        layer.borderWidth = SingletonSettings.shared.borderWidth
        layer.borderColor = SingletonSettings.shared.borderColor
        layer.cornerRadius = SingletonSettings.shared.cornerRadius
        layer.masksToBounds = true
    }
}
