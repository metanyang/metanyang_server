# API DOCS
--------
## 1. 후원 물품 목록 조회
- Method : GET
- URL : http://jinhyuk.me:3333/goods
- 요청 예시
  `curl -XGET 'http://jinhyuk.me:3333/goods`
- 응답 예시
```json
[
    {
        "id": 1,
        "name": "이불 및 담요",
        "description": "이불 및 담요",
        "created_at": "2018-09-01T16:12:32.418Z",
        "updated_at": "2018-09-01T16:12:32.422Z"
    },
    {
        "id": 2,
        "name": "사료 및 간식",
        "description": "사료 및 간식",
        "created_at": "2018-09-01T16:12:32.425Z",
        "updated_at": "2018-09-01T16:12:32.428Z"
    },
    {
        "id": 3,
        "name": "기타용품",
        "description": "기타용품",
        "created_at": "2018-09-01T16:12:32.433Z",
        "updated_at": "2018-09-01T16:12:32.437Z"
    }
]
```

## 2. 업체 목록 조회
- Method : GET
- URL : http://jinhyuk.me:3333/centers
- request parameter

| 파라미터 타입 | 필드명  | 필수여부 |
| ------------- | ------- | -------- |
| 쿼리 스트링   | good_id | 필수     |


- 요청 예시
  `curl -XGET 'http://jinhyuk.me:3333/centers?good_id=1`
- 응답 예시
```json
[
    {
        "id": 25,
        "name": "한국동물구조관리협회",
        "address": "경기도 양주시 남면 상수리 410-1",
        "phone": "031-867-9119",
        "description": null,
        "created_at": "2018-09-01T16:12:38.335Z",
        "updated_at": "2018-09-01T16:12:38.499Z",
        "center_id": "311316201100001",
        "num_cats": 1
    },
    {
    ....
    }
]
```

## 3. 후원하기
- Method : POST
- URL : http://jinhyuk.me:3333/sponserships
- request parameter

| 파라미터 타입 | 필드명    | 필수여부 | 설명         |
| ------------- | --------- | -------- | ------------ |
| body          | name      | 필수     | 이름         |
| body          | email     | 필수     | 이메일       |
| body          | good_id   | 필수     | 후원 물품 id |
| body          | center_id | 필수     | 보호 센터 id |
| body          | s_count   | 필수     | 갯수         |
| body          | s_weight  | 필수     | 무게         |


- 요청 예시
  `curl -XPOST 'http://jinhyuk.me:3333/sponserships`
- 응답 예시
```json
{
    "id": 4,
    "email": "jake89577@gmail.com",
    "good_id": 1,
    "center_id": 1,
    "received_at": null,
    "created_at": "2018-09-01T17:16:13.559Z",
    "updated_at": "2018-09-01T17:16:13.559Z",
    "name": null,
    "address": null,
    "s_count": null,
    "s_weight": null
}
```

## 3. 후원하기
- Method : POST
- URL : http://jinhyuk.me:3333/sponserships
- request parameter

| 파라미터 타입 | 필드명    | 필수여부 | 설명         |
| ------------- | --------- | -------- | ------------ |
| body          | name      | 필수     | 이름         |
| body          | email     | 필수     | 이메일       |
| body          | good_id   | 필수     | 후원 물품 id |
| body          | center_id | 필수     | 보호 센터 id |
| body          | s_count   | 필수     | 갯수         |
| body          | s_weight  | 필수     | 무게         |


- 요청 예시
  `curl -XPOST 'http://jinhyuk.me:3333/sponserships`
- 응답 예시
```json
{
    "id": 4,
    "email": "jake89577@gmail.com",
    "good_id": 1,
    "center_id": 1,
    "received_at": null,
    "created_at": "2018-09-01T17:16:13.559Z",
    "updated_at": "2018-09-01T17:16:13.559Z",
    "name": null,
    "address": null,
    "s_count": null,
    "s_weight": null
}
```

## 4. 후원 목록 조회
- Method : GET
- URL : http://jinhyuk.me:3333/centers/{id}/sponserships
- 요청 예시
  `curl -XGET 'http://jinhyuk.me:3333/centers/1/sponserships`
- 응답 예시
```json
[
    {
        "id": 1,
        "email": "jake89577@gmail.com",
        "good_id": 1,
        "center_id": 1,
        "received_at": null,
        "created_at": "2018-09-01T18:05:31.743Z",
        "updated_at": "2018-09-01T18:05:31.743Z",
        "name": null,
        "address": null,
        "s_count": null,
        "s_weight": null
    }
]
```

## 5. 후원 수신완료 체크
- Method : PUT
- URL : http://jinhyuk.me:3333/sponserships/{id}
- 요청 예시
  `curl -XPUT 'http://jinhyuk.me:3333/sponserships/1`
- 응답 예시
```json
{
    "id": 1,
    "received_at": "2018-09-01T18:09:31.875Z",
    "good_id": 1,
    "center_id": 1,
    "email": "jake89577@gmail.com",
    "created_at": "2018-09-01T18:05:31.743Z",
    "updated_at": "2018-09-01T18:09:31.880Z",
    "name": null,
    "address": null,
    "s_count": null,
    "s_weight": null
}
```
- 특이사항
  received_at이 변경됩니다.

## 후원자에게 감사 메세지 전달하기(메일)
- Method : POST

- URL : http://jinhyuk.me:3333/sponserships/{id}/results

- request parameter

  | 파라미터 타입 | 필드명  | 필수여부 | 설명   |
  | ------------- | ------- | -------- | ------ |
  | body(file)    | image   |          | 이미지 |
  | body          | content | 필수     | 이메일 |

- header
```
Content-Type: multipart/form-data; boundary=—-WebKitFormBoundary7MA4YWxkTrZu0gW

    --—-WebKitFormBoundary7MA4YWxkTrZu0gW
    Content-Disposition: form-data; name=”file”; filename=”captcha”
    Content-Type:

    --—-WebKitFormBoundary7MA4YWxkTrZu0gW
    Content-Disposition: form-data; name=”action”

    submit
    --—-WebKitFormBoundary7MA4YWxkTrZu0gW--

```
- 요청 예시
  `curl -XPOST 'http://jinhyuk.me:3333/sponserships/1/results`
- 응답 예시
```json
{
    "id": 37,
    "sponsership_id": 1,
    "image": "/uploads/YHWPANICDZGKLUEROVQM.jpg",
    "content": "안녕하세요!!",
    "created_at": "2018-09-01T19:42:54.056Z",
    "updated_at": "2018-09-01T19:42:54.056Z",
    "full_image": "http://jinhyuk.me:3333/uploads/YHWPANICDZGKLUEROVQM.jpg"
}
```
- 특이사항
  이미지 주소는 full_image를 통해서 확인해주세요!
