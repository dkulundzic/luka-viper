//
//  HomeInteractor.swift
//  LukaVIPER
//
//  Created Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import Foundation
import System
import Model

protocol HomeBusinessLogic: class {
  func loadTodos(completion: (Result<[Todo], Never>) -> Void)
}

class HomeInteractor { }

// MARK: - HomeBusinessLogic
extension HomeInteractor: HomeBusinessLogic {
  func loadTodos(completion: (Result<[Todo], Never>) -> Void) {
    let todos = (1...10).map { Todo(id: $0.description) }
    completion(.success(todos))
  }
}
