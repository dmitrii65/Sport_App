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
        sliderSets.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
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
        sliderSets.addTarget(self, action: #selector(sliderRepsChanged), for: .valueChanged)
        sliderSets.translatesAutoresizingMaskIntoConstraints = false
       return sliderSets
    }()
    
    private let timerLabel = UILabel(text:"Timer",font: .robotoMedium18(), textColor: .specialGray)
    private let numberTimeLabel = UILabel(text:"0 sec",font: .robotoMedium24(), textColor: .specialGray)
   
    private lazy var sliderTimer: UISlider = {
        let sliderSets = UISlider()
        sliderSets.maximumValue = 5000
        sliderSets.minimumValue = 0
        sliderSets.maximumTrackTintColor = .specialLightBrown
        sliderSets.minimumTrackTintColor = .specialGreen
        sliderSets.addTarget(self, action: #selector(sliderTimerChanged), for: .valueChanged)
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
    
    @objc private func setsSliderChanged() {
        numberSetsLabel.text = "\(Int(sliderSets.value))"
    }
    @objc private func sliderRepsChanged() {
        numberRepeatLabel.text = "\(Int(sliderReps.value))"
        setNegative(label: timerLabel, numberLabel: numberTimeLabel, slider: sliderTimer)
        setActive(label: repsLabel, numberLabel: numberRepeatLabel, slider: sliderReps)
    }
    
    @objc private func sliderTimerChanged() {
        let (min, sec) = { (secs: Int)-> (Int, Int) in
         return (secs / 60,  secs % 60)}(Int(sliderTimer.value))
         
        numberTimeLabel.text = (sec != 0 ? "\(min) min \(sec) sec" : "\(min) min")
         
        setNegative(label: repsLabel, numberLabel: numberRepeatLabel, slider: sliderReps)
        setActive(label: timerLabel, numberLabel: numberTimeLabel, slider: sliderTimer)
         
         
    }
    private func setNegative(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        label.alpha = 0.5
        numberLabel.alpha = 0.5
        numberLabel.text = "0"
        slider.alpha = 0.5
        slider.value = 0
    }
    private func setActive( label: UILabel, numberLabel: UILabel, slider: UISlider){
        label.alpha = 1
        numberLabel.alpha = 1
        slider.alpha = 1
        
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
