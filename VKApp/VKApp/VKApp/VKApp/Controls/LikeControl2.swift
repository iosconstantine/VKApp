//
//  LikeControl2.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 28.08.2021.
//

import UIKit

class LikeControl2: UIControl {

    private(set) var isLike: Bool = false
    private var countLike: Int = 0

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let countLable: UILabel = {
        let countLable = UILabel()
        countLable.textAlignment = .right
        countLable.translatesAutoresizingMaskIntoConstraints = false
        return countLable
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        addGestures()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        addGestures()
    }

    private func setViews() {
        addSubview(countLable)
        addSubview(imageView)
        
        countLable.textColor = .red
        imageView.tintColor = .red
    

        NSLayoutConstraint.activate([

            imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: self.heightAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            countLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countLable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLable.trailingAnchor.constraint(equalTo: imageView.leadingAnchor)
        ])
    }

    func configure(isLike: Bool, count: Int) {
        self.isLike = isLike
        countLike = count

        if isLike {
            imageView.image = UIImage(systemName: "heart.fill")
        } else {
            imageView.image = UIImage(systemName: "heart")
        }
        setLikeCounterLabel()
    }

    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(controlTapped))
        // тап по контролу
//        addGestureRecognizer(tap)
        // тап по картинке
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }

    @objc private func controlTapped() {
        isLike.toggle()

        if isLike {
            imageView.image = UIImage(systemName: "heart.fill")
            countLike += 1
            setLikeCounterLabel()
        } else {
            imageView.image = UIImage(systemName: "heart")
            countLike -= 1
            setLikeCounterLabel()
        }

        sendActions(for: .valueChanged)
    }

    private func setLikeCounterLabel() {
            let likeString: String?

            switch countLike {
            case 0..<1000:
                likeString = String(self.countLike)
            case 1000..<1_000_000:
                likeString = String(self.countLike/1000) + "K"
            default:
                likeString = "-"
            }
            UIView.transition(with: countLable,
                              duration: 0.3,
                              options: .transitionFlipFromTop,
                              animations: { [unowned self] in
                            self.countLable.text = String(likeString!)
            })
        }
}

