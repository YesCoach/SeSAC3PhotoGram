//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit

class SearchViewController: BaseViewController {

    let searchView = SearchView()

    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]

    override func loadView() {
        self.view = searchView
    }

    override func configureView() {
        super.configureView()

        searchView.collectionView.dataSource = self
        searchView.collectionView.delegate = self
    }

    override func configureLayout() {
        super.configureLayout()
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return imageList.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SearchCollectionViewCell",
            for: indexPath
        ) as? SearchCollectionViewCell
        else { return UICollectionViewCell() }

        cell.imageView.image = UIImage(systemName: imageList[indexPath.item])

        return cell
    }
}
