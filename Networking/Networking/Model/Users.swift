//
//  Users.swift
//  Networking
//
//  Created by Nazrin on 29.11.23.
//

import Foundation

typealias UserItems = [Users]

struct Users: Codable {
    let name: String?
    let email: String?
    let id: Int?
    let username: String?
    let phone: String?
    let website: String?
    let address: Address?
    let company: Company?
}

struct Address: Codable{
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}

struct Geo: Codable {
    let lat: String?
    let lng: String?
}

struct Company: Codable {
    let name: String?
    let catchPhrase: String?
    let bs: String?
}
