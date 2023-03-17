//
//  AlbumCellHeader.swift
//  Photo-Album
//
//  Created by Serikzhan on 15.03.2023.
//

import UIKit
import SnapKit

class AlbumCellHeader: UICollectionReusableView {
    
    static let identifier = "AlbumCellHeader"
    
    // MARK: - Outlets
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell AlbumCellHeader")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(title)
    }
    
    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.bottom.leading.equalTo(self)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
}
