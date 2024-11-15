//
//  PostsListRouter.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//
import UIKit

class PostsListRouter {
    static func createModule() -> UIViewController {
        let view = PostsListViewController()
        let presenter = PostsListPresenter()
        let apiClient = APIClient()
        let interactor = PostsListInteractor(apiClient: apiClient)
        let router = PostsListRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}
