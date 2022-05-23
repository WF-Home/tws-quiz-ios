//
//  FirebaseRepositoryType.swift
//  tws-app
//
//  Created by Wiljay Flores on 2022-05-20.
//
import ComposableArchitecture
import Foundation

protocol APIRepositoryType {
    func fetchDataUsingURL() -> Effect<Quiz, Failure>
}
