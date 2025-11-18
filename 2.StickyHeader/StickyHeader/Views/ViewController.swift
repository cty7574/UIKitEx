//
//  ViewController.swift
//  StickyHeader
//
//  Created by 멘태 on 11/17/25.
//

import UIKit

final class ViewController: UITableViewController {
    private lazy var backButton: UIBarButtonItem = .init(
        image: UIImage(systemName: "chevron.left"),
        style: .plain,
        target: self,
        action: nil
    )
    
    private lazy var moreButton: UIBarButtonItem = .init(
        image: UIImage(systemName: "ellipsis"),
        style: .plain,
        target: self,
        action: nil
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = moreButton
        navigationController?.navigationBar.tintColor = .black
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: HeaderView = .init()
        return header
    }
}
