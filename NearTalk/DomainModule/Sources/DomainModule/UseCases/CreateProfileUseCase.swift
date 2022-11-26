//
//  CreateProfileUseCase.swift
//  NearTalk
//
//  Created by Preston Kim on 2022/11/21.
//

import Foundation
import RxSwift

public protocol CreateProfileUseCase {
    func execute(profile: UserProfile) -> Completable
}

public final class DefaultCreateProfileUseCase: CreateProfileUseCase {
    private let profileRepository: any ProfileRepository
    private let authRepository: any AuthRepository

    public init(profileRepository: ProfileRepository, authRepository: any AuthRepository) {
        self.profileRepository = profileRepository
        self.authRepository = authRepository
    }
    
    public func execute(profile: UserProfile) -> Completable {
        return self.profileRepository.createMyProfile(profile)
            .asCompletable()
    }
}
