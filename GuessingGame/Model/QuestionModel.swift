//
//  QuestionModel.swift
//  GuessingGame
//
//  Created by Harpreet on 01/09/20.
//  Copyright © 2020 Harpreet. All rights reserved.
//

import Foundation
struct QuestionModel : Codable {
	let product : String?
	let resultSize : Int?
	let version : Int?
	let items : [Items]?

	enum CodingKeys: String, CodingKey {

		case product = "product"
		case resultSize = "resultSize"
		case version = "version"
		case items = "items"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		product = try values.decodeIfPresent(String.self, forKey: .product)
		resultSize = try values.decodeIfPresent(Int.self, forKey: .resultSize)
		version = try values.decodeIfPresent(Int.self, forKey: .version)
		items = try values.decodeIfPresent([Items].self, forKey: .items)
	}

}

struct Items : Codable {
    let correctAnswerIndex : Int?
    let imageUrl : String?
    let standFirst : String?
    let storyUrl : String?
    let section : String?
    let headlines : [String]?

    enum CodingKeys: String, CodingKey {

        case correctAnswerIndex = "correctAnswerIndex"
        case imageUrl = "imageUrl"
        case standFirst = "standFirst"
        case storyUrl = "storyUrl"
        case section = "section"
        case headlines = "headlines"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        correctAnswerIndex = try values.decodeIfPresent(Int.self, forKey: .correctAnswerIndex)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        standFirst = try values.decodeIfPresent(String.self, forKey: .standFirst)
        storyUrl = try values.decodeIfPresent(String.self, forKey: .storyUrl)
        section = try values.decodeIfPresent(String.self, forKey: .section)
        headlines = try values.decodeIfPresent([String].self, forKey: .headlines)
    }

}
