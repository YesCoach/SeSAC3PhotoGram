//
//  TitleViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController {

    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요"
        return view
    }()

    let rightBarButtonItem = {
        let view = UIBarButtonItem(
            title: "확인",
            style: .plain,
            target: self,
            action: #selector(didConfirmButtonClicked)
        )
        return view
    }()

    @objc func didConfirmButtonClicked(_ sender: UIBarButtonItem) {
        completionHandler?(textField.text!, 31, false)
        navigationController?.popViewController(animated: true)
    }

    // Closure - 1
    var completionHandler: ((String, Int, Bool) -> Void)?

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // Closure - 2
        completionHandler?(textField.text!, 100, true)
    }

    deinit {
        print("deinit", self)
    }

    override func configureView() {
        super.configureView()

        view.addSubview(textField)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    override func configureLayout() {
        super.configureLayout()

        textField.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(50)
        }
    }
}
