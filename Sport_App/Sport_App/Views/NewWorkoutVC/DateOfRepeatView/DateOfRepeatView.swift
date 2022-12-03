//
//  DateOfRepeatView.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 02.12.2022.
//

import UIKit


class DateOfRepeatView: UIView {
   
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoMedium16()
        label.textColor = .specialGray
        label.text = "Date"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repeatDaysLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoMedium16()
        label.textColor = .specialGray
        label.text = "Repeat every 7 days"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.tintColor = .specialGreen
        picker.translatesAutoresizingMaskIntoConstraints = false
       return picker
    }()
    
    private let nameSwitch: UISwitch = {
        let nameSwitch = UISwitch()
        nameSwitch.isOn = true
        nameSwitch.onTintColor = .specialGreen
        nameSwitch.translatesAutoresizingMaskIntoConstraints = false
       return nameSwitch
    }()
    
    var dateStackView = UIStackView()
    var repeatStackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        
        datePicker.subviews[0].subviews[0].subviews[0].alpha = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
       backgroundColor = .specialBrown
        layer.cornerRadius = 10
        dateStackView = UIStackView(arrangedSubviews: [dateLabel,datePicker], axis: .horizontal, spacing: 10)
        addSubview(dateStackView)
        repeatStackView = UIStackView(arrangedSubviews: [repeatDaysLabel,nameSwitch], axis: .horizontal, spacing: 10)
        addSubview(repeatStackView)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
extension DateOfRepeatView{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 10),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        
        
        ])
        
        
        
        
        
        
        
        
        
    }
}
