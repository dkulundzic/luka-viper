//
//  HomeRouter.swift
//  LukaVIPER
//
//  Created Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import UIKit
import Model

protocol HomeRoutingLogic: class {
  func openTodoDetails(todo: Todo)
}

protocol HomeRouterDelegate: class { }

class HomeRouter {
  weak var viewController: HomeViewController?
  weak var delegate: HomeRouterDelegate?
  
  static func createModule(delegate: HomeRouterDelegate?) -> HomeViewController {
    let view = HomeViewController(nibName: nil, bundle: nil)
    let interactor = HomeInteractor()
    let router = HomeRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = HomePresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - HomeRoutingLogic
extension HomeRouter: HomeRoutingLogic {
  func openTodoDetails(todo: Todo) {
    let todoDetailsScene = DetailsRouter.createModule(todo: todo, delegate: self)
    viewController?.navigationController?.pushViewController(todoDetailsScene, animated: true)
  }
}

// MARK: - DetailsRouterDelegate
extension HomeRouter: DetailsRouterDelegate {
  func detailsRouterDidEditTodo(updatedTodo: Todo) {
    #warning("TODO: - ")
  }
}
