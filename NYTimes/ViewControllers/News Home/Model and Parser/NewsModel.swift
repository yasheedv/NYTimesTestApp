//
//  NewsModel.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 1/15/19.
//  Copyright © 2019 Yasheed Muhammed. All rights reserved.
//

import Foundation

struct NewsModel: Codable {
    var articleUrl: String
    var title: String
    var abstract: String
    var publishedDate: String
    var byLine: String
    var media: [Media]
    init() {
        articleUrl      = ""
        title           = ""
        abstract        = ""
        publishedDate   = ""
        byLine          = ""
        media           = [Media]()

    }
    private enum CodingKeys: String, CodingKey {
        case articleUrl = "url"
        case title
        case abstract
        case publishedDate  = "published_date"
        case byLine         = "byline"
        case media
    }
}

struct Media: Codable {
    var metaData: [MediaMetaData]
    private enum CodingKeys: String, CodingKey {
        case metaData = "media-metadata"
    }
}

struct MediaMetaData: Codable {
    var url: String
}
