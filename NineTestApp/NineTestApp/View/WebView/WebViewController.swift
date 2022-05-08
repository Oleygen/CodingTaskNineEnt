//
//  WebViewController.swift
//  NineTestApp
//
//  Created by oleygen-private on 07.05.2022.
//

import UIKit
import Foundation
import WebKit
class WebViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    let viewModel = WebViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressView.accessibilityIdentifier = "ProgressView"
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        self.viewModel.item?.bind(listener: { [weak self] urlString in
            if let urlString = urlString, let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                self?.webView.load(request)
            }
        })
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "isLoading" {
            print(#line)
            print(webView.isLoading)
            progressView.isHidden = !webView.isLoading
        }
       if keyPath == "estimatedProgress" {
           print(#line)
           print(webView.estimatedProgress)
           progressView.progress = Float(webView.estimatedProgress)
       }
        
   }
}
