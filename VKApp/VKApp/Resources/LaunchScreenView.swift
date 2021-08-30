//
//  LaunchScreenView.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 28.08.2021.
//

import UIKit

class LaunchScreen: UIViewController {
    
    @IBOutlet weak var firstCircle: UIView!
    @IBOutlet weak var secondCircle: UIView!
    @IBOutlet weak var thirdCircle: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstCircle.layer.cornerRadius = firstCircle.frame.size.height / 2
        secondCircle.layer.cornerRadius = secondCircle.frame.size.height / 2
        thirdCircle.layer.cornerRadius = thirdCircle.frame.size.height / 2
    }
    func animation() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.repeat, .autoreverse]) {
            self.firstCircle.alpha = 0
        }
        
        UIView.animate(
            withDuration: 1,
            delay: 0.5,
            options: [.repeat, .autoreverse]) {
            self.secondCircle.alpha = 0
        }
        
        UIView.animate(
            withDuration: 1,
            delay: 1,
            options: [.repeat, .autoreverse]) {
            self.thirdCircle.alpha = 0
        }
        
        
    }
    
}

