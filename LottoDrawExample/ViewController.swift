//
//  ViewController.swift
//  LottoDrawExample
// 
//  Created by yunseungwon on 2022/10/26.
//


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // tableView Outlet 생성
    @IBOutlet weak var tableView: UITableView!
    
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
        return lottoNumbers.count
    }
    
    // 셀 생성과 반환 - 필수 메서드
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lottoCell", for: indexPath as IndexPath) as! LottoCell
        
        let row: Int = indexPath.row
        
        cell.number1.text = "\(lottoNumbers[row][0])"
        cell.number2.text = "\(lottoNumbers[row][1])"
        cell.number3.text = "\(lottoNumbers[row][2])"
        cell.number4.text = "\(lottoNumbers[row][3])"
        cell.number5.text = "\(lottoNumbers[row][4])"
        cell.number6.text = "\(lottoNumbers[row][5])"
        return cell
    }
    
    
    
    // 이중배열 변수 추가
    var lottoNumbers = Array<Array<Int>>()
    
    // Draw action button
    @IBAction func doDraw(_ sender: UIBarButtonItem) {
        lottoNumbers = Array<Array<Int>>()
        
        var originalNumbers = Array(1 ... 45)
        var index = 0
        
        // 생성할 로또 번호 셀은 총 5개 // 총 5회의 로또 번호 생성 과정 반복
        for _ in 0 ... 4 {
            originalNumbers = Array(1 ... 45)
            var columnArray = Array<Int>()
            
            // 한 과정당 6개의 번호를 생성하기 위해 중첩 for 문 사용
            for _ in 0 ... 5 {
                // 랜덤번호 생성
                index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
                print("for 문 안에 originalNumbers[index]) : \(originalNumbers[index])")
                columnArray.append(originalNumbers[index])
            }
            // 추출한 번호들을 작은 숫자대로 배열 정렬 // sort 메서드 사용
            columnArray.sort(by: { $0 < $1 })
            lottoNumbers.append(columnArray)
            
        }
        // reloadData 메서드 호출
        tableView.reloadData()
    }
}

