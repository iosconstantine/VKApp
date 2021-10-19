//
//  SettingsViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 18.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    let settingsPicker = SettingsPicker()
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var settingsIsHidden = true
    
    let labelFirst = UILabel()
    let labelSecond = UILabel()
    let colorLabel = UILabel()
    
    let firstStepper = UIStepper()
    let secondStepper = UIStepper()
    
    let rSlider = UISlider()
    let gSlider = UISlider()
    let bSlider = UISlider()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setViews()
        setImageAndShadowView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Добавляем все элементы и устанавливаем констрейнты
    func setViews() {
        view.addSubview(settingsPicker)
        settingsPicker.addTarget(self, action: #selector(setSettingsInterface), for: .valueChanged)
        
        settingsPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        settingsPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        settingsPicker.topAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: 20).isActive = true
        settingsPicker.heightAnchor.constraint(equalToConstant: 40).isActive = true
        settingsPicker.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelFirst)
        labelFirst.translatesAutoresizingMaskIntoConstraints = false
        labelFirst.topAnchor.constraint(equalTo: settingsPicker.bottomAnchor, constant: 100).isActive = true
        labelFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelFirst.widthAnchor.constraint(equalToConstant: 150).isActive = true
        labelFirst.isHidden = settingsIsHidden
        
        view.addSubview(firstStepper)
        firstStepper.translatesAutoresizingMaskIntoConstraints = false
        firstStepper.addTarget(self, action: #selector(setFirstSettings), for: .primaryActionTriggered)
        
        firstStepper.centerYAnchor.constraint(equalTo: labelFirst.centerYAnchor).isActive = true
        firstStepper.leadingAnchor.constraint(equalTo: labelFirst.trailingAnchor, constant: 40).isActive = true
        firstStepper.isHidden = settingsIsHidden
        
        view.addSubview(labelSecond)
        labelSecond.translatesAutoresizingMaskIntoConstraints = false
        
        labelSecond.topAnchor.constraint(equalTo: labelFirst.bottomAnchor, constant: 20).isActive = true
        labelSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        labelSecond.widthAnchor.constraint(equalToConstant: 150).isActive = true
        labelSecond.isHidden = settingsIsHidden
        
        view.addSubview(secondStepper)
        secondStepper.translatesAutoresizingMaskIntoConstraints = false
        
        secondStepper.addTarget(self, action: #selector(setFirstSettings), for: .primaryActionTriggered)
        
        secondStepper.centerYAnchor.constraint(equalTo: labelSecond.centerYAnchor).isActive = true
        secondStepper.leadingAnchor.constraint(equalTo: labelSecond.trailingAnchor, constant: 40).isActive = true
        secondStepper.isHidden = settingsIsHidden
        
        view.addSubview(colorLabel)
        colorLabel.textAlignment = .center
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        colorLabel.topAnchor.constraint(equalTo: labelSecond.bottomAnchor, constant: 30).isActive = true
        colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        colorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        colorLabel.isHidden = settingsIsHidden
        
        view.addSubview(rSlider)
        rSlider.translatesAutoresizingMaskIntoConstraints = false
        rSlider.minimumTrackTintColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        rSlider.thumbTintColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        rSlider.maximumValue = 1
        rSlider.minimumValue = 0
        rSlider.addTarget(self, action: #selector(setFirstSettings), for: .valueChanged)
        
        rSlider.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 20).isActive = true
        rSlider.widthAnchor.constraint(equalToConstant: 200).isActive = true
        rSlider.centerXAnchor.constraint(equalTo: colorLabel.centerXAnchor).isActive = true
        rSlider.isHidden = settingsIsHidden
        
        view.addSubview(gSlider)
        gSlider.translatesAutoresizingMaskIntoConstraints = false
        gSlider.minimumTrackTintColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
        gSlider.thumbTintColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
        gSlider.maximumValue = 1
        gSlider.minimumValue = 0
        gSlider.addTarget(self, action: #selector(setFirstSettings), for: .valueChanged)
        
        gSlider.topAnchor.constraint(equalTo: rSlider.bottomAnchor, constant: 20).isActive = true
        gSlider.widthAnchor.constraint(equalToConstant: 200).isActive = true
        gSlider.centerXAnchor.constraint(equalTo: colorLabel.centerXAnchor).isActive = true
        gSlider.isHidden = settingsIsHidden
        
        view.addSubview(bSlider)
        bSlider.translatesAutoresizingMaskIntoConstraints = false
        bSlider.minimumTrackTintColor = #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)
        bSlider.thumbTintColor = #colorLiteral(red: 0, green: 0, blue: 1, alpha: 1)
        bSlider.maximumValue = 1
        bSlider.minimumValue = 0
        bSlider.addTarget(self, action: #selector(setFirstSettings), for: .valueChanged)
        
        bSlider.topAnchor.constraint(equalTo: gSlider.bottomAnchor, constant: 20).isActive = true
        bSlider.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bSlider.centerXAnchor.constraint(equalTo: colorLabel.centerXAnchor).isActive = true
        bSlider.isHidden = settingsIsHidden
        
    }
    
    func setImageAndShadowView() {
        imageView.layer.borderWidth = SingletonSettings.shared.borderWidth
        imageView.layer.cornerRadius = SingletonSettings.shared.cornerRadius
        imageView.layer.borderColor = SingletonSettings.shared.borderColor
        
        shadowView.layer.cornerRadius = SingletonSettings.shared.cornerRadius
        shadowView.layer.shadowRadius = SingletonSettings.shared.shadowRadius
        shadowView.layer.shadowOpacity = SingletonSettings.shared.shadowOpacity
        shadowView.layer.shadowColor = SingletonSettings.shared.shadowColor
    }
    
    //по нажатию на пикер обрабатываем логику работы
    @objc private func setSettingsInterface() {
 
        guard settingsPicker.selectedSettings != nil else {
            return
        }
        settingsIsHidden = false
        
        switch settingsPicker.selectedSettings! {
        case Settings.image:
            labelFirst.text = "Ширина рамки"
            labelSecond.text = "Закругление"
            colorLabel.text = "Цвет рамки"
            
            firstStepper.value = Double(SingletonSettings.shared.borderWidth)
            firstStepper.minimumValue = 0
            firstStepper.maximumValue = 10
            firstStepper.stepValue = 1
            
            secondStepper.value = Double(SingletonSettings.shared.cornerRadius)
            secondStepper.minimumValue = 0
            secondStepper.maximumValue = 40
            secondStepper.stepValue = 5
            
            let arrColor = SingletonSettings.shared.borderColor.components
            rSlider.value = Float(arrColor?[0] ?? 0)
            gSlider.value = Float(arrColor?[1] ?? 0)
            bSlider.value = Float(arrColor?[2] ?? 0)

        case Settings.shadow:
            labelFirst.text = "Радиус тени"
            labelSecond.text = "Непрозрачность"
            colorLabel.text = "Цвет тени"
            
            firstStepper.value = Double(SingletonSettings.shared.shadowRadius)
            firstStepper.minimumValue = 0
            firstStepper.maximumValue = 15
            firstStepper.stepValue = 1
            
            secondStepper.value = Double(SingletonSettings.shared.shadowOpacity)
            secondStepper.minimumValue = 0
            secondStepper.maximumValue = 1
            secondStepper.stepValue = 0.1
            
            let arrColor = SingletonSettings.shared.shadowColor.components
            rSlider.value = Float(arrColor?[0] ?? 0)
            gSlider.value = Float(arrColor?[1] ?? 0)
            bSlider.value = Float(arrColor?[2] ?? 0)
            
        }
        setViews()
    }
    
    @objc private func setFirstSettings(){
        switch settingsPicker.selectedSettings! {
        case Settings.image:
            SingletonSettings.shared.borderWidth = CGFloat(firstStepper.value)
            SingletonSettings.shared.cornerRadius = CGFloat(secondStepper.value)
            SingletonSettings.shared.borderColor = CGColor(srgbRed: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: 1)
          
        case Settings.shadow:
            SingletonSettings.shared.shadowRadius = CGFloat(firstStepper.value)
            SingletonSettings.shared.shadowOpacity = Float(secondStepper.value)
            SingletonSettings.shared.shadowColor = CGColor(srgbRed: CGFloat(rSlider.value), green: CGFloat(gSlider.value), blue: CGFloat(bSlider.value), alpha: 1)
        }
        setImageAndShadowView()
        SingletonSettings.shared.notificate()
    }

    
}
