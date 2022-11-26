//
//  Friends.swift
//  NearTalk
//
//  Created by 김영욱 on 2022/11/21.
//

import Foundation

public struct Friend: Codable, Hashable {
    /// 유저 UUID
    public var userID: String?
    public var username: String?
    public var statusMessage: String?
    public var profileImagePath: String?
    
    public init(userID: String? = nil, username: String? = nil, statusMessage: String? = nil, profileImagePath: String? = nil) {
        self.userID = userID
        self.username = username
        self.statusMessage = statusMessage
        self.profileImagePath = profileImagePath
    }
}
