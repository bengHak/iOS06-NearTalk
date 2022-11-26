//
//  UpdateProfileUseCase.swift
//  NearTalk
//
//  Created by Preston Kim on 2022/11/21.
//

import RxSwift

public protocol UpdateProfileUseCase {
    init(repository: any ProfileRepository)
    func execute(profile: UserProfile) -> Completable
}

public final class DefaultUpdateProfileUseCase: UpdateProfileUseCase {
    private let repository: any ProfileRepository

    public init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    public func execute(profile: UserProfile) -> Completable {
        return self.repository.updateMyProfile(profile).asCompletable()
    }
}
