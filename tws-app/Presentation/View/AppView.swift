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
                    .shadow(color: Color.black, radius: 3, x: 1, y: 1)
                    if viewStore.questionViewState.questions != nil {
                        QuestionView(store: store.scope(state: \.questionViewState, action: AppAction.questionViewAction))
                    } else {
                        LandingView(action: { viewStore.send(.fetchQuestions) })
                    }
            }
            .foregroundColor(Color("defaultText"))
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
            .background(
                Image(viewStore.appBackground)
                    .resizable()
                    .scaledToFill()
            )
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                AppDelegate.orientationLock = .portrait
            }
        }
    }
}
