//
//  HomeContentView.swift
//  LukaVIPER
//
//  Created Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import UIKit
import SnapKit

class HomeContentView: UIView {
  private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).autolayoutView()
  
  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    return layout
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension HomeContentView {
  func setupViews() {
    setupCollectionView()
  }
  
  func setupCollectionView() {
    addSubview(collectionView)
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    collectionView.backgroundColor = .white
    collectionView.alwaysBounceVertical = true
    collectionView.register(HomeCell.self)
  }
}
