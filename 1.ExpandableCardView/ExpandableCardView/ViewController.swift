//
//  ViewController.swift
//  ExpandableCardView
//
//  Created by 멘태 on 11/5/25.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tv: UITableView = UITableView()
        tv.backgroundColor = .clear
        tv.isScrollEnabled = false
        tv.separatorStyle = .none
        tv.backgroundColor = .red
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

#Preview {
    ViewController()
}
