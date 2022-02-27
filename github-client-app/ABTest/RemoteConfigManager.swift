//
//  RemoteConfigManager.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/27.
//

import Foundation
import FirebaseRemoteConfig
import AVFoundation

// MARK: - ABテストで A or B のレイアウトを返す.

enum LayoutType: String {
    case typeA = "A"
    case typeB = "B"
    case `none` = "none"
}

// MARK: - remote config の取得と管理.

final class RemoteConfigManager: ObservableObject {
    
    @Published var layoutType: LayoutType = .none
    
    private let remoteConfig: RemoteConfig
    
    init() {
        self.remoteConfig = RemoteConfig.remoteConfig()
        
        // fetch間隔設定.
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        self.remoteConfig.configSettings = settings
        
        // fetch.
        self.fetchConfig { isSuccess in
            print("### fetch remote config: \(isSuccess)")
            print("### new remote config value = \(self.layoutType)")
        }
    }
    
    
    // remote config の fetch処理.
    private func fetchConfig(completionHandler: ((_ isSuccess: Bool) -> Void)? = nil) {
        print("### current remote config value = \(self.layoutType)")
        
        self.remoteConfig.fetch { [weak self] status, error in
            guard let self = self else { return }
            switch status {
            case .success:
                self.remoteConfig.activate { changed, error in
                    DispatchQueue.main.async {
                        let value = self.remoteConfig["layout_type"].stringValue ?? "none"
                        print("### value = \(value)")
                        self.layoutType = .init(rawValue: value) ?? .none
                    }
                    completionHandler?(true)
                }
            default:
                completionHandler?(false)
            }
        }
    }
}
