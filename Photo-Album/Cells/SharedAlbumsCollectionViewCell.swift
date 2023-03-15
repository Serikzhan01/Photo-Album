//
//  SharedAlbumsCollectionViewCell.swift
//  Photo-Album
//
//  Created by Serikzhan on 15.03.2023.
//

import UIKit

class SharedAlbumsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "AlbumsCollectionViewCell"
    
    // MARK: - Outlets
    
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("CompositionalCell Error")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        
    }
    
    private func setupLayout() {
        
    }
    
}

