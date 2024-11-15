//
//  MockPostsListPresenter.swift
//  iOSTask
//
//  Created by Adel Aref on 15/11/2024.
//

import Foundation
@testable import iOSTask

class MockPostsListPresenter: PostsListPresenter {
    private var _view: (any PostsListViewProtocol)?

    override var view: (any PostsListViewProtocol)? {
        get {
            return _view
        }
        set {
            _view = newValue
        }
    }
}

class MockView: PostsListViewProtocol {
    var shownPosts: [Post] = []
    var shownError: String?

    func showPosts(_ posts: [Post]) {
        shownPosts = posts
    }

    func showError(_ message: String) {
        shownError = message
    }
}
