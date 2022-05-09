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
        let questionsRepository = QuestionsRepository()
        return AppEnvironment(
            mainQueue: .main,
            questionsRepository: questionsRepository
        )
    }
    

}

final class AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    private let questionsRepository: QuestionsRepositoryType
    
    init(
        mainQueue: AnySchedulerOf<DispatchQueue>,
        questionsRepository: QuestionsRepositoryType
    ) {
        self.mainQueue = mainQueue
        self.questionsRepository = questionsRepository
    }
    
    lazy var fetchQuestionsUseCase: FetchQuestionsUseCaseType = FetchQuestionsUseCase(
        questionsRepository: questionsRepository
    )
}
