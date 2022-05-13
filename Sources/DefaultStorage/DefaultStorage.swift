//
//  DefaultStorage.swift
//
//  Created by Oliver Michalak on 26.05.20.
//  Copyright © 2020 Oliver Michalak. All rights reserved.
//

import Foundation

@propertyWrapper
public struct DefaultStorage<T: Codable> {
	
	private let key: String
	private let defaultValue: T
	private let store: UserDefaults

	public init(key: String, defaultValue: T, storageName: String? = nil) {
		self.key = key
		self.defaultValue = defaultValue
		
		if let name = storageName, let store = UserDefaults(suiteName: name) {
			self.store = store
		}
		else {
			self.store = UserDefaults.standard
		}
	}

	public var wrappedValue: T {
		get {
			guard let data = store.object(forKey: key) as? Data else {
				return defaultValue
			}
			
			let value = try? JSONDecoder().decode(T.self, from: data)
			return value ?? defaultValue
		}
		set {
			let data = try? JSONEncoder().encode(newValue)
			
			store.set(data, forKey: key)
		}
	}
}
