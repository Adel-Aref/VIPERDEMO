//
//  PostDetailsViewController.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//
import UIKit

class PostDetailsViewController: UIViewController, PostDetailsViewProtocol {
    var presenter: PostDetailsPresenter?

    private var isLiked: Bool = false // State to track like/dislike

    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return button
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupActions()
        presenter?.viewDidLoad()
    }

    func showPost(_ post: Post) {
        titleLabel.text = post.title
        descriptionLabel.text = post.body
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(likeButton)

        updateLikeButtonAppearance(for: likeButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            likeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            likeButton.widthAnchor.constraint(equalToConstant: 150),
            likeButton.heightAnchor.constraint(equalToConstant: 50),

            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: likeButton.topAnchor, constant: -24)
        ])
    }

    private func setupActions() {
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
    }

    private func updateLikeButtonAppearance(for button: UIButton) {
        if isLiked {
            button.setTitle("Liked", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
        } else {
            button.setTitle("Like", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.backgroundColor = .clear
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.systemBlue.cgColor
        }
    }

    @objc private func didTapLikeButton() {
        isLiked.toggle()
        animateLikeButton()
    }

    private func animateLikeButton() {
        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                self.likeButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3) {
                self.likeButton.transform = CGAffineTransform.identity
            }
        }, completion: { _ in
            self.updateLikeButtonAppearance(for: self.likeButton)
        })
    }
}
