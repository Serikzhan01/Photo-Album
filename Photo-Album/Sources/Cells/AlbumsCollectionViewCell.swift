//
//  AlbumsCollectionViewCell.swift
//  Photo-Album
//
//  Created by Serikzhan on 15.03.2023.
//

import UIKit

class AlbumsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "AlbumsCollectionViewCell"
    
    // MARK: - Outlets
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var imageCount: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(stack)
        stack.addArrangedSubview(image)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(imageCount)
    }
    
    private func setupLayout() {
        stack.snp.makeConstraints {
            $0.left.top.right.bottom.equalTo(contentView)
        }
    }
    
    override func prepareForReuse() {
        self.image.image = nil
        self.title.text = nil
        self.imageCount.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell AlbumsCollectionViewCell")
    }
}
