//
//  RepsOrTimerView.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 02.12.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private lazy var sliderSets: UISlider = {
        let sliderSets = UISlider()
        sliderSets.maximumValue = 10
        sliderSets.minimumValue = 0
        sliderSets.maximumTrackTintColor = .specialLightBrown
        sliderSets.minimumTrackTintColor = .specialGreen
        sliderSets.translatesAutoresizingMaskIntoConstraints = false
       return sliderSets
    }()
    
    private let setsLabel = UILabel(text: "Sets", font: .robotoMedium18(), textColor: .specialGray)
    
    private let numberSetsLabel = UILabel(text: "0", font: .robotoBold24(), textColor: .specialGray)
    
    private let repeatTimerLabel = UILabel(text: "Choose repeat or timer")
    
    private let repsLabel = UILabel(text:"Reps",font: .robotoMedium18(), textColor: .specialGray)
    
    private let numberRepeatLabel = UILabel(text:"0", font: .robotoBold24(), textColor: .specialGray)
    
    private lazy var sliderReps: UISlider = {
        let sliderSets = UISlider()
        sliderSets.maximumValue = 10
        sliderSets.minimumValue = 0
        sliderSets.maximumTrackTintColor = .specialLightBrown
        sliderSets.minimumTrackTintColor = .specialGreen
        sliderSets.translatesAutoresizingMaskIntoConstraints = false
       return sliderSets
    }()
    
    private let timerLabel = UILabel(text:"Timer",font: .robotoMedium18(), textColor: .specialGray)
    private let numberTimeLabel = UILabel(text:"1 min 30 sec",font: .robotoMedium24(), textColor: .specialGray)
   
    private lazy var sliderTimer: UISlider = {
        let sliderSets = UISlider()
        sliderSets.maximumValue = 10
        sliderSets.minimumValue = 0
        sliderSets.maximumTrackTintColor = .specialLightBrown
        sliderSets.minimumTrackTintColor = .specialGreen
        sliderSets.translatesAutoresizingMaskIntoConstraints = false
       return sliderSets
    }()
    
    var setStackView = UIStackView()
    var repsStackView = UIStackView()
    var timerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setContstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        setStackView = UIStackView(arrangedSubviews: [setsLabel,numberSetsLabel], axis: .horizontal, spacing: 20)
        addSubview(setStackView)
        addSubview(sliderSets)
        addSubview(repeatTimerLabel)
        repsStackView = UIStackView(arrangedSubviews: [repsLabel, numberRepeatLabel], axis: .horizontal, spacing: 10)
        addSubview(repsStackView)
        addSubview(sliderReps)
        timerStackView = UIStackView(arrangedSubviews: [timerLabel, numberTimeLabel], axis: .horizontal, spacing: 10)
        addSubview(timerStackView)
        addSubview(sliderTimer)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
extension RepsOrTimerView {
    func setContstraints(){
        NSLayoutConstraint.activate([
            setStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            setStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            sliderSets.topAnchor.constraint(equalTo: setStackView.bottomAnchor, constant: 10),
            sliderSets.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            sliderSets.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            repeatTimerLabel.topAnchor.constraint(equalTo: sliderSets.bottomAnchor, constant: 15),
            repeatTimerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: repeatTimerLabel.bottomAnchor, constant: 10),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            sliderReps.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 10),
            sliderReps.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            sliderReps.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: sliderReps.bottomAnchor, constant: 20),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        NSLayoutConstraint.activate([
            sliderTimer.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 10),
            sliderTimer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            sliderTimer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
