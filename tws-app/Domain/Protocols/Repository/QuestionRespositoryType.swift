//
//  QuestionRespositoryType.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-09.
//
protocol QuestionsRepositoryType {
    func fetchQuestionsFromLocalJSON(filename: String) -> [Question]?
    func fetchQuestions() -> [Question]
}
