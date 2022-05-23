//
//  AppAction.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-07.
//

enum AppAction: Equatable {
    case questionViewAction(QuestionViewAction)
    case didFetchQuiz(Result<Quiz, Failure>)
    case fetchQuiz
    case getResult(Int)
    case startQuiz
    case updateAppBackground(String)
}
