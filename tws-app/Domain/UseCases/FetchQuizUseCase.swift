//
//  FetchQuizUseCase.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-20.
//

import ComposableArchitecture
import Foundation
protocol FetchQuizUseCaseType {
    func perform() -> Effect<Quiz, Failure>
}

struct FetchQuizUseCase: FetchQuizUseCaseType {
    let repository : APIRepositoryType
    func perform() -> Effect<Quiz, Failure> {
        repository.fetchDataUsingURL()
    }
}
