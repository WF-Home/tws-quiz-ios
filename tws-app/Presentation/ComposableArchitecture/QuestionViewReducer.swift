//
//  QuestionViewReducer.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
import ComposableArchitecture

let questionViewReducer = Reducer<QuestionViewState, QuestionViewAction, AppEnvironment> { state, action, environment in
    switch action {
    case .appAction:
        return .none
        
    case .resetQuiz:
        return Effect.merge([Effect(value: .setActiveQuestion(1)), Effect(value: .appAction(.updateAppBackground("TWSHeaderPlain")))])
        
    case .selectAnswer(let nextQuestion):
        return Effect(value: .setActiveQuestion(nextQuestion))
        
    case .setActiveQuestion(let activeQuestion):
        state.activeQuestion = state.questions.first(where: { $0.id == activeQuestion })
        return .none
    }
}
