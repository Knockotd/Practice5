//
//  ViewController.swift
//  JSONParsing
//
//  Created by 503-26 on 19/11/2018.
//  Copyright © 2018 TheJoeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //저자 이름과 제목을 저장할 배열
    var titles : [String] = [String]()
    var authors : [String] = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //데이터를 다운로드 받을 URL을 생성
        let url = URL(string: "https://apis.daum.net/search/book?apikey=465b06fae32febacbc59502598dd7685&q=java&output=json")
        //웹의 데이터를 다운로드
        let data = try! Data(contentsOf: url!);
        //Value of optional type 'URL?' must be unwrapped to a value of type 'URL'
        //unwrapped라는 말이 나오면 !를 해준다.
        //try! 예외를 처리하지 않겠다.
        //try만 쓴 경우에는 do{try}catch{} 이렇게 코드를 써야 한다.
        
        
        //다운로드 받은 데이터가 JSON 형식이라면 파싱해서 디셔너리로 변환
        let result = try! JSONSerialization.jsonObject(with:data, options:[]) as! NSDictionary
        //파싱을 하자 마자 출력하면 한글이 디코딩이 안되서 출력될 수 있습니다.
        //channel 키의 값을 디셔너리로 가져오기
        let channel = result["channel"] as! NSDictionary
        //item 키의 값을 배열로 가져오기
        let items = channel["item"] as! NSArray
        //배열은 반복문으로 순회
        for index in 0...(items.count - 1){
            //데이터를 가져오기
            let item = items[index] as! NSDictionary
            titles.append(item["title"] as! String)
            authors.append(item["author"] as! String)
        }
        print(titles)
        print(authors)
        
        tableView.dataSource = self
    }


}

//기능확장 - extension
extension ViewController : UITableViewDataSource{
    //행의 개수를 설정하는 메소드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return titles.count
    }
    //셀을 만들어주는 메소드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //셀을 만들기
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        //셀에 내용을 출력하기
        cell.textLabel!.text = "\(titles[indexPath.row]) - \(authors[indexPath.row])"

        return cell
    }
}

