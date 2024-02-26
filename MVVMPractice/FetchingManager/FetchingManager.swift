//
//  ArtistFetchingManager.swift
//  MVVMPractice
//
//  Created by A_Mcflurry on 2/26/24.
//

import Foundation
import Alamofire

//enum FetchingManager {
//	case artist(method: FetchingCase)
//
//	enum FetchingCase {
//		case get
//	}
//
//
//	func callRequest<T: Decodable>(type: T) {
//		
//	}
//
//}

class FetchingManager {
	enum FetchingError: Error {
		case serverError
		case badAccessError
	}

	func callRequest<T: Decodable>(withType type: T.Type, _ kind: FetchingKind, _ completionHandler: @escaping (T?, FetchingError?)->Void) {
		AF.request(kind.getUrl).responseDecodable(of: T.self) { response in
			switch response.result {
			case .success(let success):
				completionHandler(success, nil)
			case .failure(_):
				completionHandler(nil, .badAccessError)
			}
		}
	}


}

enum FetchingKind {
	case artist

	var getUrl: URL {
		switch self {
		case .artist:
			return URL(string: "http://150.230.250.119:3000/seta/api/getArtists")!
		}
	}

	var header: HTTPHeaders {
		switch self {
		case .artist:
			return [:]
		}
	}

	var get: HTTPMethod {
		switch self {
		case .artist:
			return .get
		}
	}

	var parameter: Parameters {
		switch self {
		case .artist:
			return [:]
		}
	}
}
