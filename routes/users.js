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
let footer
//xử lý req vào trang chủ
router.get('/', function (req, res, next) {
  let listBaiVietMoiNhat, listBaiVietXemNhieuNhat 

  //3 bài viết mới nhất
  con.query('select * from baiviet where trang_thai = "hiển thị" order by ngay_dang desc limit 3', (err,result)=>{
    listBaiVietMoiNhat = result
    //3 bài viết xem nhiều nhất
    con.query('select * from baiviet where trang_thai = "hiển thị" order by luot_xem desc limit 3',(err,resultDSBV)=>{
      listBaiVietXemNhieuNhat = resultDSBV
      con.query('select ten_danh_muc from danhmucbaiviet',(err,resultDanhMucBaiViet)=>{
          con.query('select ten_danh_muc, baiviet.* from danhmucbaiviet inner join baiviet on danhmucbaiviet.id = baiviet.danh_muc where trang_thai = "hiển thị"',(err,resultBaiViet)=>{
            con.query('select * from thongtinlienhe',(err,resultTTLH)=>{
              res.render('users/layout',{moinhat: listBaiVietMoiNhat, xemnhieunhat: listBaiVietXemNhieuNhat, danhmuc: resultDanhMucBaiViet, danhSachBaiViet:resultBaiViet,footer:resultTTLH,content:'trangchu.ejs',title: 'Trang chủ'})
            })
          })
      })
    })
  })
 
  
});

//xử lý tăng lượt xem của bài viết và xem chi tiết bài viết và bình luận và bài viết liên quan
router.get('/chitietbaiviet/:id',(req,res)=>{
  let id = req.params.id
  let sql = `select baiviet.id,tieu_de,noi_dung,tac_gia, DATE_FORMAT(ngay_dang, '%d-%m-%Y') AS ngay_dang, hinh_anh, ten_danh_muc from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id where baiviet.id = ${id}`
  con.query(sql,(err,result)=>{
      let luotXem = result[0].luot_xem + 1
      sql = `update baiviet set luot_xem = ${luotXem} where id = ${id}`
      con.query(sql,(err,resultUpdate)=>{
        con.query('select * from thongtinlienhe',(err,footer)=>{
          con.query(`select email, noi_dung from binhluan where bai_viet = ${id}`,(err,binhluan)=>{
            con.query(`select baiviet.id,tieu_de,noi_dung,hinh_anh from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id where danhmucbaiviet.ten_danh_muc = '${result[0].ten_danh_muc}' and trang_thai = 'hiển thị' limit 4`,(err,bvlq)=>{
              res.render('users/layout',{content:'chitietbaiviet.ejs',title: result[0].tieu_de, noidung: result[0],footer:footer, dsbl:binhluan, bvlq:bvlq})
            })
          })         
        })      
      })
  })
})
//Thêm bình luận
router.post('/thembinhluan',(req,res)=>{
    con.query(`insert into binhluan(email,noi_dung,bai_viet) values ('${req.body.email}',N'${req.body.binhluan}',${req.body.id})`,(err,rs)=>{
      console.log(req.body)
      res.redirect(`/chitietbaiviet/${req.body.id}`)
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

  sql = `insert into lienhe(ten_lien_he,email,tieu_de,noi_dung) values('${contact.name}','${contact.email}','${contact.tieude}','${contact.message}') `
    con.query(sql, (err, result) => {
      res.redirect('/')
    })
})


module.exports = router;
