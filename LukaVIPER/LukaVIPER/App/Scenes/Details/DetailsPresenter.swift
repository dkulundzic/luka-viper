//
//  DetailsPresenter.swift
//  LukaVIPER
//
//  Created Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import Foundation
import Model

protocol DetailsViewPresentingLogic: class { }

class DetailsPresenter {
  var interactor: DetailsBusinessLogic?
  weak private var view: DetailsDisplayLogic?
  private let router: DetailsRoutingLogic
  private let todo: Todo
  
  init(todo: Todo, interface: DetailsDisplayLogic, interactor: DetailsBusinessLogic?, router: DetailsRoutingLogic) {
    self.todo = todo
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - DetailsViewPresentingLogic
extension DetailsPresenter: DetailsViewPresentingLogic { }
