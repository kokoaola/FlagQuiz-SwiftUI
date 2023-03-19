//
//  ViewController.swift
//  Project2
//
//  Created by koala panda on 2023/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCounter = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        //button1.layer.backgroundColor = UIColor.red.cgColor
        //button1.layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        countries.shuffle()
        askQuestion(action: nil)
        
        
    }
    
    
    func askQuestion(action: UIAlertAction!) {
        if questionCounter >= 10{
            finishGame()
            return
        }else{
            questionCounter += 1
        }
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "\(questionCounter). \(countries[correctAnswer].uppercased())(score:\(score))"
    }
    
    
    func finishGame(){
        let ac = UIAlertController(title: "Finish!", message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "New Game", style: .default, handler: askQuestion))
        present(ac, animated: true)
        questionCounter = 0
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {

        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            message = "score +1."
            score += 1
        } else {
            title = "Wrong!"
            message = "That’s the flag of \(countries[correctAnswer].uppercased()).\nscore -1"
            score -= 1
        }
        ///UIAlertController()では、画面の中央上にメッセージボックスをポップアップする.alertと、下からオプションをスライドして表示する.actionSheetの2種類のスタイルが用意されています。両者は似ていますが、Appleはユーザーに状況の変化を伝える場合は.alertを、選択肢の中から選んでもらう場合は.actionSheetを使うことを推奨しています。
        
        ///2行目は、UIAlertActionデータ型を使用して、アラートに「Continue」というボタンを追加し、それに「default」というスタイルを与えています。.default、.cancel、.destructiveという3つのスタイルがあります。これらがどのように見えるかはiOSによって異なりますが、ユーザーに微妙なユーザー・インターフェースのヒントを提供するため、適切に使用することが重要です。
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ///この行の最後には、handler: askQuestionというパラメータがあります。handlerパラメータは、クロージャ（ボタンがタップされたときに実行するコード）を探しています。この中にカスタムコードを書くこともできますが、今回のケースではボタンがタップされたときにゲームを続行させたいので、askQuestionを渡してiOSがaskQuestion()メソッドを呼び出すようにしました。
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        ///最後の行は present() を呼び出します。present() は、提示するビューコントローラと、提示をアニメーションさせるかどうかという 2 つのパラメータを受け取ります。オプションの第三パラメータは、プレゼンテーションのアニメーションが終了したときに実行される別のクロージャですが、ここでは必要ありません。最初のパラメータにはUIAlertControllerを送り、2番目のパラメータにはtrueを送ります。
        present(ac, animated: true)
    }
    
    
    



}

