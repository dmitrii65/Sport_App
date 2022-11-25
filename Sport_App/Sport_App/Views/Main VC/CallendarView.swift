//
//  CallendarView.swift
//  Sport_App
//
//  Created by Дмитрий Шмаков on 21.11.2022.
//

import UIKit


class CallendarView: UIView {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 3
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private let idCalendarCell = "idCalendarCell"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setContraints()
        setDelegates()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        addSubview(collectionView)
        collectionView.register(CalendarCollectionViewCell.self,
                                forCellWithReuseIdentifier: idCalendarCell)
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
    
    //MARK: UICollectionViewDataSource
    
    //@available(iOS 16.0, *)
    extension CallendarView: UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            7
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as? CalendarCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
    
    //MarkUICollectionViewDelegate
    extension CallendarView: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            print("TapCollectionCell")
        }
    }
    
    //Mark UICollectionViewDelegateFlowLayout
    
    extension CallendarView: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: collectionView.frame.width / 8, height: collectionView.frame.height)
        }
    }
    
    extension CallendarView{
        private func setContraints() {
            
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ])
        }
        
    }
