//
//  LandingView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-16.
//
import SwiftUI

struct LandingView: View {
    var action: () -> Void
    var body: some View {
        GeometryReader { proxy in
            portraitMode(proxy: proxy)
        }
    }
    
    func portraitMode(proxy: GeometryProxy) -> some View {
        VStack {
            Text("Welcome to the world of Time Well Spent!")
                .font(.system(size: 25, weight: .semibold, design: .default))
                .frame(maxWidth: .infinity, minHeight: proxy.size.height * 0.75, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 15)
                .cornerRadius(5)
            GeometryReader { buttonProxy in
                VStack {
                    Button(action: { action() }) {
                        Text("Start")
                            .font(.system(size: 15, weight: .regular, design: .default))
                            .frame(maxWidth: buttonProxy.size.width * 0.9, maxHeight: 30)
                            .padding(.vertical, 5)
                            .background(Color("background"))
                            .cornerRadius(5)
                            .shadow(color: Color.black, radius: 5, x: 1, y: 1)
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
