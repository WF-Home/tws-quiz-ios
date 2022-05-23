//
//  ResultView.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
import SwiftUI


struct ResultView: View {
    let curiosity: Curiosity
    let resetQuiz: () -> Void
    @State private var index = 0
    
    let updateBackground: (String) -> Void
    
    var body: some View {
        VStack {
            VStack {
                TabView(selection: $index) {
                    ForEach(CarouselItem.allCases, id: \.rawValue) { item in
                        ResultCarouselView(curiosity: curiosity, carouselItem: item)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            .padding(5)
            HStack(spacing: 20) {
                Button(action: {
                    if let url = URL(string: curiosity.spotify()) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("tws_spotify")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                }
                Button(action: { resetQuiz()}) {
                    Image("tws_reset")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                }
                .shadow(color: Color.black, radius: 5, x: 1, y: 1)
                .onAppear {
                    updateBackground("\(curiosity.shortID)Background")
                }
                Button(action: {
                    if let url = URL(string: curiosity.tweet()) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Image("tws_tweet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                }
            }
        }
    }
}

#if DEBUG
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
            ResultView(
                curiosity: Curiosity(
                    shortID: "bloom",
                    name: "Bloom Collector",
                    playlistID: "",
                    mantra: "This is my mantra",
                    resultFor: []
                ),
                resetQuiz: {},
                updateBackground: {_ in}
            )
    }
}
#endif
