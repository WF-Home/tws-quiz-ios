//
//  QuestionView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
import ComposableArchitecture
import SwiftUI

struct QuestionViewState: Equatable {
    var questions: [Question]?
    var activeQuestion: Question?
}

struct QuestionView: View {
    
    let store: Store<QuestionViewState, QuestionViewAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            if let activeQuestion = viewStore.activeQuestion {
                if activeQuestion.answers != [] {
                    ActiveQuestionView(
                        question: activeQuestion,
                        selectAnswer: { leadsTo in
                            viewStore.send(.selectAnswer(leadsTo))
                        }
                    )
                    .cornerRadius(7)
                } else {
                    ResultView(
                        result: activeQuestion.text,
                        resetQuiz: { viewStore.send(.resetQuiz) },
                        updateBackground: { background in
                            viewStore.send(.appAction(.updateAppBackground(background)))
                        }
                    )
                }
            } else {
                Text("No Questions Found.")
            }
        }
    }
}
