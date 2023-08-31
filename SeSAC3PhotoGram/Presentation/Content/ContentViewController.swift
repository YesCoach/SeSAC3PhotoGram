//
//  ContentViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 박태현 on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {

    let textView = {
        let view = UITextView()
        view.backgroundColor = .lightGray
        return view
    }()

    let sampleView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    let greenView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    // Closure - 1
    var completionHandler: ((String) -> Void)?

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // Closure - 2
        completionHandler?(textView.text!)
    }

    deinit {
        print("deinit", self)
    }

    func setAnimation() {
        // 시작
        sampleView.alpha = 0
        greenView.alpha = 0

        // 끝
        UIView.animate(
            withDuration: 1,
            delay: 2,
            options: .curveLinear
        ) {
            self.sampleView.alpha = 1
            self.sampleView.backgroundColor = .blue
        } completion: { bool in

            UIView.animate(withDuration: 1) {
                self.greenView.alpha = 1
            }
        }

    }

    override func configureView() {
        super.configureView()

        view.addSubview(textView)
        view.addSubview(sampleView)
        view.addSubview(greenView)
        setAnimation()
    }

    override func configureLayout() {
        super.configureLayout()

        textView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(250)
        }
        sampleView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.center.equalTo(view)
        }
        greenView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.center.equalTo(view).offset(80)
        }
    }

    // 사용자의 제스처가 들어오면 호출, UIControl 아니여도 됨
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 1.0

            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 0.5
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 0.5

            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 1.0
            }
        }
    }

}
