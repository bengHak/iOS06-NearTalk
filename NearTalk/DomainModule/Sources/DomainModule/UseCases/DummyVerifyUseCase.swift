//
//  DummyVerifyUseCase.swift
//  NearTalk
//
//  Created by Preston Kim on 2022/11/23.
//

import RxSwift

public final class DummyVerifyUseCase: VerifyUserUseCase {
    public func verifyUser() -> Completable {
        return Completable.create { completable in
            completable(.completed)
            return Disposables.create()
        }
    }
    
    public func verifyProfile() -> Completable {
        return Completable.create { completable in
            completable(.completed)
            return Disposables.create()
        }
    }
}
