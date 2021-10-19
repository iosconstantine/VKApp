//
//  PhotoView.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 18.08.2021.
//

import UIKit

class PhotoView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 35
        self.layer.masksToBounds = true
    }
}

