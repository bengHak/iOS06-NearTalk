//
//  ChatMessage.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/16.
//

import Foundation

public struct ChatMessage: BaseEntity {
    public var uuid: String?
    public var chatRoomID: String?
    public var senderID: String?
    public var text: String?
    public var messageType: String?
    public var mediaPath: String?
    public var mediaType: String?
    public var createdDate: Date?
}

public enum MessageType: String {
    case text
    case media
}

public enum MediaType: String {
    case photo
    case video
}
