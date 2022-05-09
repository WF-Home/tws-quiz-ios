//
//  QuestionsRepository.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-07.
//
import Foundation

struct QuestionsRepository: QuestionsRepositoryType {
    func fetchQuestionsFromLocalJSON(filename: String) -> [Question]? {
        if let data = readLocalFile(filename: filename) {
            if let questions = parse(json: data) {
                return questions
            }
        } else {
            return nil
        }
        return nil
    }
    
    private func readLocalFile(filename: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(
                    forResource: filename,
                    ofType: "json"
                ),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(json: Data) -> [Question]? {
        let decoder = JSONDecoder()
        var questions: [Question]?
        
        if let jsonContents = try? decoder.decode(Questions.self, from: json) {
            questions = jsonContents.questions
        } else {
            print("Local JSON could not be decoded")
            questions = nil
        }
        return questions
    }
    
    func fetchQuestions() -> [Question] {
        return [
            Question(
                id: 1,
                text: "You open your eyes and you're under a tall, old tree. Its leaves are swaying, even falling with the wind. When you look up at the sky, what do you see?",
                answers: [Answer(text: "Day time", leadsTo: 2), Answer(text: "Night time", leadsTo: 3)]
            ),
            Question(
                id: 2,
                text: "You see clouds as soft as cotton, with streaks of golden rays peeking through. Barefoot, you walk on the grass. As you walk on, you stumble upon mysterious door. You open it, and to your surprise, the season is different on the other side. Is it spring or fall?",
                answers: [Answer(text: "Spring", leadsTo: 4), Answer(text: "Fall", leadsTo: 4)]
            ),
            Question(
                id: 3,
                text: "You stumble upon a mysterius door that seems to be calling you. You open it, and to your surprise, the season is different on the other side. Is it summer or winter?",
                answers: [Answer(text: "Summer", leadsTo: 4), Answer(text: "Winter", leadsTo: 4)]
            ),
            Question(id: 4, text: "You are an ewan", answers: [])
        ]
    }
}
