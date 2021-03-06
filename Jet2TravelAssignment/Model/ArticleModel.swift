//
//  ArticleModel.swift
//  Jet2TravelAssignment
//
//  Created by bpn on 29/04/20.
//  Copyright © 2020 Jet2Travel. All rights reserved.
//

import Foundation


struct ArticleModel : Codable {
	let id : String?
	let createdAt : String?
	let content : String?
	let comments : Int?
	let likes : Int?
	let media : [MediaModel]?
	let user : [UserModel]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case createdAt = "createdAt"
		case content = "content"
		case comments = "comments"
		case likes = "likes"
		case media = "media"
		case user = "user"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		content = try values.decodeIfPresent(String.self, forKey: .content)
		comments = try values.decodeIfPresent(Int.self, forKey: .comments)
		likes = try values.decodeIfPresent(Int.self, forKey: .likes)
		media = try values.decodeIfPresent([MediaModel].self, forKey: .media)
		user = try values.decodeIfPresent([UserModel].self, forKey: .user)
	}

}
