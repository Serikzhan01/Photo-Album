//
//  ViewController.swift
//  Photo-Album
//
//  Created by Serikzhan on 15.03.2023.
//

import UIKit
import SnapKit


class AlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    // MARK: - UI
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AlbumsCollectionViewCell.self, forCellWithReuseIdentifier: AlbumsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Альбомы"
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.left.bottom.right.equalTo(view)
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 2.5, bottom: 10, trailing: 2.5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalWidth(1 / 1.9 * 2))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(1)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 50, trailing: 5)
                
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                
                return sectionLayout
                
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 2.5, bottom: 5, trailing: 2.5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalWidth(1 / 1.9 * 2))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(1)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 50, trailing: 5)
                
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                
                return sectionLayout
                
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(44))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
                
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 10, bottom: 50, trailing: 10)
                
                return sectionLayout
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalWidth(1 / 1.2 * 2))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                
                layoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(1)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)
                
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                
                return sectionLayout
            }
            
            
        }
    }
    
    // MARK: - Actions
    
    
    // MARK: - UICollectionViewDataSource Extensions
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 5
        case 1:
            return 3
        default:
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCollectionViewCell.identifier, for: indexPath) as? AlbumsCollectionViewCell
            item?.image.image = UIImage(named: AlbumModel.modelsArray[indexPath.section][indexPath.row].image)
            item?.title.text = AlbumModel.modelsArray[indexPath.section][indexPath.row].title
            item?.imageCount.text = AlbumModel.modelsArray[indexPath.section][indexPath.row].title
            return item ?? UICollectionViewCell()
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCollectionViewCell.identifier, for: indexPath)
            cell.backgroundColor = .systemRed
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCollectionViewCell.identifier, for: indexPath)
            cell.backgroundColor = .systemBlue
            return cell
        }
        
    }
    
    
    //MARK: UICollectionViewDelegateFlowLayout Extension
    
}
