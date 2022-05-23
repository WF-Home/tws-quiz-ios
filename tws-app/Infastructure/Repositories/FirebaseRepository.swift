//
//  FirebaseRepository.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-20.
//
import ComposableArchitecture
import Foundation

struct Failure: Error, Equatable {}

struct FirebaseRepository: APIRepositoryType {
    func fetchDataUsingURL() -> Effect<Quiz, Failure> {
        return URLSession.shared.dataTaskPublisher(for: url())
            .map { $0.data }
            .decode(type: Quiz.self, decoder: JSONDecoder())
            .mapError { _ in Failure() }
            .eraseToEffect()
    }
    
    private func url() -> URL {
        return URL(string: "https://tws-quiz-7b27a-default-rtdb.asia-southeast1.firebasedatabase.app/response.json")!
    }
}
