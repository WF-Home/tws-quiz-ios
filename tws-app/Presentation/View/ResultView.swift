//
//  ResultView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
import SwiftUI

struct Curiosity {
    let name: String
    let mantra: String
    let color: Color
    let background: String
}

struct ResultView: View {
    let result: String
    let resetQuiz: () -> Void
    
    let updateBackground: (String) -> Void
    
    var body: some View {
        VStack {
            if let curiousity = curiosity(curiosity: result) {
                GeometryReader { proxy in
                    VStack {
                        Text("You are a \(curiousity.name)")
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .padding(.vertical, 30)
                            .foregroundColor(Color.white)
                        Text(curiousity.mantra)
                            .foregroundColor(Color.white)
                    }
                    .padding(.horizontal, 15)
                    .frame(maxWidth: .infinity, minHeight: proxy.size.height * 0.8)
                    .background(curiousity.color)
                    .cornerRadius(7)
                    .onAppear {
                        updateBackground(curiousity.background)
                    }
                }
                Button("Reset Quiz", action: { resetQuiz() })
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .foregroundColor(Color.white)
                    .background(curiousity.color)
            } else {
                EmptyView()
            }
        }
    }
    
    func curiosity(curiosity: String) -> Curiosity? {
        switch curiosity {
        case "bloom":
            return Curiosity(
                name: "Bloom Collector",
                mantra: "I am opening my arms. I have been craving warmth. Every petal opens up to greet me. All beauty surrenders at my feet. I am reaping with care and respect. I am receiving the bounty of life - both bloom and bug, both flower and weed.",
                color: Color("bloomTheme"),
                background: "BloomBackground")
        case "keep":
            return Curiosity(
                name: "Memory Keeper",
                mantra: "I am opening my arms. I have been craving warmth. Every petal opens up to greet me. All beauty surrenders at my feet. I am reaping with care and respect. I am receiving the bounty of life - both bloom and bug, both flower and weed.",
                color: Color("keepTheme"),
                background: "KeepBackground")
        case "heal":
            return Curiosity(
                name: "Soul Healer",
                mantra: "I am opening my arms. I have been craving warmth. Every petal opens up to greet me. All beauty surrenders at my feet. I am reaping with care and respect. I am receiving the bounty of life - both bloom and bug, both flower and weed.",
                color: Color("healTheme"),
                background: "HealBackground")
        case "grow":
            return Curiosity(
                name: "Garden Grower",
                mantra: "I am opening my arms. I have been craving warmth. Every petal opens up to greet me. All beauty surrenders at my feet. I am reaping with care and respect. I am receiving the bounty of life - both bloom and bug, both flower and weed.",
                color: Color("growTheme"),
                background: "GrowBackground")
        default:
            return nil
        }
    }
}
