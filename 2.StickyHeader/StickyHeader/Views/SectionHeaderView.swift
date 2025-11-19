//
//  SectionHeaderView.swift
//  StickyHeader
//
//  Created by 멘태 on 11/19/25.
//

import UIKit

final class SectionHeaderView: UIView {
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }
}
