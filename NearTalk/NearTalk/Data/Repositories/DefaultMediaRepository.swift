//
//  DefaultMediaRepository.swift
//  NearTalk
//
//  Created by 고병학 on 2022/11/23.
//

import DomainModule
import Foundation
import RxSwift

public final class DefaultMediaRepository: MediaRepository {
    private let storageService: StorageService
    
    init(storageService: StorageService) {
        self.storageService = storageService
    }
    
    public func uploadImage(_ imageData: Data) -> RxSwift.Single<String> {
        self.storageService.uploadData(data: imageData, fileName: "\(UUID().uuidString).jpg", dataType: .images)
    }
    
    public func uploadVideo(_ videoData: Data) -> RxSwift.Single<String> {
        self.storageService.uploadData(data: videoData, fileName: "\(UUID().uuidString).mov", dataType: .videos)
    }
}
