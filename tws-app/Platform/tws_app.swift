//
//  tws_appApp.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-07.
//

import SwiftUI
import Combine
import CombineSchedulers
import ComposableArchitecture

@main
struct tws_app: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            AppView(store: Store(
                initialState: AppState(),
                reducer: .combine(composedAppReducer),
                environment: appEnvironment())
            )
        }
    }
    
    func appEnvironment() -> AppEnvironment {
        let firebaseRepository = FirebaseRepository()
        return AppEnvironment(
            mainQueue: .main,
            apiRepository: firebaseRepository
        )
    }
    

}

final class AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    private let apiRepository: APIRepositoryType
    
    init(
        mainQueue: AnySchedulerOf<DispatchQueue>,
        apiRepository: APIRepositoryType
    ) {
        self.mainQueue = mainQueue
        self.apiRepository = apiRepository
    }
    
    lazy var fetchQuizUseCase: FetchQuizUseCaseType = FetchQuizUseCase(repository: apiRepository)
}

// Locks app into portrait mode only. Will remove one landscape layout is created
class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
