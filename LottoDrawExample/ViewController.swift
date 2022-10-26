//
//  ViewController.swift
//  LottoDrawExample
// 
//  Created by yunseungwon on 2022/10/26.
//


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 해당 테이블의 섹션 개수 - 필수 메서드
    func numberOfSectionsInTableView(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 해당 섹션의 셀 개수 - 필수 메서드
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // 셀 생성과 반환 - 필수 메서드
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lottoCell", for: indexPath as IndexPath) as! LottoCell
        
        cell.number1.text = "1"
        cell.number2.text = "2"
        cell.number3.text = "3"
        cell.number4.text = "4"
        cell.number5.text = "5"
        cell.number6.text = "6"

        
        return cell
    }
    

}

