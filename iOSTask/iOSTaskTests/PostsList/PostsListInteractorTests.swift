//
//  PostsListInteractorTests.swift
//  iOSTask
//
//  Created by Adel Aref on 15/11/2024.
//

import XCTest

@testable import iOSTask

class PostsListInteractorTests: XCTestCase {
    var interactor: PostsListInteractor!
    var mockAPIClient: MockAPIClient!
    var mockUserDefaults: MockUserDefaults!
    var mockPresenter: MockPostsListPresenter!
    var mockView: MockView!

    override func setUp() {
        super.setUp()

        // Initialize mocks
        mockAPIClient = MockAPIClient()
        mockUserDefaults = MockUserDefaults()
        mockPresenter = MockPostsListPresenter()
        mockView = MockView()

        // Set up presenter and interactor
        mockPresenter.view = mockView
        interactor = PostsListInteractor(apiClient: mockAPIClient, defaults: mockUserDefaults)
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockAPIClient = nil
        mockUserDefaults = nil
        mockPresenter = nil
        mockView = nil

        super.tearDown()
    }

    func testGetPosts_UsesCachedDataWhenAvailable() {
        // Arrange
        let cachedPosts = [Post(userId: 1, id: 1, title: "Sample Title", body: "Sample Body")]
        mockUserDefaults.dataStore["posts_cache"] = try? JSONEncoder().encode(cachedPosts)

        // Act
        interactor.getPosts(page: 1, pageSize: 10)

        // Assert
        XCTAssertEqual(mockView.shownPosts, cachedPosts, "Should display cached posts")
    }


    func testGetPosts_MakesAPICallWhenNoCache() {
        // Arrange
        let apiPosts = [Post(userId: 1, id: 2, title: "API Post", body: "Sample Body")]
        mockAPIClient.result = .success(apiPosts)
        let expectation = self.expectation(description: "API call completes")

        mockView.shownPosts = [] // Reset mockView state

        // Act
        interactor.getPosts(page: 1, pageSize: 10)

        DispatchQueue.main.async {
            expectation.fulfill() // Fulfill when async code is done
        }

        // Assert
        waitForExpectations(timeout: 1) // Wait for the async code
        XCTAssertEqual(mockView.shownPosts, apiPosts, "Should display posts from API")
    }



    func testGetPosts_HandlesAPIError() {
        // Arrange
        mockAPIClient.result = .failure(NSError(domain: "API Error", code: 500, userInfo: nil))
        let expectation = self.expectation(description: "API call completes")
        mockPresenter.view = mockView
        interactor.presenter = mockPresenter

        // Act
        interactor.getPosts(page: 1, pageSize: 10)

        DispatchQueue.main.async {
            expectation.fulfill() // Fulfill after async code executes
        }

        // Assert
        waitForExpectations(timeout: 1) // Wait for async code
        XCTAssertEqual(mockView.shownError, "The operation couldn’t be completed. (API Error error 500.)", "Should display API error message")
    }

    func testGetPosts_StopsFetchingWhenLastPage() {
        // Arrange
        interactor.isLastPage = true

        // Act
        interactor.getPosts(page: 1, pageSize: 10)

        // Assert
        XCTAssertEqual(mockView.shownPosts, [], "Should not fetch any posts when it's the last page")
    }
}
