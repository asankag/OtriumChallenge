//
//  Models.swift
//  OtriumChallenge
//
//  Created by Asanka Gankewala on 3/28/21.
//

import Foundation

struct UserModel : Decodable {
    let name : String
    let login : String
    let email: String
    let avatarUrl: String?
    let followers: Followers?
    let following: Following?
    let pinnedItems: PinnedItems?
    let topRepositories : TopRepositories?
    let starredRepositories: StarredRepositories?
}

struct Followers: Decodable {
    let totalCount: Int?
}

struct Following: Decodable {
    let totalCount: Int?
}

struct StarredRepositories: Decodable {
    let nodes: [Repository]?
}

struct TopRepositories: Decodable {
    let nodes: [Repository]?
}

struct PinnedItems: Decodable {
    let edges: [Edges]
}

struct Edges: Decodable {
    let node: Repository
}

struct Repository: Decodable {
    let name : String?
    let description: String?
    let forkCount: Int
    let primaryLanguage: Language?
    let openGraphImageUrl: String?
}

struct Language: Decodable {
    let name : String
}
