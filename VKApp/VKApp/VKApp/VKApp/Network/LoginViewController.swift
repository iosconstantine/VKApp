//
//  LoginViewController.swift
//  VKApp
//
//  Created by KONSTANTIN TISHCHENKO on 17.09.2021.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    @IBOutlet var webView: WKWebView! {
        didSet{
            webView.navigationDelegate = self
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7958348"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        print(request)
        webView.load(request)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        let userID = params["user_id"]
       
        if let token = token, let userID = userID {
            Session.shared.token = token
            Session.shared.userId = Int(userID)!
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                       let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! ViewController
                       loginViewController.modalPresentationStyle = .fullScreen
                       self.present(loginViewController, animated: true, completion: nil)
                       print("---------------------------------------------------------")
                       print("Token = ",Session.shared.token)
                       print("UserID = ",Session.shared.userId)
                       print("---------------------------------------------------------")
        }
        
        decisionHandler(.cancel)
    }
}

