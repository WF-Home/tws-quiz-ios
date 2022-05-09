//
//  AppReducer.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-07.
//
import ComposableArchitecture

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
        case .questionViewAction(let action):
            guard case .appAction(let action) = action else {
                return .none
            }
            return Effect(value: action)
        
        case .didFetchQuestions:
        guard let questions = state.questionViewState.questions else {
            return .none
        }
        state.questionViewState.activeQuestion = questions[0]
            return .none
            
        case .fetchQuestions:
            state.questionViewState.questions = environment.fetchQuestionsUseCase.perform()
            return Effect(value: .didFetchQuestions)
        
        case .updateAppBackground(let background):
            state.appBackground = background
            return .none
    }
}

let composedAppReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
    [
        appReducer,
        questionViewReducer.pullback(
            state: \.questionViewState,
            action: /AppAction.questionViewAction,
            environment: { $0 }
        )
    ]
)
