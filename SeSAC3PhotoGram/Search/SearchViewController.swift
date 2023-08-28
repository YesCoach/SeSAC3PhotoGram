//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit

class SearchViewController: BaseViewController {

    let searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색어를 입력해주세요"
        return view
    }()

    override func configureView() {
        super.configureView()
    }

    override func configureLayout() {
        super.configureLayout()
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
    }
}
