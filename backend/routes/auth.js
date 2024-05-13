const router = require('express').Router();
const authcontroller = require('../controllers/authControllers');


router.post('/register',authcontroller.createUser)
router.post('/login',authcontroller.loginUser)

module.exports = router;

