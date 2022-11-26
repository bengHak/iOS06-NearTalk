//
//  ImageUploadUseCase.swift
//  NearTalk
//
//  Created by Preston Kim on 2022/11/21.
//

import Foundation
import RxSwift

public protocol UploadImageUseCase {
    func execute(image: Data) -> Single<String>
    init(mediaRepository: any MediaRepository)
}

public final class DefaultUploadImageUseCase: UploadImageUseCase {
    private let mediaRepository: any MediaRepository

    public func execute(image: Data) -> Single<String> {
        return self.mediaRepository.uploadImage(image)
    }
    
    public init(mediaRepository: MediaRepository) {
        self.mediaRepository = mediaRepository
    }
}
