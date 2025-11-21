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
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var allSubViews: [UIView] {
        return [tableView, stickyHeaderView]
    }
    
    private var statusBarHeight: CGFloat {
        return view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    private var stickyHeaderIsShow: Bool = false
    
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
    
    private func showStickyHeaderView() {
        guard !stickyHeaderIsShow else { return }
        
        stickyHeaderIsShow = true
        stickyHeaderView.backgroundColor = .white
        stickyHeaderView.titleLabel.text = "Apple Foods"
        stickyHeaderView.subTitleLabel.text = "Order Again"
    }
    
    private func hideStickyHeaderView() {
        guard stickyHeaderIsShow else { return }
        
        stickyHeaderIsShow = false
        stickyHeaderView.backgroundColor = .clear
        stickyHeaderView.titleLabel.text = ""
        stickyHeaderView.subTitleLabel.text = ""
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY: CGFloat = scrollView.contentOffset.y
        
        if let tableHeader = tableView.tableHeaderView as? TableHeaderView {
            if contentOffsetY < 0 {
                tableHeader.imageTopConstraint.constant = scrollView.contentOffset.y
                tableHeader.imageHeightConstraint.constant = tableHeader.originalImageHeight + abs(contentOffsetY)
            } else {
                tableHeader.imageTopConstraint.constant = 0
                tableHeader.imageHeightConstraint.constant = tableHeader.originalImageHeight
            }
            updateHeaderLayout()
        }
        
        
        if stickyHeaderView.frame.height - contentOffsetY < 50 {
            showStickyHeaderView()
        } else {
            hideStickyHeaderView()
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
