//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit
import Kingfisher

protocol SearchViewControllerDelegate: AnyObject {
    func passData(_ imageURL: String)
}

class SearchViewController: BaseViewController {

    let searchView = SearchView()

    var imageList: [String] = []
    weak var delegate: SearchViewControllerDelegate?

    override func loadView() {
        self.view = searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // addObserver보다 post가 먼저 신호를 보내면 Observer는 신호를 받지 못한다.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didRecommandKeywordNotificationArrived),
            name: .recommandKeyword,
            object: nil
        )

        searchView.searchBar.becomeFirstResponder()
        searchView.searchBar.delegate = self
    }

    deinit {
        print("deinit", self)
        print(delegate)
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

        cell.configure(with: imageList[indexPath.item])

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {

        // Presenting 하기 전에 미리 옵저버 등록해야, 나중에 값전달을 받아올때 정상적으로 받을 수 있다.
        // Notification을 통한 값 전달
        /*
         NotificationCenter.default.post(
         name: .selectedImage,
         object: nil,
         userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"]
         )
         */

        // Protocol을 통한 값 전달

        delegate?.passData(imageList[indexPath.item])
        navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        NetworkManager.shared.callRequest(
            api: .searchPhotos(query: searchBar.text!)
        ) { [weak self] (result: Result<SearchPhotosResults, APIError>) in
            guard let self else { return }
            switch result {
            case .success(let data):
                imageList = data.results.map { $0.urls?.thumb }.compactMap { $0 }
                DispatchQueue.main.async { [self] in
                    self.searchView.collectionView.reloadData()
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }

}
