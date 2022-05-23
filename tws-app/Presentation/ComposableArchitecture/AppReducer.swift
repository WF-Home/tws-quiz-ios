//
//  AppReducer.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-07.
//
import Combine
import ComposableArchitecture

enum GeneralError: Error {
    case `default`(String)
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
        case .questionViewAction(let action):
            guard case .appAction(let action) = action else {
                return .none
            }
            return Effect(value: action)
        
    case .didFetchQuiz(let .success(quiz)):
        while state.quiz == nil {
            state.quiz = quiz
        }
        
        if let quiz = state.quiz {
            state.questionViewState.questions = quiz.questions
            state.curiosities = quiz.curiosities
            state.isLoading = false
        }
        return .none
        
    case .didFetchQuiz(let .failure(quiz)):
        return .none
        
            
        case .fetchQuiz:
            return environment.fetchQuizUseCase.perform()
                .receive(on: environment.mainQueue)
                .catchToEffect(AppAction.didFetchQuiz)
        
    case .getResult(let questionID):
        if let curiosities = state.curiosities {
            state.result = curiosities.first(where: { $0.resultFor.contains(questionID) })
            state.quizStatus = .displayResult
        }
        return .none
        
    case .startQuiz:
        state.questionViewState.activeQuestion = state.questionViewState.questions[0]
        state.quizStatus = .quizInProgress
        return .none
        
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
