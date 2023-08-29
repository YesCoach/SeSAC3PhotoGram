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

    override func viewDidLoad() {
        super.viewDidLoad()

        // addObserver보다 post가 먼저 신호를 보내면 Observer는 신호를 받지 못한다.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didRecommandKeywordNotificationArrived),
            name: NSNotification.Name("RecommandKeyword"),
            object: nil
        )
    }

    @objc func didRecommandKeywordNotificationArrived(_ sender: NSNotification) {
        print(#function)
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

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {

        // Presenting 하기 전에 미리 옵저버 등록해야, 나중에 값전달을 받아올때 정상적으로 받을 수 있다.

        NotificationCenter.default.post(
            name: NSNotification.Name("SelectedImage"),
            object: nil,
            userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"]
        )

        navigationController?.popViewController(animated: true)
    }
}
