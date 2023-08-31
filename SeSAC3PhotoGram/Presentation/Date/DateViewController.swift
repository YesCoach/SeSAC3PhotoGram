//
//  DateViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/29.
//

import Foundation

class DateViewController: BaseViewController {

    let mainView = DateView()

    // Protocol 값 전달 2.
    weak var delegate: PassDataDelegate?

    override func loadView() {
        self.view = mainView
    }

    override func viewDidDisappear(_ animated: Bool) {
        // Protocol 값 전달 3.
        delegate?.receiveDate(date: mainView.picker.date)
        
        super.viewDidDisappear(animated)
    }

    deinit {
        print("deinit", self)
    }
}
