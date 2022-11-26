//
//  UserChatRoomTicket.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/23.
//

import Foundation

public struct UserChatRoomTicket: BaseEntity {
    public var uuid: String?
    public var userID: String?
    public var roomID: String?
    public var lastReadMessageID: String?
    public var lastRoomMessageCount: Int?
}
