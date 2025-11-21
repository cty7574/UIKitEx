//
//  StickyHeaderView.swift
//  StickyHeader
//
//  Created by 멘태 on 11/20/25.
//

import UIKit

final class StickyHeaderView: UIView {
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title2).pointSize, weight: .bold)
        label.text = "Apple Foods"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "Order Again"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        var config: UIButton.Configuration = .bordered()
        config.image = UIImage(systemName: "chevron.left")
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.background.strokeColor = .lightGray
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var moreButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        var config: UIButton.Configuration = .bordered()
        config.image = UIImage(systemName: "ellipsis")
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.background.strokeColor = .lightGray
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let st: UIStackView = UIStackView(arrangedSubviews: [backButton, titleLabel, moreButton])
        st.axis = .horizontal
        st.spacing = 16
        st.distribution = .fill
        st.alignment = .center
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private var allSubViews: [UIView] {
        return [stackView, subTitleLabel]
    }
    
    var viewHeight: CGFloat {
        return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        let height: CGFloat = subTitleLabel.frame.maxY + 8
        return CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
    
    private func setupUI() {
        allSubViews.forEach { self.addSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            subTitleLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.heightAnchor.constraint(equalTo: backButton.widthAnchor),
            
            moreButton.widthAnchor.constraint(equalTo: backButton.widthAnchor),
            moreButton.heightAnchor.constraint(equalTo: backButton.widthAnchor)
        ])
    }
}
