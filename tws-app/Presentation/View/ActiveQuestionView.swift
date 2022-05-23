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
    let getResult: (Int) -> Void
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                DefaultText(label: question.text, sizeClass: .body)
                    .frame(maxWidth: .infinity, minHeight: proxy.size.height * 0.7)
                GeometryReader { answerProxy in
                    VStack(spacing: 10) {
                        if let answers = question.answers {
                            ForEach(answers, id: \.self) { answer in
                                DefaultButton(label: answer.text, action: { selectAnswer(answer.leadsTo) })
                            }
                        } else {
                            DefaultButton(label: "Continue", action: { getResult(question.id) })
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 20)
            .background(Color("background"))
        }
    }
}

struct ActiveQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveQuestionView(
            question: Question(
                id: 1,
                text: "Test",
                answers: [
                    Answer(text: "Answer", leadsTo: 1),
                    Answer(text: "Answer", leadsTo: 1)
                ]),
            selectAnswer: { _ in } ,
            getResult: { _ in }
        )
    }
}
