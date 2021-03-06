//
//  ListViewController.swift
//  SampleTableView
//
//  Created by 박정훈 on 15/01/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController{
    
    //튜플 아이템으로 구성된 데이터 세트
    var dataset = [
        ("다크 나이트","영웅물에 철학에 음악까지 더해져 예술이 되다.","2008-09-04", 8.95 ),
        ("호우시절","때를 알고 내리는 좋은 비","2009-10-08",7.31),
        ("말할 수 없는 비밀","여기서 너까지 다섯 걸음","2015-05-07",9.19)
    ]
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        for(title , desc , opendate , rating) in self.dataset{
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    //테이블 뷰의 행의 개수를 리턴
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        //데이터 소스에 저장된 값을 각 아울렛 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
//
//        let title = cell.viewWithTag(101) as? UILabel
//        let desc = cell.viewWithTag(102) as? UILabel
//        let opendate = cell.viewWithTag(103) as? UILabel
//        let rating = cell.viewWithTag(104) as? UILabel
//
//        title?.text = row.title
//        desc?.text = row.description
//        opendate?.text = row.opendate
//        rating?.text = "\(row.rating!)"
//
//        cell.textLabel?.text = row.title
//        cell.detailTextLabel?.text = row.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)")
    }
    
    //테이블 뷰를 구성할 리스트 데이터
    //var list = [MovieVO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 90
//        //첫번째 행
//        var mvo = MovieVO()
//        mvo.title = "다크나이트"
//        mvo.description = "영웅물에 철학에 음악까지 더해져 예술이 되다."
//        mvo.opendate = "2008-09-04"
//        mvo.rating = 8.95
//        //배열에 추가
//        self.list.append(mvo)
//
//        //두번째 행
//        mvo = MovieVO()
//        mvo.title = "호우시절"
//        mvo.description = "때를 알고 내리는 좋은 비"
//        mvo.opendate = "2009-10-08"
//        mvo.rating = 7.31
//        //배열에 추가
//        self.list.append(mvo)
//
//        //세번째 행
//        mvo = MovieVO()
//        mvo.title = "말할 수 없는 비밀"
//        mvo.description = "여기서 너까지 다섯 걸음"
//        mvo.opendate = "2015-05-07"
//        mvo.rating = 9.19
//        //배열에 추가
//        self.list.append(mvo)
    }
    
    
    
}
