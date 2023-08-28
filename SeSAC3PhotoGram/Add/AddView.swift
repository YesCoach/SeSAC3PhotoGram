//
//  AddView.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit

class AddView: BaseView {

    let photoImageView = {
        let view = UIImageView()

        view.contentMode = .scaleAspectFill
        return view
    }()

    let searchButton = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        return view
    }()

    override func configureView() {
        super.configureView()
        [
            photoImageView, searchButton
        ].forEach { addSubview($0) }
    }

    override func configureLayout() {
        super.configureLayout()
        photoImageView.snp.makeConstraints {
            $0.topMargin.leadingMargin.trailingMargin.equalTo(self.safeAreaLayoutGuide).inset(10)
            $0.height.equalToSuperview().multipliedBy(0.3)
        }

        searchButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.bottom.trailing.equalTo(photoImageView)
        }
    }
}
