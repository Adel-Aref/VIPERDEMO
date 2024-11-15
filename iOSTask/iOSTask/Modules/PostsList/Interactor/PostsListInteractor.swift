//
//  PostsListInteractor.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//
import Foundation

class PostsListInteractor {
    var presenter: PostsListPresenter?
    let cacheKey = "posts_cache"
    let apiClient: APIClientContract
    let defaults: UserDefaultsContract
    var isLastPage = false

    init(apiClient: APIClientContract, defaults: UserDefaultsContract = UserDefaults.standard) {
        self.apiClient = apiClient
        self.defaults = defaults
    }

    func getPosts(page: Int, pageSize: Int) {
        // Fetch cached posts first
        guard !isLastPage else { return }
        if let cachedData = defaults.data(forKey: cacheKey),
           let cachedPosts = try? JSONDecoder().decode([Post].self, from: cachedData) {
            presenter?.view?.showPosts(cachedPosts)
        }
        
        // Fetch updated posts from API
        apiClient.sendRequest(endpoint: Router.fetchPostsList(page: page, pageSize: pageSize), responseModel: [Post].self) { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let posts):
                    if posts.isEmpty {
                        self?.isLastPage = true
                        self?.presenter?.view?.showPosts(posts)
                        break
                    }
                    self?.presenter?.view?.showPosts(posts)
                case .failure(let error):
                    self?.presenter?.view?.showError(error.localizedDescription)
                }
            }
        }
    }
}
