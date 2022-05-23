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
    var quiz: Quiz?
    var quizStatus: Status = .quizNotStarted
    var curiosities: [Curiosity]?
    var result: Curiosity?
    var isLoading = true
    
    enum Status {
        case quizNotStarted
        case quizInProgress
        case displayResult
    }
}

struct AppView: View {
    
    let store: Store<AppState, AppAction>
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Spacer()
                Image("TWSHeaderTitle")
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color.black, radius: 3, x: 1, y: 1)
                GeometryReader { proxy in
                    Group {
                        switch viewStore.state.quizStatus {
                        case .quizNotStarted:
                            LandingView(action: { viewStore.send(.startQuiz) }, isLoading: viewStore.isLoading)
                                .onAppear {
                                    viewStore.send(.fetchQuiz)
                                }
                        case .quizInProgress:
                            QuestionView(store: store.scope(state: \.questionViewState, action: AppAction.questionViewAction))
                        case .displayResult:
                            if let curiosity = viewStore.result {
                                ResultView(
                                    curiosity: curiosity,
                                    resetQuiz: { viewStore.send(.startQuiz) },
                                    updateBackground: { background in
                                        viewStore.send(.updateAppBackground(background))
                                    }
                                )
                            }
                        }
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height * 0.85)
                }
                Spacer()
            }
            .foregroundColor(Color("defaultText"))
            .padding(.horizontal, 25)
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
