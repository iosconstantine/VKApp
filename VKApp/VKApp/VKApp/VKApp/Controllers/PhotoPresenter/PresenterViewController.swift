//
//  PresenterViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 06.09.2021.
//

import UIKit
import Kingfisher

class PresenterViewController: UIViewController {

    // Должно приходить от контроллера со всеми фото
    var photos = [Photos]()
    var selectedPhoto = 0
    
    // private
    var leftImageView: UIImageView!

    var middleImageView: UIImageView!

    var rightImageView: UIImageView!

    // UIViewPropertyAnimator
    var swipeToRight: UIViewPropertyAnimator!
    var swipeToLeft: UIViewPropertyAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let gestPan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        view.addGestureRecognizer(gestPan)
        setImage()
        startAnimate()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.subviews.forEach({ $0.removeFromSuperview() })
    }

    func setImage(){
        var indexPhotoLeft = selectedPhoto - 1
        let indexPhotoMid = selectedPhoto
        var indexPhotoRight = selectedPhoto + 1

        if indexPhotoLeft < 0 {
            indexPhotoLeft = photos.count - 1

        }
        if indexPhotoRight > photos.count - 1 {
            indexPhotoRight = 0
        }
        view.subviews.forEach({ $0.removeFromSuperview() })
        leftImageView = UIImageView()
        middleImageView = UIImageView()
        rightImageView = UIImageView()

        leftImageView.contentMode = .scaleAspectFill
        middleImageView.contentMode = .scaleAspectFill
        rightImageView.contentMode = .scaleAspectFill

        view.addSubview(leftImageView)
        view.addSubview(middleImageView)
        view.addSubview(rightImageView)

        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        middleImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            middleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            middleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            middleImageView.heightAnchor.constraint(equalTo: middleImageView.widthAnchor, multiplier: 4/3),
            middleImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            leftImageView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            leftImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftImageView.heightAnchor.constraint(equalTo: middleImageView.heightAnchor),
            leftImageView.widthAnchor.constraint(equalTo: middleImageView.widthAnchor),

            rightImageView.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            rightImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightImageView.heightAnchor.constraint(equalTo: middleImageView.heightAnchor),
            rightImageView.widthAnchor.constraint(equalTo: middleImageView.widthAnchor),
        ])
        
        let urlLeft = URL(string: photos[indexPhotoLeft].url)
        let urlMid = URL(string: photos[indexPhotoMid].url)
        let urlRight = URL(string: photos[indexPhotoRight].url)
        
        leftImageView.kf.setImage(with: urlLeft)
        middleImageView.kf.setImage(with: urlMid)
        rightImageView.kf.setImage(with: urlRight)
        
        middleImageView.layer.cornerRadius = 8
        rightImageView.layer.cornerRadius = 8
        leftImageView.layer.cornerRadius = 8

        middleImageView.clipsToBounds = true
        rightImageView.clipsToBounds = true
        leftImageView.clipsToBounds = true

        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)

        self.middleImageView.transform = scale
        self.rightImageView.transform = scale
        self.leftImageView.transform = scale

    }

    func startAnimate(){
        setImage()
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [],
            animations: { [unowned self] in
                self.middleImageView.transform = .identity
                self.rightImageView.transform = .identity
                self.leftImageView.transform = .identity
        })
    }

    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            swipeToRight = UIViewPropertyAnimator(
                duration: 0.5,
                curve: .easeInOut,
                animations: {
                    UIView.animate(
                        withDuration: 0.01,
                        delay: 0,
                        options: [],
                        animations: { [unowned self] in
                            let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                            let translation = CGAffineTransform(translationX: self.view.bounds.maxX - 40, y: 0)
                            let transform = scale.concatenating(translation)
                            self.middleImageView.transform = transform
                            self.rightImageView.transform = transform
                            self.leftImageView.transform = transform
                    }, completion: { [unowned self] _ in
                        self.selectedPhoto -= 1
                        if self.selectedPhoto < 0 {
                            self.selectedPhoto = self.photos.count - 1
                        }
                        self.startAnimate()
                    })
            })
            swipeToLeft = UIViewPropertyAnimator(
                duration: 0.5,
                curve: .easeInOut,
                animations: {
                    UIView.animate(
                        withDuration: 0.01,
                        delay: 0,
                        options: [],
                        animations: { [unowned self] in
                            let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                            let translation = CGAffineTransform(translationX: -self.view.bounds.maxX + 40, y: 0)
                            let transform = scale.concatenating(translation)
                            self.middleImageView.transform = transform
                            self.rightImageView.transform = transform
                            self.leftImageView.transform = transform
                    }, completion: { [unowned self] _ in
                        self.selectedPhoto += 1
                        if self.selectedPhoto > self.photos.count - 1 {
                            self.selectedPhoto = 0
                        }
                        self.startAnimate()
                    })
            })
        case .changed:
            let translationX = recognizer.translation(in: self.view).x
            if translationX > 0 {
                swipeToRight.fractionComplete = abs(translationX)/100
            } else {
                swipeToLeft.fractionComplete = abs(translationX)/100
            }

        case .ended:
            swipeToRight.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            swipeToLeft.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            return
        }
    }
}
