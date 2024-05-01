var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var app = require('../app');

/* GET users listing. */
const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "quan_li_bai_viet"
});

con.connect()
router.get('/', function (req, res, next) {
  let sql = 'select * from thongtinlienhe'
  con.query(sql, (err, footer) => {
    res.render('users/trangchu', { footer: footer });
  })
});

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

router.post('/contact',(req,res)=>{
  contact=req.body
  console.log(req.body)

  sql = `insert into lienhe(ten_lien_he,email,tieude,noi_dung) values('${contact.name}','${contact.email}','${contact.tieude}','${contact.message}') `
    con.query(sql, (err, result) => {
      res.redirect('/')
    })
})


module.exports = router;
