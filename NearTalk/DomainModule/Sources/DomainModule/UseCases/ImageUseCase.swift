//
//  LoadImageUseCase.swift
//  NearTalk
//
//  Created by 김영욱 on 2022/11/23.
//

import Foundation
import RxSwift

public protocol ImageUseCase {
    func saveImage(image: Data) -> String?
    func loadImage(path: String) -> Data?
}

public final class DefaultImageUseCase: ImageUseCase {
    private let disposeBag = DisposeBag()
    private let imageRepository: ImageRepository!
    
    public init(imageRepository: ImageRepository) {
        self.imageRepository = imageRepository
    }

    public func saveImage(image: Data) -> String? {
        return ""
    }
    
    public func loadImage(path: String) -> Data? {
        return Data()
    }
}
