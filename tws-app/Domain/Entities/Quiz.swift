//
//  Question.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
struct Quiz: Codable, Equatable {
    var questions: [Question]
    var curiosities: [Curiosity]
    
    enum CodingKeys: String, CodingKey {
        case questions
        case curiosities = "quiz-results"
    }
    
    struct Failure: Error, Equatable {}
}

struct Question: Codable, Equatable {
    let id: Int
    let text: String
    let answers: [Answer]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case text = "question"
        case answers
    }
}

struct Answer: Codable, Hashable {
    let text: String
    let leadsTo: Int
    
    enum CodingKeys: String, CodingKey {
        case text = "answer"
        case leadsTo = "leads_to"
    }
}
