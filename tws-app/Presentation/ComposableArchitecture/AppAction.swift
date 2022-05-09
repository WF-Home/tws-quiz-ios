//
//  AppAction.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-07.
//

enum AppAction: Equatable {
    case questionViewAction(QuestionViewAction)
    case didFetchQuestions
    case fetchQuestions
    case updateAppBackground(String)
}
