//
//  MockPostDetailsPresenter.swift
//  iOSTask
//
//  Created by Adel Aref on 15/11/2024.
//
@testable import iOSTask

class MockPostDetailsPresenter: PostDetailsPresenter {
    private var _post: Post?
    private var _view: PostDetailsViewProtocol?
    
    override var post: Post? {
        get { return _post }
        set { _post = newValue }
    }
    
    override var view: PostDetailsViewProtocol? {
        get { return _view }
        set { _view = newValue }
    }
    
    override func viewDidLoad() {
        // No-op for this mock
    }
}
