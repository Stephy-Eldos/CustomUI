//
//  ProfileViewController.swift
//  CustomUI
//
//  Created by Eldos Thomas on 5/5/22.
//

import UIKit
import WebKit

class InsightsViewController: BaseViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        loadHtml()
    }
    
    func loadHtml() {
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
        webView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {

        let alertController = UIAlertController(title: message,
                                                message: nil,
                                                preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .cancel) {
            _ in completionHandler()}
        )
        self.present(alertController, animated: true, completion: nil)
    }
}

extension InsightsViewController: NibableViewController {
    static func instantateFromNib() -> BaseViewController {
        let storyboard = UIStoryboard(name: "Insights", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "InsightsViewController") as! InsightsViewController
        return viewController
    }
}
