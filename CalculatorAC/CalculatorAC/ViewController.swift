//
//  ViewController.swift
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    let TitleZero = UILabel()
    
    let buttonTitles = ["%", "+/-", "AC", "/", "7", "8", "9", "+", "6", "5", "4", "-", "3", "2", "1", "x"]
    let colors: [UIColor] = [UIColor(.gray), UIColor(.gray), UIColor(.gray), UIColor(.brown),UIColor(.blue), UIColor(.blue), UIColor(.blue), UIColor(.brown),UIColor(.blue), UIColor(.blue), UIColor(.blue), UIColor(.brown), UIColor(.blue), UIColor(.blue), UIColor(.blue), UIColor(.brown) ]
    
    let buttonWidth: CGFloat = 110
    let buttonHeight: CGFloat = 155
    let spacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleZero.text = "0"
        TitleZero.textColor = .white
        view.addSubview(TitleZero)
        
        TitleZero.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100) // Лейбл находится ниже верхней границы экрана
            make.right.equalToSuperview().offset(-10) // Лейбл смещен влево от правой границы экрана
        }
        
        ButtonCreatorFour(buttonTitles: buttonTitles)
        creatZeroButton(text: "0")
        
    }
    
    
    private  func ButtonCreatorFour(buttonTitles : [String]) {
        let numberOfRows = 4
        let numberOfColumns = 4
        
        let buttonWidth: CGFloat = 110
        let buttonHeight: CGFloat = 155
        let spacing: CGFloat = 10
        
        for (index, title) in buttonTitles.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = colors[index % colors.count]
            view.addSubview(button)
            
            
            let row = index / numberOfColumns
            let column = index % numberOfColumns
            
            button.snp.makeConstraints { make in
                make.width.equalTo(buttonWidth)
                make.height.equalTo(buttonHeight)
                make.top.equalToSuperview().offset(CGFloat(row) * (buttonHeight + 2) + 150)
                make.left.equalToSuperview().offset(CGFloat(column) * (buttonWidth + 2))
            }
            
        }
    }
    
    private func creatZeroButton(text: String) {
        let button = UIButton()
        let buttons = [".", "="]
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = colors[4]
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.width.equalTo(222)
            make.height.equalTo(155)
            make.bottom.equalToSuperview()// Кнопка прикреплена к нижней границе экрана
            make.left.equalToSuperview() // Кнопка центрирована горизонтально
        }
        
        
        for (index, title) in buttons.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = colors[index % colors.count]
            view.addSubview(button)
            
            
            let row = index / 2
            let column = index % 2
            
            button.snp.makeConstraints { make in
                make.width.equalTo(109)
                make.height.equalTo(buttonHeight)
                make.bottom.equalToSuperview().offset(CGFloat(row) * (buttonHeight + 2) )
                make.left.equalToSuperview().offset(CGFloat(column) * (buttonWidth + 2) + 225)
            }
            
        }
        
    }
    
    
}
