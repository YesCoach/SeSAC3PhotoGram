//
//  HomeView.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/31.
//

import UIKit

final class HomeView: BaseView {

    weak var delegate: HomeViewProtocol?

    lazy var collectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(
            SearchCollectionViewCell.self,
            forCellWithReuseIdentifier: "SearchCollectionViewCell"
        )
        view.dataSource = self
        view.delegate = self
        return view
    }()

    override func configureView() {
        super.configureView()
    }

    override func configureLayout() {
        super.configureLayout()
        [
            collectionView
        ].forEach { addSubview($0) }

        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    deinit {
        print(self, "deinit")
    }

}

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 100
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

//        cell.configure(with: imageList[indexPath.item])
        cell.imageView.backgroundColor = .systemBlue

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        delegate?.didSelectItemAt(indexPath: indexPath)
    }

}

private extension HomeView {

    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = .init(top: 0, left: 8, bottom: 0, right: 8)
        let size = UIScreen.main.bounds.width - 32 // self.frame.width
        layout.itemSize = CGSize(width: size / 3, height: size / 3)
        return layout
    }

}
