//
//  HomeDataSource.swift
//  LukaVIPER
//
//  Created by Domagoj Kulundzic on 06/03/2020.
//  Copyright © 2020 Martian & Machine. All rights reserved.
//

import UIKit
import Model

enum HomeDataSourceItem {
  case todo(HomeCell.ViewModel)
}

enum HomeDataSourceSection: SectionProtocol {
  case todos([HomeDataSourceItem])
  
  var items: [HomeDataSourceItem] {
    switch self {
    case .todos(let items):
      return items
    }
  }
}

class HomeDataSource: DataSourceProtocol {
  private(set) lazy var sections = [HomeDataSourceSection]()
  private var todos = [Todo]()
  
  init() {
    buildSections()
  }
}

extension HomeDataSource {
  func todo(at indexPath: IndexPath) -> Todo? {
    return todos[safe: indexPath.item]
  }
  
  func setTodos(_ todos: [Todo]) {
    self.todos = todos
    buildSections()
  }
}

private extension HomeDataSource {
  func buildSections() {
    sections.removeAll()
    let items: [HomeDataSourceItem] = todos
      .enumerated()
      .map { index, todo in
        let viewModel = HomeCell.ViewModel("Todo #\(index + 1)", "ID: \(todo.id)")
        return HomeDataSourceItem.todo(viewModel)
    }
    sections = [
      HomeDataSourceSection.todos(items)
    ]
  }
}
