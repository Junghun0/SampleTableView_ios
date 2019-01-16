### SampleTableView_ios
---
  1. subtitle 스타일 셀 TableView
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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
    
