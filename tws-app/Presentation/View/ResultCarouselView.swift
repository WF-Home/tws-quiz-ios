//
//  ResultCarouselView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-10.
//
import SwiftUI

struct ResultCarouselView: View {
    
    enum CarouselItem: Int {
        case title
        case mantra
        case invalid
    }
    
    private let curiosity : Curiosity
    private let carouselItem: CarouselItem
    
    init(curiosity: Curiosity, carouselIndex: Int) {
        self.curiosity = curiosity
        self.carouselItem = CarouselItem(rawValue: carouselIndex) ?? CarouselItem.invalid
    }
    
    var body: some View {
        GeometryReader { proxy in
            Group {
                switch carouselItem {
                    case .title:
                    titleView(curiosity: curiosity, badgeWidth: proxy.size.width * 0.6)
                    case .mantra:
                        mantraView(curiosity: curiosity)
                    case .invalid:
                        EmptyView()
                }
            }
            .frame(maxWidth: .infinity, minHeight: proxy.size.height * 0.8)
            .background(curiosity.color)
            .padding(.horizontal, 15)
            .cornerRadius(7)
            .shadow(color: Color.black, radius: 5, x: 1, y: 1)
        }
    }
    
    private func titleView(curiosity: Curiosity, badgeWidth: CGFloat) -> some View {
        return VStack {
            Text("You are a \(curiosity.name)")
                .font(.system(size: 20, weight: .bold, design: .default))
            Image(curiosity.badge)
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
