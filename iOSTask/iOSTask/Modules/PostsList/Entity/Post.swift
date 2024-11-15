//
//  Post.swift
//  iOSTask
//
//  Created by Adel Aref on 13/11/2024.
//
import Foundation

struct Post: Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
