//
//  HomeViewController.swift
//  LukaVIPER
//
//  Created Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import UIKit
import Model

protocol HomeDisplayLogic: class {
  func displayTodos(using dataSource: HomeDataSource)
}

class HomeViewController: UIViewController {
  var presenter: HomeViewPresentingLogic?
  private lazy var contentView = HomeContentView.autolayoutView()
  private var dataSource: HomeDataSource?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    presenter?.onViewLoaded()
  }
}

// MARK: - HomeDisplayLogic
extension HomeViewController: HomeDisplayLogic {
  func displayTodos(using dataSource: HomeDataSource) {
    self.dataSource = dataSource
    contentView.collectionView.reloadData()
  }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return dataSource?.numberOfSections() ?? 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource?.numberOfItems(in: section) ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let item = dataSource?.item(at: indexPath) else { return UICollectionViewCell() }
    switch item {
    case .todo(let viewModel):
      let cell = collectionView.dequeueReusableCell(HomeCell.self, at: indexPath)
      cell.update(viewModel)
      return cell
    }
  }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.onDidSelectItem(at: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: 70)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}

private extension HomeViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    contentView.collectionView.dataSource = self
    contentView.collectionView.delegate = self
  }
}
