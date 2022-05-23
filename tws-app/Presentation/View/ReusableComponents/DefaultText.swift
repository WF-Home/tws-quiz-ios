//
//  DefaultText.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-22.
//
import SwiftUI

struct DefaultText: View {
    
    enum SizeClass {
        case body
        case header
    }
    var label: String
    var sizeClass: SizeClass = .body
    
    var body: some View {
        Text(label)
            .font(.system(size: size(sizeClass), weight: .semibold, design: .default))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 15)
    }
    
    private func size(_ size: SizeClass) -> CGFloat {
        switch size {
            case .body:
                return 15
            case .header:
                return 20
        }
    }
    
    private func weight(_ size: SizeClass) -> Font.Weight {
        switch size {
            case .body:
                return .regular
            case .header:
                return .semibold
        }
    }
}
