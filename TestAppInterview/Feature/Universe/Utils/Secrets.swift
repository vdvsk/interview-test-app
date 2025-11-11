//
//  Secrets.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 11.11.2025.
//
import Foundation

enum Secrets {

    static var jsonbinAccessKey: String {
        Bundle.main.object(forInfoDictionaryKey: "JSONBIN_ACCESS_KEY") as? String ?? ""
    }

}
