//
//  Curiosity.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-22.
//
struct Curiosity: Codable, Equatable {
    let shortID: String
    let name: String
    let playlistID: String
    let mantra: String
    let resultFor: [Int]
    
    func tweet() -> String {
        let name = self.name.components(separatedBy: " ")
        return "https://twitter.com/intent/tweet?text=I%20am%20a%20\(name[0])%20\(name[1]).%20This%20is%20my%20anthem:%20&url=https%3A%2F%2Fopen.spotify.com%2Fplaylist%2F\(self.playlistID)"
    }
    
    func spotify() -> String {
        return "https://open.spotify.com/playlist/\(self.playlistID)"
    }
    
}
