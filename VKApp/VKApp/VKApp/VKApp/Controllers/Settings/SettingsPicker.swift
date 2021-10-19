//
//  SettingsPicker.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 18.08.2021.
//

import UIKit

enum Settings: Int {
    case image
    case shadow
    
    static let allSettings: [Settings] = [image, shadow]
    
    var title: String {
        switch self {
        case .image: return "Изображение"
        case .shadow: return "Тень"
        }
    }
}

class SettingsPicker: UIControl {

//Чтобы сохранять выбранную настройку, создадим переменную
    var selectedSettings: Settings? = nil {
        didSet {
            self.updateSelectedSettings()
            self.sendActions(for: .valueChanged)
        }
    }

    
//Необходимо хранить в классе UIStackView и массив кнопок:
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!

//Добавим метод, отвечающий за создание UIStackView и кнопок, а также метод, который будет обновлять интерфейс в соответствии с выбранной кнопкой:

    private func setupView() {
        for setting in Settings.allSettings {
            let button = UIButton(type: .system)
            button.setTitle(setting.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectSettings(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }

        stackView = UIStackView(arrangedSubviews: self.buttons)

        self.addSubview(stackView)

        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }

    private func updateSelectedSettings() {
        for (index, button) in self.buttons.enumerated() {
            guard let setting = Settings(rawValue: index) else { continue }
            button.isSelected = setting == self.selectedSettings
        }
    }
    
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

//Метод updateSelectedSettings вызывается каждый раз при изменении свойства selectedSettings. Это можно сделать, добавив метод didSet (добавим выше)

    //Чтобы обработать нажатия на кнопки, создадим метод selectSettings, который указывали, когда добавляли таргет к кнопке:
    
    @objc private func selectSettings(_ sender: UIButton) {
        guard let index = self.buttons.firstIndex(of: sender) else { return }
        guard let settings = Settings(rawValue: index) else { return }
        self.selectedSettings = settings
    }

//В этом методе сначала получаем индекс кнопки (который является номером настроек), затем пытаемся получить настройку, передав в инициализатор его номер. После присваиваем новуй установку свойству selectedSettings.
   
//Осталось вызвать метод sendActions, который сообщит об изменении значения контрола. Это нужно сделать после изменения свойства, то есть в методе didSet: (Выше)



}
