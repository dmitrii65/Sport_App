//
//  CellCallendarView.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 23.11.2022.
//

import UIKit


class CalendarCollectionViewCell: UICollectionViewCell {
    
    let dayAndWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "We"
        label.font = .robotoBold16()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfDay: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "07"
        label.font = .robotoBold20()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialYellow
                layer.cornerRadius = 10
                dayAndWeekLabel.textColor = .specialBlack
                numberOfDay.textColor = .specialDarkGreen
            }else{
                backgroundColor = .specialGreen
                dayAndWeekLabel.textColor = .white
                numberOfDay.textColor = .white
            }
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        addSubview(dayAndWeekLabel)
        addSubview(numberOfDay)
    }
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dayAndWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dayAndWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7)
        ])
        NSLayoutConstraint.activate([
            numberOfDay.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberOfDay.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        
        ])
    }
}

   
