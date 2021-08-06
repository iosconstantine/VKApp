//
//  ViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 06.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        if loginTextField.text == "123" && passwordTextField.text == "123" {
            print("Success")
        } else {
            loginTextField.text = nil
            passwordTextField.text = nil
            let alert = UIAlertController(
                title: "Не удаётся войти",
                message: "Пожалуйста, проверьте правильность написания логина и пароля.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Повторить", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    // Реализовать изначально хотел так, чтобы кнопка была доступна только после того как будет в обоих полях Логин и Пароль хоть один символ, но делегаты и наблюдателей еще не разбирали, поэтому решил реализовать по другому. Сначала Логин набираем - есть символ значит дальше пароль, и как только в поле пароль будет символ, то делаем доступную кнопку.
    
    @IBAction func loginActionTextField(_ sender: UITextField) { // Пока не будет введет логин, поле пароль не доступно для ввода, как только ввели что-нибудль, поле пароль доступно для ввода. Если в поле пароль есть символы и мы убираем все символы с поля логин, то с поля пароль так же все автоматически убирается
        guard let text = sender.text else {
            return
        }
        
        if text.count > 0 {
            passwordTextField.isEnabled = true
        } else {
            passwordTextField.isEnabled = false
            passwordTextField.text = nil
            buttonOutlet.alpha = 0.5
            buttonOutlet.isEnabled = false
        }
    }
    
    
    @IBAction func passwordActionTextField(_ sender: UITextField) {
        guard let text = sender.text else {
            return
        }
        
        if text.count > 0 {
            buttonOutlet.alpha = 1
            buttonOutlet.isEnabled = true
        } else {
            buttonOutlet.alpha = 0.5
            buttonOutlet.isEnabled = false
        }
    }
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isEnabled = false
        
        buttonOutlet.isEnabled = false
        buttonOutlet.layer.cornerRadius = 10 // Закругление углов у кнопки
        buttonOutlet.alpha = 0.5
        
        // Добавил цвет надписи в Placeholder
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Телефон или Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
    }
    
    // Сделал убирание клавиатуры намного легче
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

