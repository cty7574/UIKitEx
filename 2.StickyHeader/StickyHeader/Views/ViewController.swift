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
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.tableHeaderView = headerView
        tv.contentInsetAdjustmentBehavior = .never
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private lazy var headerView: TableHeaderView = {
        let hv: TableHeaderView = TableHeaderView()
        return hv
    }()
    
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
        view.backgroundColor = .white
        setConstraints()
        setNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let header = tableView.tableHeaderView else { return }
        let headerHeight: CGFloat = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        if header.frame.height != headerHeight {
            header.frame.size.height = headerHeight
            tableView.tableHeaderView = header
        }
    }
    
    private func setConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setNavigationBar() {
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = moreButton
        navigationController?.navigationBar.tintColor = .black
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
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
