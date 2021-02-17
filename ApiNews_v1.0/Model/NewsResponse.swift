//
//  NewsResponse.swift
//  ApiNews_v1.0
//
//  Created by emm on 15/02/2021.
//
import Foundation
import SwiftUI

// MARK: - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


extension Article {
    static var dummyData: Article {
        .init(author: "first article",
              url: "https://www.20minutes.fr/monde/2978295-20210216-vaccination-coree-nord-tente-pirater-donnees-pfizer", source: "Fox news",
              title: "article legend",
              articleDescription: "conservative ctres example demo writting",
              image: "https://img.20mn.fr/2G_41_pZQQOV_LV51gl7rw/960x614_vaccin-pfizerbiontech-image-illustration.jpg",
              date: Date())
    }
}
