//
//  ChatRoom.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/16.
//

import Foundation

public struct ChatRoom: BaseEntity {
    public var uuid: String?
    public var userList: [String]?
    public var roomImagePath: String?
    public var roomType: String?
    public var roomName: String?
    public var roomDescription: String?
    public var location: NCLocation?
    public var accessibleRadius: Double?
    public var recentMessageID: String?
    public var maxNumberOfParticipants: Int?
    public var messageCount: Int?
    
    public init(uuid: String? = nil, userList: [String]? = nil, roomImagePath: String? = nil, roomType: String? = nil, roomName: String? = nil, roomDescription: String? = nil, location: NCLocation? = nil, accessibleRadius: Double? = nil, recentMessageID: String? = nil, maxNumberOfParticipants: Int? = nil, messageCount: Int? = nil) {
        self.uuid = uuid
        self.userList = userList
        self.roomImagePath = roomImagePath
        self.roomType = roomType
        self.roomName = roomName
        self.roomDescription = roomDescription
        self.location = location
        self.accessibleRadius = accessibleRadius
        self.recentMessageID = recentMessageID
        self.maxNumberOfParticipants = maxNumberOfParticipants
        self.messageCount = messageCount
    }
}
