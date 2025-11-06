//
//  ViewController.swift
//  ExpandableCardView
//
//  Created by 멘태 on 11/5/25.
//

import UIKit

final class ViewController: UIViewController {
    private var viewModel: ViewModel = ViewModel()
    
    private lazy var tableView: UITableView = {
        let tv: UITableView = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.delaysContentTouches = false
        tv.register(ExpandableCardCell.self, forCellReuseIdentifier: "CardCell")
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExpandableCardCell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as? ExpandableCardCell else { return UITableViewCell() }
        
        cell.card = viewModel.cards[indexPath.row]
        cell.onExpandTapped = { [weak self] in
            self?.viewModel.cards[indexPath.row].isExpand.toggle()
            
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
        return cell
    }
}

#Preview {
    ViewController()
}
