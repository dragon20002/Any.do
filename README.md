# iOS 프로그래밍 과목 기말 개인프로젝트

### Convert Android to iOS app
Any.do Android 앱을 iOS 앱으로 컨버팅한 일정관리 앱 입니다.

개발환경: Xcode 9.3-compatible, Swift 4<br>
타겟버전: iOS 9.3 이상

### 테마 변경
탭뷰 레이아웃으로 '작업', '달력', '설정' 탭으로 나눠져 있습니다.<p>
설정 탭에서 앱 전체 테마를 변경할 수 있습니다.<p>
![테마 변경](https://postfiles.pstatic.net/MjAxOTAxMTJfMTIw/MDAxNTQ3MjQ3MTE0MDQy.2JXpCG7ZsLrfLrT6ugfMNogFPNEy07ugwbgNfzB60RQg.yFPpHaKAjTSDVLfpLbIy-3hzQYTCht2sF-l0AOfjM9Ig.PNG.dragon20002/%ED%85%8C%EB%A7%88_%EB%B3%80%EA%B2%BD.png?type=w580)

### 작업순서 변경 & 완료된 작업 표시 & 작업 삭제
'작업' 탭에서는 할 일을 간단히 추가할 수 있습니다.<p>
길게 눌러 스크롤하여 작업순서를 변경할 수 있습니다.<p>
완료된 작업은 오른쪽으로 스와이핑하여 표시할 수 있습니다. 잘못 표시한 경우 왼쪽으로 스와이핑하면 표시가 해제됩니다.<p>
완료된 작업을 표시하면 오른쪽에 나타나는 삭제 아이콘을 눌러 작업을 삭제할 수 있습니다.<p>

### 작업 추가
'작업' 탭에서 우측 하단의 버튼으로 새로운 작업을 추가할 수 있습니다.<p>
미리 만들어진 작업명을 사용하거나 직접 작업명을 입력하여 작업을 추가할 수 있습니다.<p>

### 달력 선택 & 날짜 선택하면 알아서 스크롤
'달력' 탭에서는 상세한 일시를 입력할 수 있는 일정을 추가할 수 있습니다.<p>
달력을 왼쪽 또는 오른쪽으로 스와이핑하여 이전 달/다음 달 달력을 볼 수 있습니다.<p>
날짜를 선택하면 그 날의 첫번째 일정이 일정 목록의 가장 위에 오도록 알아서 스크롤됩니다.<p>
![달력](https://postfiles.pstatic.net/MjAxOTAxMTJfMTgg/MDAxNTQ3MjQ3MTE0MDM5.Q-aS3zXn8O7M6hDJ7er30_jSxsxe3nhewMErHzEBqIsg.z4jZHn1g7QkVFqcjv0X2Q6NciX65WsBVlZrnsEVoGpMg.PNG.dragon20002/%EB%8B%AC%EB%A0%A5_%EC%84%A0%ED%83%9D__%EB%82%A0%EC%A7%9C_%EC%84%A0%ED%83%9D%ED%95%98%EB%A9%B4_%EC%95%8C%EC%95%84%EC%84%9C_%EC%8A%A4%ED%81%AC%EB%A1%A4.png?type=w580)

### 일정 추가
'달력' 탭에서 우측 하단의 버튼으로 새로운 일정을 추가할 수 있습니다.<p>
이벤트 시간의 시작 일시는 현재 일시, 종료 일시는 현재 일시+30분으로 기본값으로 설정되어 있습니다. 시작 일시를 증가시키면 종료 일시도 알아서 함께 증가합니다. 종료 일시를 변경해도 시작 일시는 변경되지 않습니다.<p>
위치, 메모는 텍스트로 입력받고 알람 기능은 현재 미구현된 항목입니다.<p>
'달력' 탭에서 일정 목록의 일정을 터치하면 추가할 때 입력했던 내용들을 확인하거나 삭제할 수 있습니다.<p>
![일정](https://postfiles.pstatic.net/MjAxOTAxMTJfMjM3/MDAxNTQ3MjQ3MTE0MDM1.YRFOhNkp8DTN75OH1o2JxVz1l9X7V4BAK74Sg3XAaKcg.4LvHbACDioeTQzjMQCvDKwGN6mbxwHXrPwcUZM8rIQkg.PNG.dragon20002/%EC%9D%BC%EC%A0%95_%EC%B6%94%EA%B0%80.png?type=w580)
