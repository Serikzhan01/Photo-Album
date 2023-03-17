//
//  ViewController.swift
//  Photo-Album
//
//  Created by Serikzhan on 15.03.2023.
//

import UIKit
import SnapKit


class AlbumViewController: UIViewController, UICollectionViewDataSource,
                           UICollectionViewDelegate  {
    
    // MARK: - Outlets
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(AlbumsCollectionViewCell.self,
                                forCellWithReuseIdentifier: AlbumsCollectionViewCell.identifier)
        collectionView.register(MediaFilesCell.self,
                                forCellWithReuseIdentifier: MediaFilesCell.identifier)
        collectionView.register(AlbumCellHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: AlbumCellHeader.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupNavbar()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Альбомы"
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.left.bottom.right.equalTo(view) }
    }
    
    func setupNavbar() {
        navigationItem.setLeftBarButton(UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "plus"),
            primaryAction: UIAction(handler: {_ in self.dismiss(animated: true)}),
            menu: nil), animated: true)
    }
    
    @objc
    func albumNavigationLeftButtonTapped(){
        print("Album navigation left button tapped")
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1/2.8))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 10, leading: 5, bottom: 20,trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/2.15),
                    heightDimension: .absolute(500))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,subitem: layoutItem, count: 2)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 10, leading: 10, bottom: 20, trailing: 10)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.98),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1/2.8)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 10, leading: 5, bottom: 20, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1/2.15),
                    heightDimension: .absolute(500))
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize, subitem: layoutItem, count: 2)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                layoutSection.contentInsets = NSDirectionalEdgeInsets(
                    top: 10,leading: 10, bottom: 20, trailing: 10)
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.98),
                    heightDimension: .estimated(40)
                )
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                   leading: 5,
                                                                   bottom: 20,
                                                                   trailing: 5)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(43)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                      leading: 10,
                                                                      bottom: 20,
                                                                      trailing: 0)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(40)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource Extensions
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AlbumModel.modelsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 5
        case 1:
            return 5
        case 2:
            return 9
        default:
            return 1
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
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCollectionViewCell.identifier, for: indexPath) as? AlbumsCollectionViewCell
            item?.image.image = UIImage(named: AlbumModel.modelsArray[indexPath.section][indexPath.row].image)
            item?.title.text = AlbumModel.modelsArray[indexPath.section][indexPath.row].title
            item?.imageCount.text = AlbumModel.modelsArray[indexPath.section][indexPath.row].title
            return item ?? UICollectionViewCell()
            
        case 2:
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediaFilesCell.identifier, for: indexPath) as? MediaFilesCell
            item?.image.image = UIImage(named: AlbumModel.modelsArray[indexPath.section][indexPath.row].image)
            item?.title.text = AlbumModel.modelsArray[indexPath.section][indexPath.row].title
            item?.imageCount.text = String(AlbumModel.modelsArray[indexPath.section][indexPath.row].imageCount ?? 0)
            item?.rightIcon.image = UIImage(systemName: "chevron.right")
            return item ?? UICollectionViewCell()
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumsCollectionViewCell.identifier, for: indexPath)
            cell.backgroundColor = .systemBlue
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumCellHeader.identifier, for: indexPath) as! AlbumCellHeader
            header.title.text = "Мои альбомы"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumCellHeader.identifier, for: indexPath) as! AlbumCellHeader
            header.title.text = "Общие альбомы"
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumCellHeader.identifier, for: indexPath) as! AlbumCellHeader
            header.title.text = "Типы медиафайлов"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumCellHeader.identifier, for: indexPath) as! AlbumCellHeader
            header.title.text = "Альбомы"
            return header
        }
    }
}
