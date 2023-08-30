//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit
import SeSACPhotoFramework
import Kingfisher

// Protocol 값 전달 1.
protocol PassDataDelegate {
    func receiveDate(date: Date)
}

class AddViewController: BaseViewController {

    let mainView = AddView()

    override func loadView() { // viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        ClassOpenExample.publicExample()
        ClassPublicExample.publicExample()
         */

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didSelectedImageNotificationArrived),
            name: .selectedImage,
            object: nil
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 옵저버 등록을 viewWillAppear에서 하면, 화면 전환 방식에 따라 매번 등록될 수 있음
        // 중복 노티 방지를 꼭 체크해야한다
        /*
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didSelectedImageNotificationArrived),
            name: NSNotification.Name("SelectedImage"),
            object: nil
        )
         */

        /*
        sesacShowActivityViewController(image: .init(systemName: "star")!, url: "hello", text: "hi")
         */
    }

    /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name("SelectedImage"),
            object: nil
        )
    }
     */

    @objc func didSelectedImageNotificationArrived(_ sender: NSNotification) {

        print(#function)

        if let name = sender.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
    }

    @objc func didSearchButtonClicked(_ sender: UIButton) {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actionGallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default)
        let actionWeb = UIAlertAction(title: "웹에서 검색하기", style: .default) { [weak self] _ in
            guard let self else { return }
            let viewController = SearchViewController()
            viewController.delegate = self
            navigationController?.pushViewController(viewController, animated: true)
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel)

        [actionGallery, actionWeb, actionCancel].forEach { alert.addAction($0) }

        present(alert, animated: true)

//        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
//
//        // 값전달을 하려는 뷰 컨트롤러에서 아직 addObserver를 하지 않은 상태에서 post
//        // 이 경우 보낸 Notification은 받을 수 없다
//        NotificationCenter.default.post(
//            name: .recommandKeyword,
//            object: nil,
//            userInfo: ["word": word.randomElement()!]
//        )
    }

    @objc func didSearchProtocolButtonClicked(_ sender: UIButton) {
        let viewController = SearchViewController()
        viewController.delegate = self
        present(viewController, animated: true)
    }

    @objc func didDateButtonClicked(_ sender: UIButton) {
        // Protocol 값 전달 5.
        let viewController = DateViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func didTitleButtonClicked(_ sender: UIButton) {
        let viewController = TitleViewController()

        // Closure - 3

        viewController.completionHandler = { [weak self] (text, num, bool) in
            guard let self else { return }
            mainView.titleButton.setTitle(text, for: .normal)
            print("completionHandler", num, bool)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func didContentButtonClicked(_ sender: UIButton) {
        let viewController = ContentViewController()

        // Closure - 3

        viewController.completionHandler = { [weak self] text in
            guard let self else { return }
            mainView.contentButton.setTitle(text, for: .normal)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func configureView() {
        super.configureView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(
            self,
            action: #selector(didSearchButtonClicked),
            for: .touchUpInside
        )
        mainView.searchProtocolButton.addTarget(
            self,
            action: #selector(didSearchProtocolButtonClicked),
            for: .touchUpInside
        )
        mainView.dateButton.addTarget(
            self,
            action: #selector(didDateButtonClicked),
            for: .touchUpInside
        )
        mainView.titleButton.addTarget(
            self,
            action: #selector(didTitleButtonClicked),
            for: .touchUpInside
        )
        mainView.contentButton.addTarget(
            self,
            action: #selector(didContentButtonClicked),
            for: .touchUpInside
        )
    }

    override func configureLayout() {
        super.configureLayout()
        print("Add SetConstraints")
    }
}

// Protocol 값 전달 4.
extension AddViewController: PassDataDelegate {

    func receiveDate(date: Date) {
        mainView.dateButton.setTitle(DateFormatter.convertData(date: date), for: .normal)
    }

}

// MARK: - SearchViewControllerDelegate 구현

extension AddViewController: SearchViewControllerDelegate {

    func passData(_ imageURL: String) {
        mainView.photoImageView.kf.setImage(with: URL(string: imageURL))
    }

}
