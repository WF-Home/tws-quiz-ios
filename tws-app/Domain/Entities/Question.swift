//
//  Question.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-08.
//
struct Questions: Codable {
    var questions: [Question]
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
