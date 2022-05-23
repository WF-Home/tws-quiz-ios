//
//  QuestionViewAction.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
indirect enum QuestionViewAction: Equatable {
    case appAction(AppAction)
    case selectAnswer(Int)
    case setActiveQuestion(Int)
}
