//
//  MessagingUseCase.swift
//  NearTalk
//
//  Created by dong eun shin on 2022/11/24.
//

import Foundation
import RxSwift

protocol MessagingUseCase {
    func sendMessage(message: ChatMessage, roomID: String, roomName: String, chatMemberIDList: [String]) -> Completable
    func observeMessage(roomID: String) -> Observable<ChatMessage>
}

final class DefalultMessagingUseCase: MessagingUseCase {
    // MARK: - Proporty
    
    private let chatMessageRepository: ChatMessageRepository
    
    // MARK: - LifeCycle
    
    init(chatMessageRepository: ChatMessageRepository) {
        self.chatMessageRepository = chatMessageRepository
    }
    
    func sendMessage(message: ChatMessage, roomID: String, roomName: String, chatMemberIDList: [String]) -> Completable {
        return self.chatMessageRepository.sendMessage(
            message: message,
            roomID: roomID,
            roomName: roomName,
            chatMemberIDList: chatMemberIDList
        )
    }
    
    func observeMessage(roomID: String) -> Observable<ChatMessage> {
        return self.chatMessageRepository.observeChatRoomMessages(roomID: roomID)
    }
}
