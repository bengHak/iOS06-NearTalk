//
//  UserChatRoomModel.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/17.
//

import Foundation

public struct UserChatRoomModel: Codable {
    public var userID: String?
    public var chatRoomID: [String]?
    
    public init(userID: String? = nil, chatRoomID: [String]? = nil) {
        self.userID = userID
        self.chatRoomID = chatRoomID
    }
}
