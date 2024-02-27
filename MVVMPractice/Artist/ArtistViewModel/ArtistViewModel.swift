//
//  ArtistViewModel.swift
//  MVVMPractice
//
//  Created by A_Mcflurry on 2/26/24.
//

import Foundation

class ArtistViewModel {
	var artistInfo: Observable<[ArtistModel]> = Observable([])
//	var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
	var filteredArtist: [ArtistModel] = []
	var searchName: Observable<String?> = Observable("")
	subscript(_ str: String?) -> URL {
		return URL(string: str ?? "https://avatars.githubusercontent.com/u/96654328?v=4") ?? URL(string: "https://avatars.githubusercontent.com/u/96654328?v=4")!
	}

	init() {
		FetchingManager().callRequest(withType: [ArtistModel].self, .artist) { result, error in
			if let result {
				self.artistInfo.value = result
				print(self.artistInfo.value)
			}
		}
	}

	var numberOfRowsSections: Int {
		return filteredArtist.count
	}
}
