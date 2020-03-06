//
//  DetailsRouter.swift
//  LukaVIPER
//
//  Created Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import UIKit
import Model

protocol DetailsRoutingLogic: class {
  func notifyDidEditTodo(updatedTodo: Todo)
}

protocol DetailsRouterDelegate: class {
  func detailsRouterDidEditTodo(updatedTodo: Todo)
}

class DetailsRouter {
  weak var viewController: DetailsViewController?
  weak var delegate: DetailsRouterDelegate?
  
  static func createModule(todo: Todo, delegate: DetailsRouterDelegate?) -> DetailsViewController {
    let view = DetailsViewController(nibName: nil, bundle: nil)
    let interactor = DetailsInteractor()
    let router = DetailsRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = DetailsPresenter(todo: todo, interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - DetailsRoutingLogic
extension DetailsRouter: DetailsRoutingLogic {
  func notifyDidEditTodo(updatedTodo: Todo) {
    delegate?.detailsRouterDidEditTodo(updatedTodo: updatedTodo)
  }
}
