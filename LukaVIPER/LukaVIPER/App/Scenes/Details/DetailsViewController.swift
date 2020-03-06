//
//  DetailsViewController.swift
//  LukaVIPER
//
//  Created Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import UIKit

protocol DetailsDisplayLogic: class { }

class DetailsViewController: UIViewController {
  var presenter: DetailsViewPresentingLogic?
  private lazy var contentView = DetailsContentView.autolayoutView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - DetailsDisplayLogic
extension DetailsViewController: DetailsDisplayLogic { }

private extension DetailsViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
  }
}
