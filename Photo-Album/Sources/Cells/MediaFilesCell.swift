//
//  MediaFilesCell.swift
//  Photo-Album
//
//  Created by Serikzhan on 17.03.2023.
//

import UIKit
import SnapKit

class MediaFilesCell: UICollectionViewCell {
    
    static let identifier = "MediaFilesCell"
    
    // MARK: - Outlets
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        return label
    }()
    
    lazy var imageCount: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .blue
        return imageView
    }()
    
    lazy var rightIcon: UIImageView = {
        let detailIcon = UIImageView(image: UIImage(systemName: "chevron.right"))
        detailIcon.tintColor = .gray
        return detailIcon
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(image)
        addSubview(title)
        addSubview(imageCount)
        addSubview(rightIcon)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.centerY.equalTo(contentView.snp.centerY)
            make.left.equalTo(self)
        }
        
        title.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(contentView.snp.leading).offset(55)
        }
        
        imageCount.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.trailing.equalTo(contentView.snp.trailing).offset(-40)
        }
        
        rightIcon.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.image = nil
    }
}
