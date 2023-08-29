//
//  DateView.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/29.
//

import UIKit

class DateView: BaseView {

    let picker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.preferredDatePickerStyle = .wheels
        return view
    }()

    override func configureView() {
        super.configureView()
    }

    override func configureLayout() {
        super.configureLayout()

        addSubview(picker)
        picker.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
