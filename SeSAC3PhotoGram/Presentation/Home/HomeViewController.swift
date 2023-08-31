//
//  HomeViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/31.
//

import UIKit

// AnyObject: 클래스에서만 프로토콜을 정의할 수 있도록 제약

protocol HomeViewProtocol: AnyObject {
    func didSelectItemAt(indexPath: IndexPath)
}

final class HomeViewController: BaseViewController {

    private let mainView = HomeView()

    override func loadView() {

        mainView.delegate = self
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    deinit {
        print(self, #function)
    }

}

// MARK: - HomeViewProtocol 구현부

extension HomeViewController: HomeViewProtocol {

    func didSelectItemAt(indexPath: IndexPath) {
        print(indexPath)
        navigationController?.popViewController(animated: true)
    }

}
