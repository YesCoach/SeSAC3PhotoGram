//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit

class AddViewController: BaseViewController {

    let mainView = AddView()

    override func loadView() { // viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func didSearchButtonClicked(_ sender: UIButton) {
        present(SearchViewController(), animated: true)
    }

    override func configureView() {
        super.configureView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(didSearchButtonClicked), for: .touchUpInside)
    }

    override func configureLayout() {
        super.configureLayout()
        print("Add SetConstraints")
    }
}
