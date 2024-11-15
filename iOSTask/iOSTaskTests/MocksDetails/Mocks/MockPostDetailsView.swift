//
//  MockPostDetailsView.swift
//  iOSTask
//
//  Created by Adel Aref on 15/11/2024.
//

@testable import iOSTask

class MockPostDetailsView: PostDetailsViewProtocol {
    var displayedPost: Post?

    func showPost(_ post: Post) {
        displayedPost = post
    }
}
