//
//  WebViewViewController.swift
//  GoCoffee2
//
//  Created by Admin on 25/08/22.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        let url = URL(string: "https://thecoffee.jp/shortcut/brasil/fortaleza/the-coffee-aldeota/menu")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    
    //Função para dar dismiss (voltar para a tela anterior no caso de Modal)
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}
