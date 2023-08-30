//
//  WebViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/29.
//

import UIKit
import WebKit

final class WebViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView = WKWebView()

//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
//        view = webView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        webView.snp.makeConstraints {
            $0.edges.equalTo(view).inset(100)
        }


        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        // 네비게이션 컨트롤러가 처음에 투명, 스크롤 하면 불투명
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red

        //네비게이션 뷰(루트뷰)의 세이프에어리어가 바뀜
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance

        title = "웹뷰데스"
    }

    func reloadButtonClicked() {
        webView.reload()
    }

    func goBackButtonClicked() {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    func goForwardButtonClicked() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}
