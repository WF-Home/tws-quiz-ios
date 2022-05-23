//
//  ResultCarouselView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-10.
//
import SwiftUI

enum CarouselItem: Int, CaseIterable {
    case title
    case mantra
}

struct ResultCarouselView: View {
    
    private let curiosity : Curiosity
    private let carouselItem: CarouselItem
    
    init(curiosity: Curiosity, carouselItem: CarouselItem) {
        self.curiosity = curiosity
        self.carouselItem = carouselItem
    }
    
    var body: some View {
        GeometryReader { proxy in
            Group {
                switch carouselItem {
                    case .title:
                    titleView(curiosity: curiosity, badgeWidth: proxy.size.width * 0.6)
                    case .mantra:
                        mantraView(curiosity: curiosity)
                }
            }
            .frame(maxWidth: .infinity, minHeight: proxy.size.height * 0.9)
            .background(Color("\(curiosity.shortID)Theme"))
            .padding(.horizontal, 15)
            .cornerRadius(7)
            .shadow(color: Color.black, radius: 5, x: 1, y: 1)
        }
    }
    
    private func titleView(curiosity: Curiosity, badgeWidth: CGFloat) -> some View {
        return VStack {
            Text("You are a \(curiosity.name)")
                .font(.system(size: 20, weight: .bold, design: .default))
            Image("\(curiosity.shortID)_badge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: badgeWidth)
        }
    }
    
    private func mantraView(curiosity: Curiosity) -> some View {
        return VStack {
            Text("Your mantra is ...")
                .font(.system(size: 20, weight: .bold, design: .default))
                .padding(.bottom, 50)
            Text(curiosity.mantra)
                .font(.system(size: 15, weight: .regular, design: .default))
                .padding(.horizontal, 30)
        }
    }
}
