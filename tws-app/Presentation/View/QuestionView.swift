//
//  QuestionView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
import ComposableArchitecture
import SwiftUI

struct QuestionViewState: Equatable {
    var questions = [Question]()
    var activeQuestion: Question?
}

struct QuestionView: View {
    
    let store: Store<QuestionViewState, QuestionViewAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            if let activeQuestion = viewStore.activeQuestion {
                ActiveQuestionView(
                    question: activeQuestion,
                    selectAnswer: { leadsTo in
                        viewStore.send(.selectAnswer(leadsTo))
                    },
                    getResult: { questionID in
                        viewStore.send(.appAction(.getResult(questionID)))}
                )
                .cornerRadius(7)
            } else {
                // TODO: create proper error state
                Text("No Questions Found.")
            }
        }
    }
}
