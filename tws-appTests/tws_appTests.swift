//
//  tws_appTests.swift
//  tws-appTests
//
//  Created by Wiljay Flores on 2022-05-07.
//

import XCTest
@testable import tws_app

class tws_appTests: XCTestCase {

    func testCuriosityMethods() throws {
        let sut = Curiosity(
            shortID: "bloom",
            name: "Bloom Collector",
            playlistID: "test",
            mantra: "test",
            resultFor: [1]
        )
        
        let expectedTweet = "https://twitter.com/intent/tweet?text=I%20am%20a%20Bloom%20Collector.%20This%20is%20my%20anthem:%20&url=https%3A%2F%2Fopen.spotify.com%2Fplaylist%2Ftest"
        
        let expectedSpotify = "https://open.spotify.com/playlist/test"
        
        XCTAssertEqual(sut.tweet(), expectedTweet)
        XCTAssertEqual(sut.spotify(), expectedSpotify)
    }

}
