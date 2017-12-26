//
//  ViewController.swift
//  hw9_poker1
//
//  Created by 建基吳 on 2017/12/26.
//

import UIKit
import GameplayKit
class ViewController: UIViewController {

    
    @IBOutlet weak var makerResult: UIImageView!
    
    @IBOutlet weak var playerResult: UIImageView!
    
    @IBOutlet weak var makerScoreText: UILabel!
    @IBOutlet weak var playerScoreText: UILabel!
    var makerScore = 100
    var playerScore = 100
    @IBAction func go(_ sender: Any) {
        //已經有人零分了
        if(makerScore==0 || playerScore==0){
            var title:String
            var msg="請重新開始"
            if(makerScore==0){
                title = "你已經贏了"
            }else{
                title = "你已經輸了"
            }
            let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let randomDistribution =  GKRandomDistribution(lowestValue: 1, highestValue: 6)
            let maker = randomDistribution.nextInt();
            let player = randomDistribution.nextInt();
            makerResult.image = UIImage(named:String(maker))
            playerResult.image = UIImage(named:String(player))
            
            if(maker > player){
                makerScore = makerScore + 10
                playerScore = playerScore - 10
            }else if(maker<player){
                makerScore = makerScore - 10
                playerScore = playerScore + 10
            }
            makerScoreText.text = String(makerScore)
            playerScoreText.text = String(playerScore)
        }
    }
    @IBAction func restart(_ sender: Any) {
        makerResult.image = nil
        playerResult.image = nil
        makerScore = 100
        playerScore = 100
        makerScoreText.text = String(makerScore)
        playerScoreText.text = String(playerScore)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

