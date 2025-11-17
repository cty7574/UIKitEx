//
//  ViewController.swift
//  StickyHeader
//
//  Created by 멘태 on 11/17/25.
//

import UIKit

final class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: HeaderView = .init()
        return header
    }
}
