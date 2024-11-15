//
//  IntroViewController.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//

import UIKit

class IntroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupAnimation()
    }

    func setupAnimation() {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.contentMode = .scaleAspectFit
        logo.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        logo.center = view.center
        view.addSubview(logo)

        UIView.animate(withDuration: 2.0, animations: {
            logo.alpha = 0
        }, completion: { _ in
            self.navigateToPostsList()
        })
    }

    func navigateToPostsList() {
        let postsVC = PostsListRouter.createModule()
        let navigationController = UINavigationController(rootViewController: postsVC)
        UIApplication.shared.windows.first?.rootViewController = navigationController
    }
}
