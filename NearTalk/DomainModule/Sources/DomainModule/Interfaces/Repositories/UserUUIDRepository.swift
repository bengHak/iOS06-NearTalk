//
//  UserUUIDRepository.swift
//  NearTalk
//
//  Created by Preston Kim on 2022/11/17.
//

import Foundation

public protocol UserUUIDRepository {
    func fetch() -> String
}
