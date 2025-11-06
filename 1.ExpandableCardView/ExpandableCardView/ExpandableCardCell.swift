//
//  ExpandableCardCell.swift
//  ExpandableCardView
//
//  Created by 멘태 on 11/5/25.
//

import UIKit

final class ExpandableCardCell: UITableViewCell {
    var card: Card? {
        didSet {
            configure()
        }
    }
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let iv: UIImageView = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var profileStackView: UIStackView = {
        let st: UIStackView = UIStackView(arrangedSubviews: [titleLabel, profileImageView])
        st.axis = .horizontal
        st.spacing = 16
        st.distribution = .fill
        st.alignment = .fill
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    private let contentLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        guard let card = card else { return }
        
        titleLabel.text = card.title
        contentLabel.text = card.content
        profileImageView.image = UIImage(systemName: card.profileImage)
    }
    
    private func setConstraints() {
        contentView.addSubview(profileStackView)
        contentView.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            
            profileStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            profileStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            contentLabel.topAnchor.constraint(equalTo: profileStackView.bottomAnchor, constant: 16),
            contentLabel.leadingAnchor.constraint(equalTo: profileStackView.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: profileStackView.trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
