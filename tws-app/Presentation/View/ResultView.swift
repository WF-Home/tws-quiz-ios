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
    let badge: String
    let playlist: String
    let tweet: URL?
}

struct ResultView: View {
    let result: String
    let resetQuiz: () -> Void
    @State private var index = 0
    
    let updateBackground: (String) -> Void
    
    var body: some View {
        VStack {
            if let curiosity = curiosityResult(curiosity: result) {
                VStack {
                    TabView(selection: $index) {
                        ForEach((0..<2), id: \.self) { index in
                            ResultCarouselView(curiosity: curiosity, carouselIndex: index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
                .padding(5)
                HStack(spacing: 20) {
                    Button(action: {
                        if let url = URL(string: "https://open.spotify.com/playlist/\(curiosity.playlist)") {
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
                        updateBackground(curiosity.background)
                    }
                    Button(action: {
                        if let url = curiosity.tweet {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image("tws_tweet")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                    }
                }
            } else {
                EmptyView()
            }
        }
    }
    
    func curiosityResult(curiosity: String) -> Curiosity? {
        switch curiosity {
        case "bloom":
            return Curiosity(
                name: "Bloom Collector",
                mantra: "I am opening my arms. I have been craving warmth. Every petal opens up to greet me. All beauty surrenders at my feet. I am reaping with care and respect. I am receiving the bounty of life - both bloom and bug, both flower and weed.",
                color: Color("bloomTheme"),
                background: "BloomBackground",
                badge: "bloom_badge",
                playlist: "5KKe3cEcl6WZMAoW7R37HS?si=t6M27WibTIqzIXd2swEx7Q",
                tweet: tweet("Bloom", "Collector", playlist: "5KKe3cEcl6WZMAoW7R37HS?si=t6M27WibTIqzIXd2swEx7Q"))
        case "keep":
            return Curiosity(
                name: "Memory Keeper",
                mantra: "I am barefoot on the grass. I am out to see the worlds I have dreamed about. The skies are clear, the heaves have opened. The sun is beaming just for me. I am keeping my eyes wide open. I am committing this memory. Every inch and every secret will be remembered.",
                color: Color("keepTheme"),
                background: "KeepBackground",
                badge: "keep_badge",
                playlist: "5ZrN4prD1dksQGeoMrfqRR?si=w105ghAbQACYMU4sQnVtyQ",
                tweet: tweet("Memory", "Keeper", playlist: "5ZrN4prD1dksQGeoMrfqRR?si=w105ghAbQACYMU4sQnVtyQ"))
        case "heal":
            return Curiosity(
                name: "Soul Healer",
                mantra: "I am retreating for a while. I am quietly observing. It is important for me to feel safe. I am tending to my broken wing. I am stretching and growing into my own. In unfolding slowly, I am learning that I have no limits.",
                color: Color("healTheme"),
                background: "HealBackground",
                badge: "heal_badge",
                playlist: "627GU52bLn78uQVDP46ASE?si=EeWjBgUUSQaaMggRq2WsZA",
                tweet: tweet("Soul", "Healer", playlist: "627GU52bLn78uQVDP46ASE?si=EeWjBgUUSQaaMggRq2WsZA"))
        case "grow":
            return Curiosity(
                name: "Garden Grower",
                mantra: "I am beginning again. I am starting anew. In my hands, I am cradling all possibilities. I am planting these seeds with my back bent, my fingers cupping the welcoming earth. I am nurturing life. It is waiting for me.",
                color: Color("growTheme"),
                background: "GrowBackground",
                badge: "grow_badge",
                playlist: "0Xyb1tzBQDOCnxywqMPCG9?si=wvGligrJRYejNUfJig5vXw",
                tweet: tweet("Garden", "Grower", playlist: "0Xyb1tzBQDOCnxywqMPCG9?si=wvGligrJRYejNUfJig5vXw"))
        default:
            return nil
        }
    }
    
    private func tweet(_ prefix: String, _ suffix: String, playlist: String) -> URL? {
        return URL(string:  "https://twitter.com/intent/tweet?text=I%20am%20a%20\(prefix)%20\(suffix).%20This%20is%20my%20anthem:%20&url=https%3A%2F%2Fopen.spotify.com%2Fplaylist%2F\(playlist)")
    }
}
