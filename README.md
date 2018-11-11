# iOS 프로그래밍 과목 기말 개인프로젝트

### Convert Android to iOS app
LinkedIn에서 개발한 Any.do Android 앱을 iOS 앱으로 컨버팅한 일정관리 앱 입니다.

개발환경: Xcode 9.3-compatible, Swift 4<br>
타겟버전: iOS 9.3 이상

### 테마 변경
탭뷰 레이아웃으로 '작업', '달력', '설정' 탭으로 나눠져 있습니다.<p>
설정 탭에서 앱 전체 테마를 변경할 수 있습니다.<p>
![테마 변경](http://postfiles6.naver.net/MjAxODExMTFfODUg/MDAxNTQxOTEyOTMyMDk0.d_FaIq4o7V5g8oKB8MFMcrIJz--DVqNhKvQ5N0fobm4g.1IelLud63XQgJqzR2RfZT15UJJBPnGwQj0Czbe5jCAIg.PNG.dragon20002/1.png?type=w580)

### 작업순서 변경 & 완료된 작업 표시 & 작업 삭제
'작업' 탭에서는 할 일을 간단히 추가할 수 있습니다.<p>
길게 눌러 스크롤하여 작업순서를 변경할 수 있습니다.<p>
완료된 작업은 오른쪽으로 스와이핑하여 표시할 수 있습니다. 잘못 표시한 경우 왼쪽으로 스와이핑하면 표시가 해제됩니다.<p>
완료된 작업을 표시하면 오른쪽에 나타나는 삭제 아이콘을 눌러 작업을 삭제할 수 있습니다.<p>
![작업순서 변경](http://postfiles1.naver.net/MjAxODExMTFfMjI5/MDAxNTQxOTEyOTMyMDgw.inQZFbgS-WaZEPH5M6pDU8VdVyg2ZPAobVXDbZ8sE8og.Ct_VD5FhBeQ_LKa0eb_15kdUcBH7nOW4-LmKDBUA5uUg.PNG.dragon20002/IMG_0007.PNG?type=w580)

### 작업 추가
'작업' 탭에서 우측 하단의 버튼으로 새로운 작업을 추가할 수 있습니다.<p>
미리 만들어진 작업명을 사용하거나 직접 작업명을 입력하여 작업을 추가할 수 있습니다.<p>
![작업 추가](http://postfiles6.naver.net/MjAxODExMTFfMTQz/MDAxNTQxOTEyOTgyNjg2.YRoYh6wiucLab8XDGmY4FSv8zTMpQ8jpTJ1Q0LbBiNMg.2yCqLZKKocRTQnbyDw0JFOR56eMHEK9hY3kGGpLl4JIg.PNG.dragon20002/image_2692021711541912936270.png?type=w580)

### 달력 선택 & 날짜 선택하면 알아서 스크롤
'달력' 탭에서는 상세한 일시를 입력할 수 있는 일정을 추가할 수 있습니다.<p>
달력을 왼쪽 또는 오른쪽으로 스와이핑하여 이전 달/다음 달 달력을 볼 수 있습니다.<p>
날짜를 선택하면 그 날의 첫번째 일정이 일정 목록의 가장 위에 오도록 알아서 스크롤됩니다.<p>
![달력](http://postfiles12.naver.net/MjAxODExMTFfMTkx/MDAxNTQxOTEyOTMyMDg5.Qq2SLODsfOCuKLrq8n_ahisD2qbiWoY14Jls3eMapnQg.T7o7IOgN_xCghrztxrWVpqmeB4wh9g4jHvFilEvcupYg.PNG.dragon20002/IMG_0013.PNG?type=w580)

### 일정 추가
'달력' 탭에서 우측 하단의 버튼으로 새로운 일정을 추가할 수 있습니다.<p>
이벤트 시간의 시작 일시는 현재 일시, 종료 일시는 현재 일시+30분으로 기본값으로 설정되어 있습니다. 시작 일시를 증가시키면 종료 일시도 알아서 함께 증가합니다. 종료 일시를 변경해도 시작 일시는 변경되지 않습니다.<p>
위치, 메모는 텍스트로 입력받고 알람 기능은 현재 미구현된 항목입니다.<p>
'달력' 탭에서 일정 목록의 일정을 터치하면 추가할 때 입력했던 내용들을 확인하거나 삭제할 수 있습니다.<p>
![일정](http://postfiles1.naver.net/MjAxODExMTFfNDMg/MDAxNTQxOTEyOTMyMDkz.rXXvoVG4e14dNQ-231vZhFo67w2jnj1SB6D5-w7dUi8g.WS-JZq7uGqzWsZPLEf1GhoW9JcfpFfoQmT7GRKdihN0g.PNG.dragon20002/IMG_0017.PNG?type=w580)
