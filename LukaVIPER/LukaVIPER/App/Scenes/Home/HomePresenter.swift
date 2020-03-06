//
//  HomePresenter.swift
//  LukaVIPER
//
//  Created Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import Foundation
import Model

protocol HomeViewPresentingLogic: class {
  func onViewLoaded()
  func onDidSelectItem(at indexPath: IndexPath)
}

class HomePresenter {
  var interactor: HomeBusinessLogic?
  weak private var view: HomeDisplayLogic?
  private let router: HomeRoutingLogic
  private let dataSource = HomeDataSource()
  
  init(interface: HomeDisplayLogic, interactor: HomeBusinessLogic?, router: HomeRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - HomeViewPresentingLogic
extension HomePresenter: HomeViewPresentingLogic {
  func onViewLoaded() {
    interactor?.loadTodos(completion: { [weak self] result in
      switch result {
      case .success(let todos):
        guard let strongSelf = self else { return }
        strongSelf.dataSource.setTodos(todos)
        strongSelf.view?.displayTodos(using: strongSelf.dataSource)
      }
    })
  }
  
  func onDidSelectItem(at indexPath: IndexPath) {
    guard let todo = dataSource.todo(at: indexPath) else { return }
    router.openTodoDetails(todo: todo)
  }
}
