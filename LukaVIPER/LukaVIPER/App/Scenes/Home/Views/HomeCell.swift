//
//  HomeCell.swift
//  LukaVIPER
//
//  Created by Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
  typealias ViewModel = (title: String?, subtitle: String?)
  
  private lazy var titleLabel = UILabel.autolayoutView()
  private lazy var subtitleLabel = UILabel.autolayoutView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension HomeCell {
  var title: String? {
    get { return titleLabel.text }
    set { titleLabel.text = newValue }
  }
  
  var subtitle: String? {
    get { return subtitleLabel.text }
    set { subtitleLabel.text = newValue }
  }
  
  func update(_ viewModel: ViewModel) {
    titleLabel.text = viewModel.title
    subtitleLabel.text = viewModel.subtitle
  }
}

// MARK: - Private Methods
private extension HomeCell {
  func setupViews() {
    setupTitleLabel()
    setupSubtitleLabel()
  }
  
  func setupTitleLabel() {
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints {
      $0.leading.top.trailing.equalToSuperview().inset(16)
    }
    titleLabel.font = .preferredFont(forTextStyle: .headline)
    titleLabel.setContentHuggingPriority(.required, for: .vertical)
  }
  
  func setupSubtitleLabel() {
    contentView.addSubview(subtitleLabel)
    subtitleLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(6)
      $0.leading.bottom.trailing.equalToSuperview().inset(16)
    }
    subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
  }
}
