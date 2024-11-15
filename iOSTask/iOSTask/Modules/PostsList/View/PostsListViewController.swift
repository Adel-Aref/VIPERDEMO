//
//  PostsListViewController.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//
import UIKit

class PostsListViewController: UIViewController, PostsListViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: PostsListPresenter?
    
    private var currentPage = 1
    private let pageSize = 30
    private var refreshControl: UIRefreshControl!
    private var refreshControlStatus: Bool {
        return refreshControl.isRefreshing
    }
    
    var posts: [Post] = [] {
        didSet {
            dataSrc.posts = posts
            tableView.reloadData()
        }
    }
    
    private var isLoading = false
    
    lazy var dataSrc: PostsTableDataProvider = {
        let dataSrc = PostsTableDataProvider(posts: posts, isLoading: isLoading)
        dataSrc.onPostSelect = { [weak self] post in
            guard let self = self else { return }
            let postDetailVC = PostDetailsRouter.createModule(post: post)
            navigationController?.pushViewController(postDetailVC, animated: true)
        }
        
        dataSrc.onPaginateMore = { [weak self] in
            guard let self = self else { return }
            self.loadMorePosts()
        }
        return dataSrc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        showProgressIndicator(view: self.view)
        view.backgroundColor = .white
        setupTableView()
        setupRefreshControl()
        presenter?.fetchPosts(page: currentPage, pageSize: pageSize)
    }
    
    private func setupTableView() {
        tableView.register(cell: PostTableViewCell.self)
        tableView.delegate = dataSrc
        tableView.dataSource = dataSrc
        tableView.separatorColor = .clear
        tableView.rowHeight = postRowHeight
    }
    
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        guard !isLoading else { return }
        isLoading = true
        currentPage = 1
        presenter?.fetchPosts(page: currentPage, pageSize: pageSize)
    }
    
    func loadMorePosts() {
        guard !isLoading else { return }
        isLoading = true
        presenter?.fetchPosts(page: currentPage, pageSize: pageSize)
    }
    
    func showPosts(_ posts: [Post]) {
        hideProgressIndicator(view: self.view)
        refreshControl.endRefreshing()
        isLoading = false
        
        if currentPage == 1 {
            self.posts = posts
        } else {
            self.posts.append(contentsOf: posts)
        }
        
        if !posts.isEmpty {
            currentPage += 1
        }
    }
    
    func showError(_ message: String) {
        isLoading = false
        hideProgressIndicator(view: self.view)
        refreshControl.endRefreshing()
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
