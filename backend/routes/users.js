const router = require('express').Router();
const usercontroller = require('../controllers/userControllers');
const {verifyToken} = require('../middleware/verifyToken');


router.get('/',verifyToken,usercontroller.getUser)
router.delete('/',verifyToken,usercontroller.delete)

module.exports = router;

