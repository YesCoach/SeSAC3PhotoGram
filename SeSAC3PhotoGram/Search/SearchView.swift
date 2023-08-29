//
//  SearchView.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit

class SearchView: BaseView {

    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        return view
    }()

    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(
            SearchCollectionViewCell.self,
            forCellWithReuseIdentifier: "SearchCollectionViewCell"
        )
        return view
    }()

    override func configureView() {
        super.configureView()
    }

    override func configureLayout() {
        super.configureLayout()
        addSubview(searchBar)
        addSubview(collectionView)
        searchBar.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }

        collectionView.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.top.equalTo(searchBar.snp.bottom)
        }
    }
}

private extension SearchView {

    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let size = UIScreen.main.bounds.width - 40 // self.frame.width
        layout.itemSize = CGSize(width: size / 4, height: size / 4)
        return layout
    }

}
