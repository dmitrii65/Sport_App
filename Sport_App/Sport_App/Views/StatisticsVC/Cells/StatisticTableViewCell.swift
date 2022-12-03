//
//  StatisticTableViewCell.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 01.12.2022.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    private let differnceLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoMedium24()
        label.textColor = .specialGreen
        label.textAlignment = .right
        label.text = "+2"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let  nameSportLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let beforeLabel = UILabel(text: "Before 18")
    private let afterLabel = UILabel(text: "Now 20")
    
    private var stackView = UIStackView()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(differnceLabel)
        addSubview(nameSportLabel)
        
        stackView = UIStackView(arrangedSubviews: [beforeLabel,afterLabel], axis: .horizontal, spacing: 10)
        
        addSubview(stackView)
        addSubview(lineView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            differnceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            differnceLabel.widthAnchor.constraint(equalToConstant: 50),
            differnceLabel.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -10),
            differnceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
        ])
        
        NSLayoutConstraint.activate([
            nameSportLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameSportLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameSportLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameSportLabel.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
