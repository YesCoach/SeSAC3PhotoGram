//
//  ContentViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {

    let textView = {
        let view = UITextView()
        view.backgroundColor = .lightGray
        return view
    }()


    // Closure - 1
    var completionHandler: ((String) -> Void)?

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // Closure - 2
        completionHandler?(textView.text!)
    }

    override func configureView() {
        super.configureView()

        view.addSubview(textView)
    }

    override func configureLayout() {
        super.configureLayout()

        textView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(250)
        }
    }
}
