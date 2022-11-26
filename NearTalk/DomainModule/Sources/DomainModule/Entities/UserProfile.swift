//
//  UserProfile.swift
//  NearTalk
//
//  Created by Preston Kim on 2022/11/16.
//

import Foundation

public struct UserProfile: BaseEntity {
    /// 유저 UUID
    public var uuid: String?
    public var username: String?
    public var email: String?
    public var statusMessage: String?
    public var profileImagePath: String?

    /// 친구 UUID 목록
    public var friends: [String]?
    
    /// 입장한 채팅방 UUID 목록
    public var chatRooms: [String]?
    
    public init(uuid: String? = nil, username: String? = nil, email: String? = nil, statusMessage: String? = nil, profileImagePath: String? = nil, friends: [String]? = nil, chatRooms: [String]? = nil) {
        self.uuid = uuid
        self.username = username
        self.email = email
        self.statusMessage = statusMessage
        self.profileImagePath = profileImagePath
        self.friends = friends
        self.chatRooms = chatRooms
    }
}
