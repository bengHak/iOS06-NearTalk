//
//  BaseEntity.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/20.
//

import Foundation

public protocol BaseEntity: Codable {
    var uuid: String? { get set }
}
