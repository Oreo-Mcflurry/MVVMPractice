//
//  ArtistModel.swift
//  MVVMPractice
//
//  Created by A_Mcflurry on 2/26/24.
//

import Foundation

struct ArtistModel: Decodable {
	var name: String
	var mbid: String
	var alias: String
	var url: String?
	var gid: Int
	var country: String
	var tags: [String]?
}
