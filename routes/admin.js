var express = require('express');
var router = express.Router();
const mysql = require('mysql');
const session = require('express-session');
router.use(session({
  secret: 'mySecretKey',
  resave: false,
  saveUninitialized: true
}));
const conn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "quan_ly_bai_viet"
});
conn.connect();
var status_login = false
/* GET home page. */
//login admin
router.get('/loginadmin', (req, res) => {
  if (status_login == false)
    res.render('admin/login_admin');
  else
    res.redirect('/admin');
});
router.post('/login', (req, res) => {
  let email = req.body.email;
  let pwd = req.body.password;
  let sql = `select email, password from account`;
  conn.query(sql, (err, result) => {
    for (i in result) {
      console.log(result[i].email, result[i].password);
      if (result[i].email == email && result[i].password == pwd) {
        status_login = true;
        break;
      }
    }
    res.redirect('/loginadmin');
  });
});
router.get('/admin', function (req, res, next) {
  if (status_login == true) {
    res.render('admin/layouts', { content: 'main.ejs' });
  }
  else
    res.redirect('/loginadmin');
});

// sign out
router.get('/admin&signout', function (req, res, next) {
  status_login = false;
  res.redirect("/");
});
// fix nguoi dung bam loan xa
router.get('/admin&edittopic/admin&managerpost', function (req, res, next) {
  res.redirect("/admin&managerpost");
});
router.get('/admin&edittopic/admin&quanlylienhe', function (req, res, next) {
  res.redirect("/admin&quanlylienhe");
});
router.get('/admin&edittopic/admin&quanlynewletter', function (req, res, next) {
  res.redirect("/admin&quanlynewletter");
});
router.get('/chinhsuathongtinbaiviet/admin&managertopicpost', function (req, res, next) {
  res.redirect("/admin&managertopicpost");
});
router.get('/chinhsuathongtinbaiviet/admin&quanlylienhe', function (req, res, next) {
  res.redirect("/admin&quanlylienhe");
});
router.get('/chinhsuathongtinbaiviet/admin&quanlynewletter', function (req, res, next) {
  res.redirect("/admin&quanlynewletter");
});



//quản lý bài viết
router.get('/admin&managerpost', function (req, res, next) {
  if (status_login == true) {
    conn.query("select baiviet.* , ten_danh_muc from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id", (err, result) => {
      conn.query("select * from danhmucbaiviet", (err, danhmuc) => {
        res.render('admin/layouts', { content: 'manager_post.ejs', baiviet: result, danhmuc: danhmuc });
      });
    });
  }
  else
    res.redirect('/loginadmin');
});
// chức năng search keywords
router.get('/search', (req, res) => {
  if (status_login == true) {
    var keywords = req.query.keywords;
    console.log(keywords);
    let sql = `select baiviet.* , ten_danh_muc from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id where baiviet.tieu_de like '%${keywords}%' ` + `or baiviet.tac_gia like '%${keywords}%'` + `or baiviet.ngay_dang like '%${keywords}%'`;
    conn.query(sql, (err, result) => {
      conn.query("select * from danhmucbaiviet", (err, danhmuc) => {
        if (result.length > 0) {
          res.render('admin/layouts', { content: 'manager_post.ejs', baiviet: result, danhmuc: danhmuc });
        }
        else {
          res.render('admin/layouts', { content: 'manager_post.ejs', baiviet: result, err: 'Yêu cầu không tìm thấy', danhmuc: danhmuc });
        }
      });
    });
  }
  else
    res.redirect('/loginadmin');
});
// chức năng search selectoption
router.get('/searchsl', (req, res) => {
  if (status_login == true) {
    var option = req.query.selectedOption;
    console.log(option);
    let sql = `select baiviet.*, ten_danh_muc from baiviet inner join danhmucbaiviet on baiviet.danh_muc = danhmucbaiviet.id where danhmucbaiviet.ten_danh_muc like '%${option}%'`;
    conn.query(sql, (err, result) => {
      conn.query("select * from danhmucbaiviet", (err, danhmuc) => {
        res.render('admin/layouts', { content: 'manager_post.ejs', baiviet: result, danhmuc: danhmuc, selected: result.ten_danh_muc });
      });
    });
  }
  else
    res.redirect('/loginadmin');
});

// trang danh mục bài viết
router.get('/admin&managertopicpost', function (req, res, next) {
  if (status_login == true) {
    conn.query("select * from danhmucbaiviet", (err, result) => {
      res.render('admin/layouts', { content: 'manager_topic_post.ejs', danhmuc: result });
    });
  }
  else
    res.redirect('/loginadmin');
});
// Xuất giao diện thêm danh mục bài viết
router.get('/admin&add&danhmuc', function (req, res, next) {
  if (status_login == true) {
    res.render('admin/layouts', { content: 'add_danhmuc_bai_viet.ejs' });
  }
  else
    res.redirect('/loginadmin');

});
// thêm danh mục bài viết mới
router.post('/add&danhmuc', function (req, res, next) {
  if (status_login == true) {
    let ten_danh_muc = req.body.tendanhmuc;
    conn.query(`Insert into danhmucbaiviet (ten_danh_muc) values(N'${ten_danh_muc}')`, (err) => {
      res.redirect("/admin&managertopicpost");
    });
  }
  else
    res.redirect('/loginadmin');
});
// về trang danh mục bài viết
router.get('/admin&edittopic/admin&managertopicpost', function (req, res, next) {
  if (status_login == true) {
    res.redirect("/admin&managertopicpost");
  }
  else
    res.redirect('/loginadmin');
});
// truy xuất danh mục bài viết theo id
router.get('/admin&edittopic/:id/', function (req, res, next) {
  if (status_login == true) {
    let id = req.params.id;
    conn.query(`Select * from danhmucbaiviet where id = ${id}`, (err, result) => {
      res.render('admin/layouts', { content: 'edit_danhmuc_bai_viet.ejs', danhmuc: result[0] });
    });
  }
  else
    res.redirect('/loginadmin');
});
// cập nhật danh mục bài viết theo id
router.post('/editdanhmuc', function (req, res, next) {
  if (status_login == true) {
    let id = req.body.id;
    let ten_danh_muc = req.body.ten_danh_muc;
    let result = req.body.ketqua;
    console.log(result);
    if (result == 'hien thi') {
      conn.query(`UPDATE danhmucbaiviet SET ten_danh_muc = N'${ten_danh_muc}' where id = ${id}`, (err) => {
        res.redirect("/admin&managertopicpost");
      });
    }
    else res.redirect("/admin&managertopicpost");
  }
  else
    res.redirect('/loginadmin');
});
// xóa danh mục bài viết theo id
router.get('/admin&deltopic/:id', function (req, res, next) {
  if (status_login == true) {
    let id = req.params.id;
    conn.query(`DELETE from danhmucbaiviet where id = ${id}`, (err, result) => {
      res.redirect("/admin&managertopicpost");
    });
  }
  else
    res.redirect('/loginadmin');
});

//quản lý lien he 
router.get('/admin&quanlylienhe', (req, res) => {
  if (status_login == true) {
    let sql = "select * from lienhe where trang_thai_duyet='chờ duyệt'"
    conn.query(sql, (err, rs) => {
      conn.query("select * from lienhe where trang_thai_duyet='đã duyệt'", (err, resultdaduyet) => {
        res.render('admin/layouts', { content: 'quanlylienhe.ejs', dslh: rs, dslhdd: resultdaduyet });
        console.log(rs, resultdaduyet)
      });
    });
  }
  else
    res.redirect('/loginadmin');
});

router.get('/admin&quanlynewletter', (req, res) => {
  if (status_login == true) {
    let sql = "select * from dangky"
    conn.query(sql, (err, rs) => {
      console.log(rs)
      res.render('admin/layouts', { content: 'quanlynewletter.ejs', dsdk: rs });
    });
  }
  else
    res.redirect('/loginadmin');
});

//duyệt liên hệ
router.get('/duyet/:id', (req, res) => {
  if (status_login == true) {
    let id = req.params.id
    let sql = `update lienhe set trang_thai_duyet=N'đã duyệt'where id=${id}`
    conn.query(sql, (err, rs) => {
      res.redirect('/admin&quanlylienhe')
    });
  }
  else
    res.redirect('/loginadmin');
});
//giao diện chỉnh sửa bài viết và bài viết cần sửa
router.get('/chinhsuathongtinbaiviet/:id', (req, res) => {
  if (status_login == true) {
    let id = req.params.id
    conn.query(`select * from baiviet where id = ${id}`, (err, rs) => {
      res.render('admin/layouts', { content: 'chinhsuathongtinbaiviet.ejs', baiviet: rs[0] });
    });
  }
  else
    res.redirect('/loginadmin');
});

//cập nhật bài viết
router.post('/capnhatbaiviet', (req, res) => {
  if (status_login == true) {
    console.log(req.body)
    let id = req.body.id
    let sql = `update baiviet set tieu_de='${req.body.tieude}', noi_dung='${req.body.noidung}', tac_gia='${req.body.tacgia}',ngay_dang='${req.body.ngaydang}', trang_thai='${req.body.trangthai}', hinh_anh="/images/"'${req.body.hinhanh}'where id=${id}`;
    conn.query(sql, (err, rs) => {
      res.redirect('/admin&managerpost');
    });
  }
  else
    res.redirect('/loginadmin');
});

//giao diện thêm bài viết
router.get('/thembaiviet', (req, res) => {
  if (status_login == true) {
    res.render('admin/layouts', { content: 'thembaiviet.ejs' });
  }
  else
    res.redirect('/loginadmin');
});

//thêm bài viết
router.post('/capnhatbaivietmoi', (req, res) => {
  if (status_login == true) {
    let id = (`select id from danhmucbaiviet where ten_danh_muc=N'${req.body.chude}'`);
    console.log(id);
    let sql = `insert into baiviet(tieu_de, noi_dung, tac_gia, ngay_dang, trang_thai, hinh_anh, danh_muc) values ('${req.body.tieude}', '${req.body.noidung}','${req.body.tacgia}', '${req.body.ngaydang}', '${req.body.trangthai}', '${req.body.hinhanh}', '${id}')`;
    conn.query(sql, (err, rs) => {
      res.redirect('/admin&managerpost');
    });
  }
  else
    res.redirect('/loginadmin');
});
// chức năng update trạng thái
router.get('/trangthai/:id', (req, res) => {
  if (status_login == true) {
    let id = req.params.id;
    let sql = `select trang_thai from baiviet where baiviet.id = ${id}`;
    conn.query(sql, (err, result) => {
      if (result[0].trang_thai == 'hiển thị') {
        conn.query(`update baiviet set baiviet.trang_thai = 'không hiển thị' where baiviet.id = ${id}`, (err) => {
          res.redirect('/admin&managerpost');
        });
      }
      else {
        conn.query(`update baiviet set baiviet.trang_thai = 'hiển thị' where baiviet.id = ${id}`, (err) => {
          res.redirect('/admin&managerpost')
        });
      }
    });
  }
  else
    res.redirect('/loginadmin');
});
module.exports = router;
