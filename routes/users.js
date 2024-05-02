var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var app = require('../app');

/* GET users listing. */
const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "quan_ly_bai_viet"
});

con.connect()
//xử lý req vào trang chủ
router.get('/', function (req, res, next) {
  let sql = 'select * from thongtinlienhe'
  let listBaiVietMoiNhat, listBaiVietXemNhieuNhat 

  //3 bài viết mới nhất
  con.query('select * from baiviet order by ngay_dang desc limit 3', (err,result)=>{
    listBaiVietMoiNhat = result
    //3 bài viết xem nhiều nhất
    con.query('select * from baiviet order by luot_xem desc limit 3',(err,resultDSBV)=>{
      listBaiVietXemNhieuNhat = resultDSBV
      con.query('select ten_danh_muc from danhmucbaiviet',(err,resultDanhMucBaiViet)=>{
          con.query('select ten_danh_muc, baiviet.* from danhmucbaiviet inner join baiviet on danhmucbaiviet.id = baiviet.danh_muc',(err,resultBaiViet)=>{
            con.query('select * from thongtinlienhe',(err,resultTTLH)=>{
              res.render('users/layout',{moinhat: listBaiVietMoiNhat, xemnhieunhat: listBaiVietXemNhieuNhat, danhmuc: resultDanhMucBaiViet, danhSachBaiViet:resultBaiViet,footer:resultTTLH,content:'trangchu.ejs',title: 'Trang chủ'})
            })
          })
      })
    })
  })
 
  
});

//xử lý tăng lượt xem của bài viết
router.get('/chitietbaiviet/:id',(req,res)=>{
  let id = req.params.id
  let sql = `select * from baiviet where id = ${id}`
  con.query(sql,(err,result)=>{
      let luotXem = result[0].luot_xem + 1
      sql = `update baiviet set luot_xem = ${luotXem} where id = ${id}`
      con.query(sql,(err,resultUpdate)=>{
        res.redirect('/')
      })
  })
})
// xử lý req người dùng đăng kí
router.post('/dangki', (req, res) => {
  emailDangKi = req.body.emailDangKi
  let sql = `select id from dangky where email = '${emailDangKi}'`
  console.log(emailDangKi)
  con.query(sql, (err, result) => {
    if (result.length > 0) {
      console.log(result.length)
      res.json({ success: false });
    } else {
      sql = `insert into dangky(email) values ('${emailDangKi}')`
      con.query(sql, (err, result) => {
        res.json({ success: true });
      })
    }
  })
}
)

//gửi nội dung liên hệ
router.post('/contact',(req,res)=>{
  contact=req.body
  console.log(req.body)

  sql = `insert into lienhe(ten_lien_he,email,tieude,noi_dung) values('${contact.name}','${contact.email}','${contact.tieude}','${contact.message}') `
    con.query(sql, (err, result) => {
      res.redirect('/')
    })
})


module.exports = router;
