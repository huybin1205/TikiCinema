# Tiki Cinema
## Devloper: Trần Gia Huy
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)
## Thực trạng
> Bởi vì đại dịch COVID-19 đang lan rộng ra toàn cầu, chỗ ngồi trong rạp chiếu phim phải tuân thủ các quy tắc sau:
- Mọi người trong cùng một nhóm có thể ngồi cạnh nhau mà không bị hạn chế
- Các nhóm khác nhau phải có khoảng cách tối thiểu là x. Khoảng cách này  được xác định là khoảng cách Manhattan (không được phép di chuyển theo đường chéo)
## Mô tả
> Tìm cách để đảm bảo rằng khán giả xem phim tôn trọng sự giãn cách xã hội. Bạn được giao nhiệm vụ viết một dịch vụ gRPC hoặc Restful API mà có thể áp dụng để điều hành hoạt động rạp chiếu phim:
- Dịch vụ phải được định cấu hình để hỗ trợ kích thước rạp chiếu phim nhất định, có thể được chỉ định là: (hàng, cột)  (giả sử vị trí đầu tiên là (0, 0) ở trên cùng bên trái)
- Dịch vụ phải cho phép các hoạt động của rạp chiếu phim có thể sử dụng như sau:
- Truy vấn một bộ ghế hiện có sẵn để mua. 
- Đặt một hoặc một bộ các ghế (đi theo nhóm) ngẫu nhiên. Đầu vào sẽ là một số chỉ định số lượng chỗ ngồi là cần thiết (các ghế nên ở cùng nhau)
- Dịch vụ phải cho phép đặt trước một bộ ghế  theo chỉ định, trong đó chỗ ngồi được chỉ định bởi một tọa độ (hàng, cột)
- Đóng gói service thành image Docker

## Thời gian làm
- 23/10/2021 - 19/10/2021

## Thời gian thực tế làm
- 1 ngày


## Chức năng
- Hiển thị danh sách Cinema
- Hiển thị danh sách rạp phim
- Hiển thị danh sách phim
- Hiển thị số lượng chỗ ngồi theo từng rạp
- Gợi ý chỗ ngồi theo số lượng và khoảng cách Manhattan
- Đặt vé với vị trị gợi ý hoặc chọn thủ công (cá nhân, hoạc nhóm)
- Đăng nhập và đăng xuất với Authen

## Chức năng chưa thực hiện
- Đóng gói service thành image Docker

## Cài đặt

Tiki Cinema yêu cầu **[Node.js](https://nodejs.org/)** để chạy.
Cài đặt môi trường bằng cách
```sh
cd TikiCinema/server
npm i
nodemon bin/www
```
Database sử dụng **Microsoft SQL Server**
```sh
cd TikiCinema
execute TikiNow.sql
```

## Tài khoản đăng nhập ADMIN
```sh
username: admin
password: #$uper@dm1N!
```
**Xin cám ơn!**
