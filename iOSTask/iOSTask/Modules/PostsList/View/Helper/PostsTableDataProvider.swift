//
//  PostsTableDataProvider.swift
//  iOSTask
//
//  Created by Adel Aref on 14/11/2024.
//

import UIKit

class PostsTableDataProvider: NSObject {
    var posts: [Post]
    private var isLoading: Bool
    var onPostSelect: ((Post) -> Void)?
    var onPaginateMore: (() -> Void)?
    
    init(posts: [Post], isLoading: Bool = false) {
        self.posts = posts
        self.isLoading = isLoading
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension PostsTableDataProvider: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let post = posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        onPostSelect?(post)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == posts.count - 1, !isLoading {
            onPaginateMore?()
        }
    }
}
