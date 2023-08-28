//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit

class AddViewController: BaseViewController {

    let mainView = AddView()

    override func loadView() { // viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didSelectedImageNotificationArrived),
            name: NSNotification.Name("SelectedImage"),
            object: nil
        )
    }

    @objc func didSelectedImageNotificationArrived(_ sender: NSNotification) {
        if let name = sender.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
    }

    @objc func didSearchButtonClicked(_ sender: UIButton) {

        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]

        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()!])

        present(SearchViewController(), animated: true)
    }

    override func configureView() {
        super.configureView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(didSearchButtonClicked), for: .touchUpInside)
    }

    override func configureLayout() {
        super.configureLayout()
        print("Add SetConstraints")
    }
}
