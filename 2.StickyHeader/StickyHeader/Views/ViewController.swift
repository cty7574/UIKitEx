//
//  ViewController.swift
//  StickyHeader
//
//  Created by 멘태 on 11/17/25.
//

import UIKit

final class ViewController: UIViewController {
    private var viewModel: ViewModel = .init()
    
    private lazy var tableView: UITableView = {
        let tv: UITableView = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.tableHeaderView = TableHeaderView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private let stickyHeaderView: StickyHeaderView = {
        let view: StickyHeaderView = StickyHeaderView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var allSubViews: [UIView] {
        return [tableView, stickyHeaderView]
    }
    
    private var statusBarHeight: CGFloat {
        return view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeaderLayout()
        setConstraints()
    }
    
    private func setConstraints() {
        allSubViews.forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            stickyHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight),
            stickyHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stickyHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateHeaderLayout() {
        if let header = tableView.tableHeaderView {
            header.frame.size.height = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            tableView.tableHeaderView = header
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let tableHeader = tableView.tableHeaderView as? TableHeaderView {
            if scrollView.contentOffset.y < 0 {
                tableHeader.imageTopConstraint.constant = scrollView.contentOffset.y
                tableHeader.imageHeightConstraint.constant = tableHeader.originalImageHeight + abs(scrollView.contentOffset.y)
            } else {
                tableHeader.imageTopConstraint.constant = 0
                tableHeader.imageHeightConstraint.constant = tableHeader.originalImageHeight
            }
            updateHeaderLayout()
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader: SectionHeaderView = .init()
        sectionHeader.titleLabel.text = viewModel.sections[section]
        return sectionHeader
    }
}
