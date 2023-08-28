//
//  BaseViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureLayout()
    }

    func configureView() {
        view.backgroundColor = .systemBackground
        print("Base configureView")
    }

    func configureLayout() {
        print("Base configureLayout")
    }

}
