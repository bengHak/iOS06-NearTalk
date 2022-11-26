//
//  LogoutUseCase.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/21.
//

import Foundation
import RxSwift

public protocol LogoutUseCase {
    init(authRepository: any AuthRepository)
    func logout() -> Completable
}

public final class DefaultLogoutUseCase: LogoutUseCase {
    private let authRepository: any AuthRepository
    
    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func logout() -> Completable {
        self.authRepository.logout()
    }
}
