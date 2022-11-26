//
//  VerifyUserUseCase.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/21.
//

import Foundation
import RxSwift

public protocol VerifyUserUseCase {
    func verifyUser() -> Completable
    func verifyProfile() -> Completable
}

public final class DefaultVerifyUserUseCase: VerifyUserUseCase {
    private let authRepository: AuthRepository
    private let profileRepository: ProfileRepository
    
    public init(authRepository: AuthRepository, profileRepository: ProfileRepository) {
        self.authRepository = authRepository
        self.profileRepository = profileRepository
    }
    
    public func verifyUser() -> Completable {
        self.authRepository.verify()
    }
    
    public func verifyProfile() -> Completable {
        self.profileRepository.fetchMyProfile().asCompletable()
    }
}
