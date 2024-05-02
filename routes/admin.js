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
router.get('/admin', function(req, res, next) {
  res.render('admin/layouts', { content: 'main.ejs' });
});
router.get('/admin&managercontact', function(req, res, next) {
  res.render('admin/layouts', { content: 'manager_contact.ejs' });
});
router.get('/admin&managerpost', function(req, res, next) {
  res.render('admin/layouts', { content: 'manager_post.ejs' });
});
router.get('/admin&managertopicpost', function(req, res, next) {
  res.render('admin/layouts', { content: 'manager_topic_post.ejs' });
});

//quản lý bài viết
router.get('/admin&quanlylienhe',(req,res)=>{
  res.render('admin/layouts',{content: 'quanlylienhe.ejs'});
});
router.get('/admin&quanlynewletter',(req,res)=>{
  res.render('admin/layouts',{content: 'quanlynewletter.ejs'});
});



module.exports = router;
