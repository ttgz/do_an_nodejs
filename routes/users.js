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
  con.query('select * from baiviet where trang_thai = "hiển thị" order by ngay_dang desc limit 3', (err, result) => {
    listBaiVietMoiNhat = result
    //3 bài viết xem nhiều nhất
    con.query('select * from baiviet where trang_thai = "hiển thị" order by luot_xem desc limit 3', (err, resultDSBV) => {
      listBaiVietXemNhieuNhat = resultDSBV
      con.query('select id,ten_danh_muc from danhmucbaiviet', (err, resultDanhMucBaiViet) => {
        con.query('select ten_danh_muc, baiviet.* from danhmucbaiviet inner join baiviet on danhmucbaiviet.id = baiviet.danh_muc where trang_thai = "hiển thị"', (err, resultBaiViet) => {
          con.query('select * from thongtinlienhe', (err, resultTTLH) => {
            res.render('users/layout', { moinhat: listBaiVietMoiNhat, xemnhieunhat: listBaiVietXemNhieuNhat, danhmuc: resultDanhMucBaiViet, danhSachBaiViet: resultBaiViet, footer: resultTTLH, content: 'trangchu.ejs', title: 'Trang chủ' })
          })
        })
      })
    })
  })


});

//xử lý tăng lượt xem của bài viết và xem chi tiết bài viết và bình luận và bài viết liên quan
router.get('/chitietbaiviet/:id', (req, res) => {
  let id = req.params.id
  let sql = `select baiviet.id,tieu_de,noi_dung,tac_gia, DATE_FORMAT(ngay_dang, '%d-%m-%Y') AS ngay_dang, hinh_anh, ten_danh_muc,luot_xem from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id where baiviet.id = ${id}`
  con.query(sql, (err, result) => {
    let luotXem = result[0].luot_xem + 1
    sql = `update baiviet set luot_xem = ${luotXem} where id = ${id}`
    con.query(sql, (err, resultUpdate) => {
      con.query('select * from thongtinlienhe', (err, footer) => {
        con.query(`select email, noi_dung from binhluan where bai_viet = ${id}`, (err, binhluan) => {
          con.query(`select baiviet.id,tieu_de,noi_dung,hinh_anh from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id where danhmucbaiviet.ten_danh_muc = '${result[0].ten_danh_muc}' and trang_thai = 'hiển thị' order by rand() limit 4`, (err, bvlq) => {
            con.query(`select id, ten_danh_muc from danhmucbaiviet`, (err, danhmuc) => {
              res.render('users/layout', { content: 'chitietbaiviet.ejs', title: result[0].tieu_de, noidung: result[0], footer: footer, dsbl: binhluan, bvlq: bvlq, danhmuc: danhmuc })
            })
          })
        })
      })
    })
  })
})
//Thêm bình luận
router.post('/thembinhluan', (req, res) => {
  con.query(`insert into binhluan(email,noi_dung,bai_viet) values ('${req.body.email}',N'${req.body.binhluan}',${req.body.id})`, (err, rs) => {
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
//danh sách bài viết theo danh mục được chọn
router.get('/danhsachbaiviet/:id', (req, res) => {
  console.log(req.params)
  con.query(`select * from baiviet where danh_muc = ${req.params.id} and trang_thai = 'hiển thị'`, (err, dsbv) => {
    con.query('select * from thongtinlienhe', (err, footer) => {
      con.query('select * from danhmucbaiviet', (err, dsdm) => {
        for (let i = 0; i < dsdm.length; i++) {
          if (dsdm[i].id == req.params.id) {
            console.log(dsdm[i].ten_danh_muc)
            res.render('users/layout', { title: dsdm[i].ten_danh_muc,content: 'danhsachbaiviet.ejs', dsbv: dsbv, footer: footer, danhmuc: dsdm, tendanhmuc: dsdm[i].ten_danh_muc })
          }
        }
      })
    })
  })

})
//gửi nội dung liên hệ
router.post('/contact', (req, res) => {
  contact = req.body
  sql = `insert into lienhe(ten_lien_he,email,tieu_de,noi_dung) values('${contact.name}','${contact.email}','${contact.tieude}','${contact.message}') `
  con.query(sql, (err, result) => {
    res.redirect('/')
  })
})
//chức năng tìm kiếm
router.get('/timkiem', (req, res) => {
  let link = req.query.keywords
  con.query('select * from thongtinlienhe', (err, footer) => {
    con.query('select * from danhmucbaiviet', (err, dmbv) => {
      if (req.query.option === 'tatcadanhmuc') {
        con.query(`SELECT baiviet.id, baiviet.tieu_de, baiviet.noi_dung, baiviet.hinh_anh FROM baiviet inner join danhmucbaiviet on baiviet.danh_muc=danhmucbaiviet.id  WHERE baiviet.tieu_de LIKE '%${link}%' and trang_thai = 'hiển thị'`, (err, result) => {
          if (result.length > 0) {
            res.render('users/layout', { title: 'Tìm kiếm',content: 'danhsachbaiviet.ejs', soluongketqua: result.length ,dsbv: result, footer: footer, danhmuc: dmbv })
          }
          else {
            res.render('users/layout', { title: 'Tìm kiếm',content: 'danhsachbaiviet.ejs', khongcobaiviet: 'Không tìm thấy bài viết liên quan', footer: footer, danhmuc: dmbv })
          }
        })
      }
      else {
        con.query(`SELECT baiviet.id, baiviet.tieu_de, baiviet.noi_dung, baiviet.hinh_anh FROM baiviet inner join danhmucbaiviet on baiviet.danh_muc=danhmucbaiviet.id  WHERE danhmucbaiviet.ten_danh_muc='${req.query.option}' and baiviet.tieu_de LIKE '%${link}%' and trang_thai = 'hiển thị'`, (err, result) => {
          if (result.length > 0) {
            res.render('users/layout', { content: 'danhsachbaiviet.ejs', soluongketqua: result.length,dsbv: result, footer: footer, danhmuc: dmbv })
          }
          else {
            res.render('users/layout', { content: 'danhsachbaiviet.ejs', khongcobaiviet: 'Không tìm thấy bài viết liên quan', footer: footer, danhmuc: dmbv })
          }
        })
      }
    })
  })
})

//Đăng nhập cho người dùng
 
module.exports = router;
