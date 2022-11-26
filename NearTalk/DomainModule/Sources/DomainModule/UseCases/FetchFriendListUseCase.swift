//
//  FetchFriendListUseCase.swift
//  NearTalk
//
//  Created by 김영욱 on 2022/11/21.
//

import Foundation
import RxSwift

public protocol FetchFriendListUseCase {
    func getFriendsData() -> Observable<[Friend]>
}

public final class DefaultFetchFriendListUseCase: FetchFriendListUseCase {

    private let disposeBag = DisposeBag()
    private let profileRepository: ProfileRepository!
    private let friendsDummyData: FriendsDummyData = FriendsDummyData()
    private let frends: Single<[UserProfile]>
    
    public init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
        self.frends = friendsDummyData.fetchFriendsData()
    }

    public func getFriendsData() -> Observable<[Friend]> {
        return self.frends
            .asObservable()
            .map {
                $0.map { Friend(userID: $0.uuid,
                               username: $0.username,
                               statusMessage: $0.statusMessage,
                               profileImagePath: $0.profileImagePath) }
            }
    }
}

public struct FriendsDummyData {
    var friends: [UserProfile] = []
    
    init() {
        friends.append(UserProfile(uuid: UUID().uuidString, username: "라이언", statusMessage: "가시밭길 위로 riding, you made me boost up", profileImagePath: ""))
        friends.append(UserProfile(uuid: UUID().uuidString, username: "어피치", statusMessage: "거짓으로 가득 찬 party 가렵지도 않아", profileImagePath: ""))
        friends.append(UserProfile(uuid: UUID().uuidString, username: "네오", statusMessage: "내 뒤에 말들이 많아, 나도 첨 듣는 내 rival", profileImagePath: ""))
        friends.append(UserProfile(uuid: UUID().uuidString, username: "튜브", statusMessage: "모두 기도해 내 falling 그 손 위로 I'ma jump in", profileImagePath: ""))
    }
    
    func fetchFriendsData() -> Single<[UserProfile]> {
        return Single<[UserProfile]>.create { single in
            guard !friends.isEmpty
            else {
                single(.failure(FriendsDummyError.nilUser))
                return Disposables.create()
            }
            single(.success(self.friends))
            return Disposables.create()
        }
    }
}

public enum FriendsDummyError: Error {
    case nilUser
}
