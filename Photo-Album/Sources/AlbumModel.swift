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
        [AlbumModel(title: "Sokol", imageCount: 12, image: "secondCat"),
         AlbumModel(title: "Kolsay", imageCount: 32, image: "secondCat"),
         AlbumModel(title: "Burabai", imageCount: 12, image: "secondCat"),
         AlbumModel(title: "Family", imageCount: 32, image: "secondCat"),
         AlbumModel(title: "Other", imageCount: 21, image: "secondCat")
        ],
        [AlbumModel(title: "Видео", imageCount: 13, image: "video"),
         AlbumModel(title: "Селфи", imageCount: 52, image: "person"),
         AlbumModel(title: "Фото Live Photos", imageCount: 325, image: "livephoto"),
         AlbumModel(title: "Портреты", imageCount: 52, image: "cube"),
         AlbumModel(title: "Таймлапс", imageCount: 21, image: "timelapse"),
         AlbumModel(title: "Замедленно", imageCount: 12, image: "slowmo"),
         AlbumModel(title: "Снимки экрана", imageCount: 431, image: "camera"),
         AlbumModel(title: "Записи экрана", imageCount: 1, image: "record"),
         AlbumModel(title: "Анимированные", imageCount: 12, image: "3layers")
        ]
    ]
}
