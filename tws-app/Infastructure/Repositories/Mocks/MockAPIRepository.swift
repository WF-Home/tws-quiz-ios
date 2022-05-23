//
//  MockAPIRepository.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-23.
//
import ComposableArchitecture

struct MockAPIRepository : APIRepositoryType {
    func fetchDataUsingURL() -> Effect<Quiz, Failure> {
        return Effect(value: Quiz(
            questions: [
                Question(id: 1, text: "Mock question 1", answers: [Answer(text: "answer 1", leadsTo: 2), Answer(text: "answer 2", leadsTo: 2)]),
                Question(id: 2, text: "Mock question 2", answers: nil)
            ],
            curiosities: [
                Curiosity(
                shortID: "bloom",
                name: "Bloom Collector",
                playlistID: "",
                mantra: "mock mantra",
                resultFor: [2])
                ]
            )
        )
    }
}
