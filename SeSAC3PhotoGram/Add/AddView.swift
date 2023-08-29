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

    let searchProtocolButton = {
        let view = UIButton()
        view.backgroundColor = .brown
        return view
    }()

    let dateButton = {
        let view = UIButton()
        view.backgroundColor = .systemMint
        view.setTitle("23년 8월 29일", for: .normal)
        return view
    }()

    override func configureView() {
        super.configureView()
        [
            photoImageView, searchButton, searchProtocolButton, dateButton
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

        searchProtocolButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.bottom.leading.equalTo(photoImageView)
        }

        dateButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(photoImageView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(photoImageView)
        }
    }
}
