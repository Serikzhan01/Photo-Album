//
//  File.swift
//  Photo-Album
//
//  Created by Serikzhan on 15.03.2023.
//

import Foundation

struct AlbumModel: Hashable {
    var title: String?
    var imageCount: Int?
    var image: String
}

extension AlbumModel {
    static let modelsArray = [
        [AlbumModel(title: "Недавние", imageCount: 12, image: "cat"),
         AlbumModel(title: "WhatsApp", imageCount: 3, image: "cat"),
         AlbumModel(title: "Избранное", imageCount: 4, image: "cat"),
         AlbumModel(title: "Telegram", imageCount: 5, image: "cat"),
         AlbumModel(title: "Instagram", imageCount: 6, image: "cat")
        ],
        [AlbumModel(title: "Sokol", imageCount: nil, image: "secondCat"),
         AlbumModel(title: "Kolsay", imageCount: nil, image: "secondCat"),
         AlbumModel(title: "Burabai", imageCount: nil, image: "secondCat"),
         AlbumModel(title: "Family", imageCount: nil, image: "secondCat"),
         AlbumModel(title: "Other", imageCount: nil, image: "secondCat")
        ],
        [AlbumModel(title: nil, imageCount: nil, image: "cat"),
         AlbumModel(title: nil, imageCount: nil, image: "cat"),
         AlbumModel(title: nil, imageCount: nil, image: "cat"),
         AlbumModel(title: nil, imageCount: nil, image: "cat"),
         AlbumModel(title: nil, imageCount: nil, image: "cat")
        ],
    ]
}
