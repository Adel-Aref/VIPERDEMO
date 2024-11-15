//
//  PostsListPresenter.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//

protocol PostsListViewProtocol: AnyObject {
    func showPosts(_ posts: [Post])
    func showError(_ message: String)
}

class PostsListPresenter {
    weak var view: PostsListViewProtocol?
    var interactor: PostsListInteractor?
    var router: PostsListRouter?
    
    func fetchPosts(page: Int, pageSize: Int = 30) {
        interactor?.getPosts(page: page, pageSize: pageSize)
    }
}
