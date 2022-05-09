//
//  FetchQuestionsUseCase.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-07.
//
protocol FetchQuestionsUseCaseType {
    func perform() -> [Question]?
}

struct FetchQuestionsUseCase: FetchQuestionsUseCaseType {
    let questionsRepository: QuestionsRepositoryType
    
    func perform() -> [Question]? {
        questionsRepository.fetchQuestionsFromLocalJSON(filename: "questions")
    }
}
