//
//  CreateGroupChatUseCase.swift
//  NearTalk
//
//  Created by dong eun shin on 2022/11/17.
//

import Foundation

public protocol CreateGroupChatUseCaseable {
    func validate(_ string: String)
    func createGroupChat(title: String, description: String, maxNumOfParticipants: Int, maxRangeOfRadius: Int)
}

public final class CreateGroupChatUseCase {
    // MARK: - Proporties
    
//    private let firestoreRepository: FirestoreRepository
    
    // TODO: - repository 주입
    public init() {
        print(#function)
    }
}

extension CreateGroupChatUseCase: CreateGroupChatUseCaseable {
    public func validate(_ string: String) {
        print(#function)
    }
    
    public func createGroupChat(title: String, description: String, maxNumOfParticipants: Int, maxRangeOfRadius: Int) {
        print(#function)
    }
}
