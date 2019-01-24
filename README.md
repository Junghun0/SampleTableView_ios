### SampleTableView_ios
---
  1. subtitle 스타일 셀 TableView
  2. custom 타입 TableView
---
#### 소스코드

1. subtitle 스타일 셀 TableView 

    1_1. UITableViewController 를 상속받는 swift 파일 생성 및 연결
  
    1_2. 데이터소스 만들기
```swift
//데이터소스 만들기 vo -> value object
class MovieVO{
    var thumbnail: String?
    var title: String?
    var description: String?
    var detail: String?
    var opendate: String?
    var rating: Double?
}

```
  1_3. 데이터소스와 테이블 뷰 바인딩
  
  
```swift
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = row.title
        cell.detailTextLabel?.text = row.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)")
    }
}
```

  2. custom 타입 TableView 만들기
    2_1. 각 cell 의 label에 Tag값을 설정해 cell의 객체 참조하기
  ```swift
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        //테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        let title = cell.viewWithTag(101) as? UILabel
        let desc = cell.viewWithTag(102) as? UILabel
        let opendate = cell.viewWithTag(103) as? UILabel
        let rating = cell.viewWithTag(104) as? UILabel
        
        title?.text = row.title
        desc?.text = row.description
        opendate?.text = row.opendate
        rating?.text = "\(row.rating!)"

        return cell
    }
  ```
  
  2_2. 커스텀 클래스로 프로토타입 셀의 객체 제어하기
  
   1) 원하는 객체를 프로토타입 셀에 추가한다.
      
   2) MovieCell 클래스에 아울렛 변수를 등록한다.
      
   3) ListViewController 클래스에서 아울렛 변수를 제어한다.


 ```swift
    class MovieCell: UITableViewCell{
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var opendate: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var title: UILabel!
  }```
  
  ```swift
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
        
        return cell
    }```
