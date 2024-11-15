//
//  PostDetailsRouterTests.swift
//  iOSTask
//
//  Created by Adel Aref on 15/11/2024.
//

import XCTest

@testable import iOSTask 

class PostDetailsRouterTests: XCTestCase {
    var mockPost: Post!
    var viewController: UIViewController!

    override func setUp() {
        super.setUp()
        mockPost = Post(userId: 1, id: 1, title: "Test Title", body: "Test Body")
        viewController = PostDetailsRouter.createModule(post: mockPost)
    }

    override func tearDown() {
        mockPost = nil
        viewController = nil
        super.tearDown()
    }

    func testCreateModule_InitializesCorrectly() {
        // Assert the view controller is of the correct type
        XCTAssertTrue(viewController is PostDetailsViewController, "The created module should return a PostDetailsViewController")
    }

    func testCreateModule_WiresPresenterToView() {
        // Get access to the view controller and check wiring
        let postDetailsView = viewController as! PostDetailsViewController
        XCTAssertNotNil(postDetailsView.presenter, "Presenter should be assigned to the view")
        XCTAssertTrue(postDetailsView.presenter is PostDetailsPresenter, "Presenter should be of type PostDetailsPresenter")
    }

    func testCreateModule_WiresViewToPresenter() {
        // Check if the presenter has the correct view assigned
        let postDetailsView = viewController as! PostDetailsViewController
        let presenter = postDetailsView.presenter as! PostDetailsPresenter
        XCTAssertTrue(presenter.view is PostDetailsViewController, "Presenter's view should be of type PostDetailsViewController")
    }

    func testCreateModule_AssignsPostToPresenter() {
        // Verify that the post is passed correctly to the presenter
        let postDetailsView = viewController as! PostDetailsViewController
        let presenter = postDetailsView.presenter as! PostDetailsPresenter
        XCTAssertEqual(presenter.post, mockPost, "The post should be assigned to the presenter")
    }
}
