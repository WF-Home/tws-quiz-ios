//
//  ActiveQuestionView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
import SwiftUI

struct ActiveQuestionView: View {
    let question: Question
    let selectAnswer: (Int) -> Void
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 10) {
                Text(question.text)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, minHeight: proxy.size.height * 0.7)
                    .padding(.horizontal, 15)
                    .cornerRadius(5)
                GeometryReader { answerProxy in
                    VStack {
                        if let answers = question.answers {
                            ForEach(answers, id: \.self) { answer in
                                Button(answer.text, action: {selectAnswer(answer.leadsTo)})
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: answerProxy.size.width * 0.8, maxHeight: 30)
                                    .padding(.vertical, 5)
                                    .background(Color("background"))
                                    .cornerRadius(5)
                                    .shadow(color: Color.black, radius: 5, x: 1, y: 1)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 20)
            .background(Color("background"))
        }
    }
}
