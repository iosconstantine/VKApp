//
//  ViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 06.08.2021.
//

import UIKit


class ViewController: UIViewController {
    

    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordButtonSecurity: UIButton!
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if loginTextField.text == "123" && passwordTextField.text == "123" {
            return true
        } else {
            showAlert(title: "Неверный логин или пароль", message: "Проверьте правильность введенных данных.")
            return false
        }
    }
    
    @IBAction func loginActionTextField(_ sender: UITextField) {
        
    }
    
    
    @IBAction func passwordActionTextField(_ sender: UITextField) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Проверка на работоспособность
       
        //network.getPhotos(owner_id: Session.shared.userId ?? 0)
        //network.getGroups()
       
    
        buttonOutlet.layer.cornerRadius = 10 // Закругление углов у кнопки
        
        // Добавил цвет надписи в Placeholder
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Телефон или Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        passwordButtonSecurity.tintColor = .lightGray
        
    }
    
    // Сделал убирание клавиатуры
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let actionAlertButton = UIAlertAction(title: "Повторить",
                                              style: .destructive) { [weak self] _ in
            guard let self = self else { return }
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        alertController.addAction(actionAlertButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func togglePassword() { // Secure text entry
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            passwordButtonSecurity.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordButtonSecurity.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
    
    @IBAction func passwordSecurityAction(_ sender: UIButton) {
        togglePassword()
    }
    
}

