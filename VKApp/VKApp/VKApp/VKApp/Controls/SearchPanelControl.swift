//
//  SearchPanelControl.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 19.08.2021.
//

import UIKit

class SearchPanelControl: UIControl {
    
    //Чтобы сохранять выбранную настройку, создадим переменную
        var selectedLetter: String? = nil {
            didSet {
                //self.updateSelectedSettings()
                self.sendActions(for: .valueChanged)
            }
        }

    var letters = [String]() {
        didSet {
            setupView()
        }
    }
    
    func setLetters(_ letters: [String]) {
        self.letters = letters
    }
        
    //Необходимо хранить в классе UIStackView и массив кнопок:
        private var buttons: [UIButton] = []
        private var stackView: UIStackView!

    //Добавим метод, отвечающий за создание UIStackView и кнопок, а также метод, который будет обновлять интерфейс в соответствии с выбранной кнопкой:

        private func setupView() {
            for letter in letters {
                let button = UIButton(type: .system)
                button.setTitle(letter.uppercased(), for: .normal)
                button.setTitleColor(.lightGray, for: .normal)
                button.setTitleColor(.white, for: .selected)
                button.addTarget(self, action: #selector(selectedLetter(_:)), for: .touchUpInside)
                self.buttons.append(button)
            }

            stackView = UIStackView(arrangedSubviews: self.buttons)

            self.addSubview(stackView)

            stackView.spacing = 0
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.distribution = .fillEqually
        }

//        private func updateSelectedSettings() {
//            for (index, button) in self.buttons.enumerated() {
//                guard let setting = Settings(rawValue: index) else { continue }
//                button.isSelected = setting == self.selectedSettings
//            }
//        }
        
    //Мы не установили констрейнты для UIStackView. Вместо них будем менять frame в методе layoutSubviews:

        override func layoutSubviews() {
            super.layoutSubviews()
            stackView.frame = bounds
        }
        
    //Метод setupView нужно вызвать в инициализаторах класса:
        override init(frame: CGRect) {
             super.init(frame: frame)
            self.setupView()
        }
            
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.setupView()
        }


        //Чтобы обработать нажатия на кнопки, создадим метод selectSettings, который указывали, когда добавляли таргет к кнопке:
        
        @objc private func selectedLetter(_ sender: UIButton) {
            guard let index = self.buttons.firstIndex(of: sender) else { return }
            let letter = letters[index]
            self.selectedLetter = letter
        }

}
