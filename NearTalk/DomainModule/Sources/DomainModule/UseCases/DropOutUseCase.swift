//
//  DropOutUseCase.swift
//  NearTalk
//
//  Created by Preston Kim on 2022/11/21.
//

import RxSwift

public protocol DropoutUseCase {
    func dropout() -> Completable
    init(authRepository: AuthRepository)
}

public final class DefaultDropOutUseCase: DropoutUseCase {
    private let authRepository: any AuthRepository
    
    public init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    public func dropout() -> Completable {
        return self.authRepository.dropout()
    }
}
