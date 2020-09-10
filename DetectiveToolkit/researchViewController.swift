//
//  SecondViewController.swift
//  DetectiveToolkit
//
//  Created by Jonathan Tipton on 9/9/20.
//  Copyright © 2020 Jonathan Tipton. All rights reserved.
//

import UIKit
import WebKit

class researchViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButon: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var addressField: UITextField!
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        let urlString:String = "https://www.google.com"
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url:url)
        webView.load(urlRequest)
        addressField.text = urlString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressField.delegate = self
        webView.navigationDelegate = self
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString:String = addressField.text!
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url:url)
        webView.load(urlRequest)
        addressField.resignFirstResponder() //hides keyboard
        
        return true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.canGoBack {
            backButton.isEnabled = true
        }
        if webView.canGoForward {
            nextButon.isEnabled = true
        }
        addressField.text = webView.url?.absoluteString
    }
}

