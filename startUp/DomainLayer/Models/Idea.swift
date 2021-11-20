//
//  Idea.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct Idea: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String = ""
    var shortDescription: String = ""
    var description: String = ""
    var state: Phase = Phase(creation: Status.notStarted, internalChallenging: Status.notStarted, challenging: Status.notStarted)
    
    var userId: String?
    @ServerTimestamp var createdTime: Timestamp?
}

struct Phase: Codable {
    var creation: Status
    var internalChallenging: Status
    var challenging: Status
}

enum Status: String, Codable {
    case notStarted
    case pending
    case successful
    case failed
}
