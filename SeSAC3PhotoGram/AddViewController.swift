//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit

class AddViewController: BaseViewController {

    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        return view
    }()

    let searchButton = {
        let view = UIButton()
        view.backgroundColor = .systemGreen
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureUI() {
        super.configureUI()
    }

    override func configureView() {
        super.configureView()
        print("Add ConfigureView")
        view.backgroundColor = .systemBackground
    }

    override func configureLayout() {
        super.configureLayout()
        print("Add SetConstraints")
        [
            photoImageView, searchButton
        ].forEach { view.addSubview($0) }

        photoImageView.snp.makeConstraints {
            $0.topMargin.leadingMargin.trailingMargin.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalToSuperview().multipliedBy(0.3)
        }

        searchButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.bottom.trailing.equalTo(photoImageView)
        }

    }
}
