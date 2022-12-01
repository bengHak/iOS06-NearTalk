//
//  ProfileSettingViewController.swift
//  NearTalk
//
//  Created by Preston Kim on 2022/11/14.
//

import RxCocoa
import RxGesture
import RxSwift
import SnapKit
import Then
import UIKit

final class ProfileSettingViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - UI properties
    private let rootView: ProfileSettingView = ProfileSettingView()
    private let scrollView: UIScrollView = UIScrollView().then {
        $0.keyboardDismissMode = .onDrag
        $0.alwaysBounceHorizontal = false
    }
    
    // MARK: - Properties
    private let disposeBag: DisposeBag = DisposeBag()
    private let viewModel: any ProfileSettingViewModel

    // MARK: - Lifecycles
    override func viewWillLayoutSubviews() {
//        self.rootView.frame = self.view.frame
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let subViewsheight: CGFloat = self.rootView.subviews.reduce(0, { partialResult, view in
//            partialResult + view.frame.height
//        })
//        let height: CGFloat = self.view.frame.height + subViewsheight
//        self.scrollView.contentSize = .init(width: self.view.frame.width, height: height)
        self.scrollView.updateContentSize()
    }
    
    override func loadView() {
        self.view = self.scrollView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.scrollView.addSubview(self.rootView)
        self.rootView.snp.makeConstraints { make in
            make.edges.equalTo(self.scrollView.contentLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
        }
//        self.scrollView.snp.makeConstraints { make in
//            make.edges.width.equalTo(self.view.safeAreaLayoutGuide)
//        }
        
        self.bindToViewModel()
    }
    
    init(viewModel: any ProfileSettingViewModel, neccesaryProfileComponent: NecessaryProfileComponent?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        if let neccesaryProfileComponent = neccesaryProfileComponent {
            self.rootView.injectProfileData(profileData: neccesaryProfileComponent)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}

// MARK: - Helpers
private extension ProfileSettingViewController {
    
    func configureNavigationBar() {
        self.navigationItem.title = "프로필 설정"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: nil)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func bindToViewModel() {
        self.bindNickNameField()
        self.bindMessageField()
        self.bindProfileTap()
        self.bindRegisterButton()
    }
    
    func bindNickNameField() {
        self.rootView.nickNameText
            .bind(onNext: { [weak self] text in
                self?.viewModel.editNickName(text)
            })
            .disposed(by: self.disposeBag)
        self.viewModel.nickNameValidity
            .asDriver()
            .map { isValid in
                isValid ? "사용 가능한 닉네임 입니다" : "5-16 자 사이의 영어 소문자, 숫자, -_ 기호만 사용하십시오"
            }
            .drive(self.rootView.nickNameValidityMessage)
            .disposed(by: self.disposeBag)
        self.viewModel.nickNameValidity
            .asDriver()
            .map { isValid in
                isValid ? UIColor.green : UIColor.red
            }
            .drive(self.rootView.nickNameValidityColor)
            .disposed(by: self.disposeBag)
        self.rootView.keyboardWillShowOnNickNameField
            .compactMap { $0.userInfo }
            .drive(onNext: { self.rootView.moveUpKeyboardAboveNickName(userInfo: $0) })
            .disposed(by: self.disposeBag)
        self.rootView.keyboardWillDismissFromNickNameField
            .compactMap { $0.userInfo }
            .drive(onNext: { self.rootView.moveDownKeyboard(userInfo: $0) })
            .disposed(by: self.disposeBag)
    }
    
    func bindMessageField() {
        self.rootView.messageText
            .bind(onNext: { [weak self] text in
                self?.viewModel.editStatusMessage(text)
            })
            .disposed(by: self.disposeBag)
        self.rootView.keyboardWillShowOnMessageField
            .compactMap { $0.userInfo }
            .drive(onNext: { self.rootView.moveUpKeyboardAboveMessage(userInfo: $0) })
            .disposed(by: self.disposeBag)
        self.rootView.keyboardWillDismissFromMessageField
            .compactMap { $0.userInfo }
            .drive(onNext: { self.rootView.moveDownKeyboard(userInfo: $0) })
            .disposed(by: self.disposeBag)
        self.viewModel.messageValidity
            .asDriver()
            .map { isValid in
                isValid ? "사용 가능한 메세지 입니다" : "50자 이하로 작성하십시오"
            }
            .drive(self.rootView.messageValidityMessage)
            .disposed(by: self.disposeBag)
        self.viewModel.messageValidity
            .asDriver()
            .map { isValid in
                isValid ? UIColor.green : UIColor.red
            }
            .drive(self.rootView.messageValidityColor)
            .disposed(by: self.disposeBag)
    }
    
    func bindProfileTap() {
        self.rootView.tapProfileEvent
            .bind(onNext: { [weak self] _ in
                self?.viewModel.editImage()
            })
            .disposed(by: self.disposeBag)
        self.viewModel.image
            .asDriver()
            .compactMap { $0 }
            .map { UIImage(data: $0) }
            .drive(self.rootView.profileImage)
            .disposed(by: self.disposeBag)
    }
    
    func bindRegisterButton() {
        if let updateButton = self.navigationItem.rightBarButtonItem {
            self.viewModel.updateEnable
                .bind(to: updateButton.rx.isEnabled)
                .disposed(by: self.disposeBag)
            updateButton.rx
                .tap
                .bind(onNext: { [weak self] in
                    self?.viewModel.update()
                })
                .disposed(by: self.disposeBag)
        }
    }
}

extension UIScrollView {
    func updateContentSize() {
        let unionCalculatedTotalRect = recursiveUnionInDepthFor(view: self)
        
        // 계산된 크기로 컨텐츠 사이즈 설정
        self.contentSize = CGSize(width: self.frame.width, height: unionCalculatedTotalRect.height+50)
    }
    
    private func recursiveUnionInDepthFor(view: UIView) -> CGRect {
        var totalRect: CGRect = .zero
        
        // 모든 자식 View의 컨트롤의 크기를 재귀적으로 호출하며 최종 영역의 크기를 설정
        for subView in view.subviews {
            totalRect = totalRect.union(recursiveUnionInDepthFor(view: subView))
        }
        
        // 최종 계산 영역의 크기를 반환
        return totalRect.union(view.frame)
    }
}
