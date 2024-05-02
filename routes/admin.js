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
router.get('/admin&managercontact', function (req, res, next) {
  res.render('admin/layouts', { content: 'manager_contact.ejs' });
});
router.get('/admin&managerpost', function (req, res, next) {
  conn.query("select baiviet.* , ten_danh_muc from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id", (err, result) => {
    res.render('admin/layouts', { content: 'manager_post.ejs', baiviet: result});
  });

});
router.get('/admin&managertopicpost', function (req, res, next) {
  res.render('admin/layouts', { content: 'manager_topic_post.ejs' });
});

//quản lý lien he
router.get('/admin&quanlylienhe',(req,res)=>{
  let sql="select * from lienhe where trang_thai_duyet='chờ duyệt'"
  conn.query(sql,(err,rs)=>{
    conn.query("select * from lienhe where trang_thai_duyet='đã duyệt'",(err,resultdaduyet)=>{
      res.render('admin/layouts',{content: 'quanlylienhe.ejs',dslh:rs,dslhdd:resultdaduyet});
      console.log(rs,resultdaduyet)
    })
   
  })
});

router.get('/admin&quanlynewletter',(req,res)=>{
  let sql="select * from dangky"
  conn.query(sql,(err,rs)=>{
    console.log(rs)
    res.render('admin/layouts',{content:'quanlynewletter.ejs',dsdk:rs});
  })
});

//duyệt liên hệ
router.get('/duyet/:id',(req,res)=>{
    let id = req.params.id
    let sql=`update lienhe set trang_thai_duyet=N'đã duyệt'where id=${id}`
    conn.query(sql,(err,rs)=>{
      res.redirect('/admin&quanlylienhe')
    })
})

module.exports = router;
