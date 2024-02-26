//
//  BaseViewController.swift
//  SmartPush
//
//  Created by A_Mcflurry on 2/14/24.
//

import UIKit

class BaseViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		configureHierarchy()
		configureLayout()
		configureView()
	}

	func configureHierarchy() { }
	func configureLayout() { }
	func configureView() { }

}
