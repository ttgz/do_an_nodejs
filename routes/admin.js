var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('admin/layouts', { content: 'main.ejs' });
});
router.get('/manageruser', function(req, res, next) {
  res.render('admin/layouts', { content: 'manager_user.ejs' });
});
router.get('/managerpost', function(req, res, next) {
  res.render('admin/layouts', { content: 'manager_post.ejs' });
});
router.get('/managertopicpost', function(req, res, next) {
  res.render('admin/layouts', { content: 'manager_topic_post.ejs' });
});
module.exports = router;
