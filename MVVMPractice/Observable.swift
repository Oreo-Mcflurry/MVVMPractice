//
//  Observable.swift
//  MVVMPractice
//
//  Created by A_Mcflurry on 2/26/24.
//

import Foundation

class Observable<T> {
	var value: T {
		didSet {
			closure?(value)
		}
	}

	private var closure: ((T)->Void)?

	init(_ value: T) {
		self.value = value
	}

	func bind(_ clousure: @escaping (T)->Void) {
		clousure(value)
		self.closure = clousure
	}
}

