//
//  SearchCollectionViewCell.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit
import Kingfisher

class SearchCollectionViewCell: BaseCollectionViewCell {

    let imageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleToFill
        return view
    }()

    override func configureView() {
        super.configureView()
        contentView.addSubview(imageView)
    }

    override func configureLayout() {
        super.configureLayout()
        imageView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }

}

extension SearchCollectionViewCell {

    func configure(with imageURL: String) {
        let url = URL(string: imageURL)
        imageView.kf.setImage(with: url)
        imageView.kf.indicatorType = .activity
    }
}
