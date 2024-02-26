//
//  ArtistViewController.swift
//  MVVMPractice
//
//  Created by A_Mcflurry on 2/26/24.
//

import UIKit
import Kingfisher

class ArtistViewController: BaseViewController {

	let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setCollectionViewLayout())
	let viewModel = ArtistViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()
		setCollectionView()

		viewModel.artistInfo.bind { _ in
			self.collectionView.reloadData()
		}
	}

	override func configureHierarchy() {
		view.addSubview(collectionView)
	}

	override func configureLayout() {
		collectionView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}

	static func setCollectionViewLayout() -> UICollectionViewLayout {
		let layout = UICollectionViewFlowLayout()
		let padding: CGFloat = 10
		layout.itemSize = CGSize(width: (UIScreen.main.bounds.width-padding*3)/2, height: (UIScreen.main.bounds.width-padding*2)/2)
		layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
		layout.minimumLineSpacing = padding
		layout.minimumInteritemSpacing = padding
		return layout
	}
}

extension ArtistViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfRowsSections
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCollectionViewCell.description(), for: indexPath) as! ArtistCollectionViewCell
		cell.artistImage.kf.setImage(with: viewModel[viewModel.artistInfo.value[indexPath.item].url])
		cell.artistName.text = viewModel.artistInfo.value[indexPath.item].name
		return cell
	}
	
	func setCollectionView() {
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(ArtistCollectionViewCell.self, forCellWithReuseIdentifier: ArtistCollectionViewCell.description())
	}
}
