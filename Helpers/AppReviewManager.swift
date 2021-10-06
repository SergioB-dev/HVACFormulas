//
//  AppReviewManager.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/24/21.
//

import StoreKit
import SwiftUI

enum AppStoreReviewManager {
    
    static let minimumReviewWorthyActionCount = 3
    
    static func requestReviewIfAppropriate() {
        let defaults = UserDefaults.standard
        let bundle = Bundle.main
        
        var actionCount = defaults.integer(forKey: .reviewWorthyActionCount)
        
        actionCount += 1
        
        defaults.set(actionCount, forKey: .reviewWorthyActionCount)
        print("Entries until next app review is shown = 3 - \(actionCount)")
        
        guard actionCount >= minimumReviewWorthyActionCount else {
            return
        }
        
        let bundleVersionKey = kCFBundleVersionKey as String
        let currentVersion = bundle.object(forInfoDictionaryKey: bundleVersionKey) as? String
        
        let lastVersion = defaults.string(forKey: .lastReviewRequestAppVersion)
        #if !DEBUG
            guard lastVersion == nil || lastVersion != currentVersion else {
                return
            }
        #endif
        
        if let windowScene = UIApplication.shared.windows.first?.windowScene {
            SKStoreReviewController.requestReview(in: windowScene)
            print("App Review should show")
        }
        
        
        defaults.set(0, forKey: .reviewWorthyActionCount)
        defaults.set(currentVersion, forKey: .lastReviewRequestAppVersion)
        
    }
}


extension UserDefaults {
    enum Key: String {
        case reviewWorthyActionCount
        case lastReviewRequestAppVersion
    }
    
    func integer(forKey key: Key) -> Int {
        return integer(forKey: key.rawValue)
    }
    
    func string(forKey key: Key) -> String? {
        return string(forKey: key.rawValue)
    }
    
    func set(_ integer: Int, forKey key: Key) {
        set(integer, forKey: key.rawValue)
    }
    
    func set(_ object: Any?, forKey key: Key) {
        set(object, forKey: key.rawValue)
    }
}

struct SaveStatus: EnvironmentKey {
    static var defaultValue: Binding<Bool> = Binding.constant(false)
}

extension EnvironmentValues {
    var saveStatus: Binding<Bool> {
        get {self[SaveStatus.self] }
        set {self[SaveStatus.self] = newValue}
    }
}
