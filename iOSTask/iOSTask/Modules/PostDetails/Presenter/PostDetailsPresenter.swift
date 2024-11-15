//
//  PostDetailsPresenter.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//
import Foundation

protocol PostDetailsViewProtocol: AnyObject {
    func showPost(_ post: Post)
}

class PostDetailsPresenter {
    weak var view: PostDetailsViewProtocol?
    var post: Post?

    func viewDidLoad() {
        if let post = post {
            view?.showPost(post)
        }
    }
}
