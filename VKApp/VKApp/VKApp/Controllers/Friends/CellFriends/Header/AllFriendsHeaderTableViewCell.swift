//
//  AllFriendsHeaderTableViewCell.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 27.08.2021.
//

import UIKit

class AllFriendsHeaderTableViewCell: UITableViewHeaderFooterView {
    
    /*
     переменные
     static
     внешние
     приватные
     
     методы жизненного цикла
     открытые функции
     приватные функции
     */
    static let identifier = "AllFriendsHeaderTableViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ text: String?) {
        label.text = text
    }
    
    private func setupViews() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: 60),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
