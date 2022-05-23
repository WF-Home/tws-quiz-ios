//
//  LandingView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-16.
//
import SwiftUI

struct LandingView: View {
    var action: () -> Void
    var isLoading: Bool
    var body: some View {
        GeometryReader { proxy in
            VStack {
                DefaultText(
                    label: isLoading ? "Please wait while we fetch the quiz data..." : "Welcome to the world of Time Well Spent!",
                    sizeClass: .header)
                    .frame(maxWidth: .infinity, minHeight: proxy.size.height * 0.7)
                if isLoading {
                    ProgressView()
                        .padding(.top, 10)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("defaultText")))
                        .scaleEffect(2)
                } else {
                    DefaultButton(label: "Start", action: action)
                }
                Spacer()
            }
            .background(Color("background"))
            .cornerRadius(7)
        }
    }
}

#if DEBUG
struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
            LandingView(action: {}, isLoading: false)
    }
}
#endif
