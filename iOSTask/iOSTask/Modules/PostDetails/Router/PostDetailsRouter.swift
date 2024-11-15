    //
//  PostDetailsRouter.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//
import UIKit

class PostDetailsRouter {
    static func createModule(post: Post) -> UIViewController {
        let view = PostDetailsViewController()
        let presenter = PostDetailsPresenter()

        view.presenter = presenter
        presenter.view = view
        presenter.post = post

        return view
    }
}
