//call express function
const { Router } = require('express');

//set router
const router = Router();

// auth

const auth_controller = require("../auth/auth_controller");
router.post('/register', auth_controller.register_user);
router.post('/login/password', auth_controller.login_ByPassWord);
router.post('/login/pin', auth_controller.login_byPin);

function verifyToken(req, res, next) {
    // Get auth header value
    const bearerHeader = req.headers['authorization'];
    // Check if bearer is undefined
    if(typeof bearerHeader !== 'undefined') {
      // Split at the space
      const bearer = bearerHeader.split(' ');
      // Get token from array
      const bearerToken = bearer[1];
      // Set the token
      req.token = bearerToken;
      // Next middleware
      next();
    } else {
      // Forbidden
      res.sendStatus(403);
    }
  
  }
//export route to  server file
module.exports = router;