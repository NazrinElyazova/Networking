//
//  Comment.swift
//  Networking
//
//  Created by Nazrin on 27.11.23.
//

import Foundation

typealias CommentItem = [Comment]

struct Comment: Codable {
    let name, email, body: String?
}
