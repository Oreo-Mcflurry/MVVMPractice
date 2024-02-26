//
//  ArtistCollectionViewCell.swift
//  MVVMPractice
//
//  Created by A_Mcflurry on 2/26/24.
//

import UIKit
import SnapKit

class ArtistCollectionViewCell: BaseCollectionViewCell {
	let artistImage = UIImageView()
	let artistName = UILabel()
	
	override func configureHierarchy() {
		self.contentView.addSubview(artistName)
		self.contentView.addSubview(artistImage)
	}

	override func configureLayout() {
		artistImage.snp.makeConstraints {
			$0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
		}

		artistName.snp.makeConstraints {
			$0.top.equalTo(artistImage.snp.bottom).offset(10)
			$0.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
		}
	}

	override func configureView() {
		artistImage.contentMode = .scaleAspectFill

		artistName.font = .systemFont(ofSize: 17)
	}
}
