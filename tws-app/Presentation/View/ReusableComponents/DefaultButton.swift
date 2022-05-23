//
//  DefaultButton.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-22.
//
import SwiftUI

struct DefaultButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        GeometryReader { proxy in
            Button(action: { action() }) {
                Text(label)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: 30)
                    .padding(.vertical, 5)
                    .background(Color("background"))
                    .cornerRadius(5)
                    .shadow(color: Color.black, radius: 5, x: 1, y: 1)
            }
            .frame(width: proxy.size.width * 0.8)
            .frame(width: proxy.size.width)
        }
        .frame(height: 40)
    }
}
