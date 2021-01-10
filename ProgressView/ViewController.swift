//
//  ViewController.swift
//  ProgressView
//
//  Created by ZyadGalal on 10/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientProgressView: GradientHorizontalProgressView!
    @IBOutlet weak var circularProgressView: solidCircularProgressBar!
    @IBOutlet weak var progressView: SolidHorizontalProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
    }

    override func viewDidAppear(_ animated: Bool) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.progressView.progress = 0.7
            self.circularProgressView.progress = 0.7
            self.gradientProgressView.progress = 0.7

        }
    }

}

