//
//  LoginUseCase.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/20.
//

import Foundation
import RxSwift

public protocol LoginUseCase {
    func login(token idTokenString: String) -> Completable
}

public final class DefaultLoginUseCase: LoginUseCase {
    private let authRepository: AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func login(token idTokenString: String) -> Completable {
        self.authRepository.login(token: idTokenString)
    }
}
