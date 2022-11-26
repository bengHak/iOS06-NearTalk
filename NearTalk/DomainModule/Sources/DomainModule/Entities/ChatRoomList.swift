//
//  ChatRoomList.swift
//  NearTalk
//
//  Created by 김영욱 on 2022/11/15.
//

import Foundation

public struct GroupChatRoomListData: Hashable {
    public var img: String?
    public var name: String?
    public var description: String?
    public var date: String?
    public var count: String?
    
    public init(data: ChatRoom) {
        self.name = data.roomName
        self.description = data.roomDescription
        
        if let list = data.userList, !list.isEmpty {
            self.count = String(list.count)
        }
        
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        self.date = dateFormatter.string(from: now)
    }
    
}

public struct DMChatRoomListData: Hashable {
    public var img: String?
    public var name: String?
    public var description: String?
    public var date: String?
    
    public init(data: ChatRoom) {
        self.name = data.roomName
        self.description = data.roomDescription
        
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        self.date = dateFormatter.string(from: now as Date)
    }
}
