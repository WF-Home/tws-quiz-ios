//
//  AppView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
import ComposableArchitecture
import SwiftUI

struct AppState: Equatable {
    var questionViewState = QuestionViewState()
    var appBackground = "TWSHeaderPlain"
}

struct AppView: View {
    
    let store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Image("TWSHeaderTitle")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 30)
                QuestionView(store: store.scope(state: \.questionViewState, action: AppAction.questionViewAction))
                    .onAppear {
                        viewStore.send(.fetchQuestions)
                    }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
            .background(
                Image(viewStore.appBackground)
                    .resizable()
                    .scaledToFill()
            )
        }
    }
}
