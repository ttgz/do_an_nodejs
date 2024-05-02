var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var app = require('../app');
const conn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "quan_ly_bai_viet"
});
conn.connect();
/* GET home page. */
router.get('/admin', function (req, res, next) {
  res.render('admin/layouts', { content: 'main.ejs' });
});
//quản lý bài viết
router.get('/admin&managerpost', function (req, res, next) {
  conn.query("select baiviet.* , ten_danh_muc from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id", (err, result) => {
    res.render('admin/layouts', { content: 'manager_post.ejs', baiviet: result });
  });
});
// quản lý danh mục bài viêt
router.get('/admin&managertopicpost', function (req, res, next) {
  conn.query("select * from danhmucbaiviet", (err, result) => {
    res.render('admin/layouts', { content: 'manager_topic_post.ejs', danhmuc : result });
  });
});
// Xuất giao diện thêm danh mục bài viết
router.get('/admin&add&danhmuc', function (req, res, next) {
    res.render('admin/layouts', { content: 'add_danhmuc_bai_viet.ejs' });
});
// thêm danh mục bài viết mới
router.post('/add&danhmuc', function (req, res, next) {
  let ten_danh_muc = req.body.tendanhmuc;
  conn.query(`Insert into danhmucbaiviet (ten_danh_muc) values(N'${ten_danh_muc}')`, (err) => {
    res.redirect("/admin&managertopicpost");
  });
});
// về trang danh mục bài viết
router.get('/admin&edittopic/admin&managertopicpost', function (req, res, next) {
  res.redirect("/admin&managertopicpost");
});
// truy xuất danh mục bài viết theo id
router.get('/admin&edittopic/:id', function (req, res, next) {
  let id = req.params.id;
  conn.query(`Select * from danhmucbaiviet where id = ${id}`, (err, result) => {
    res.render('admin/layouts', { content: 'edit_danhmuc_bai_viet.ejs', danhmuc : result[0] });
  });
});
// cập nhật danh mục bài viết theo id
router.post('/editdanhmuc', function (req, res, next) {
  let id = req.body.id;
  let ten_danh_muc = req.body.ten_danh_muc;
  conn.query(`UPDATE danhmucbaiviet SET ten_danh_muc = N'${ten_danh_muc}' where id = ${id}`, (err) => {
    res.redirect("/admin&managertopicpost");
  });
});
// xóa danh mục bài viết theo id
router.get('/admin&deltopic/:id', function (req, res, next) {
  let id = req.params.id;
  conn.query(`DELETE from danhmucbaiviet where id = ${id}`, (err, result) => {
    res.redirect("/admin&managertopicpost");
  });
});
//quản lý lien he 
router.get('/admin&quanlylienhe', (req, res) => {
  let sql = "select * from lienhe where trang_thai_duyet='chờ duyệt'"
  conn.query(sql, (err, rs) => {
    conn.query("select * from lienhe where trang_thai_duyet='đã duyệt'", (err, resultdaduyet) => {
      res.render('admin/layouts', { content: 'quanlylienhe.ejs', dslh: rs, dslhdd: resultdaduyet });
      console.log(rs, resultdaduyet)
    })

  })
});

router.get('/admin&quanlynewletter', (req, res) => {
  let sql = "select * from dangky"
  conn.query(sql, (err, rs) => {
    console.log(rs)
    res.render('admin/layouts', { content: 'quanlynewletter.ejs', dsdk: rs });
  })
});

//duyệt liên hệ
router.get('/duyet/:id', (req, res) => {
  let id = req.params.id
  let sql = `update lienhe set trang_thai_duyet=N'đã duyệt'where id=${id}`
  conn.query(sql, (err, rs) => {
    res.redirect('/admin&quanlylienhe')
  })
})
//giao diện chỉnh sửa bài viết và bài viết cần sửa
router.get('/chinhsuathongtinbaiviet/:id', (req, res) => {
  let id = req.params.id
  conn.query(`select * from baiviet where id = ${id}`, (err, rs) => {
    res.render('admin/layouts', { content: 'chinhsuathongtinbaiviet.ejs', baiviet: rs[0] })
  })
})

//cập nhật bài viết
router.post('/capnhatbaiviet', (req, res) => {
  console.log(req.body)
  let id = req.body.id
  let sql = `update baiviet set tieu_de='${req.body.tieude}', noi_dung='${req.body.noidung}', tac_gia='${req.body.tacgia}',ngay_dang='${req.body.ngaydang}', trang_thai='${req.body.trangthai}', hinh_anh='${req.body.hinhanh}'where id=${id}`
  conn.query(sql, (err, rs) => {
    res.redirect('/admin&managerpost')
  })
})
module.exports = router;
