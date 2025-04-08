

//call express function
const { Router } = require('express');

//set router
const router = Router();

// user


const user_controller = require("../user/user_controller");
router.put('/update/user',verifyToken, user_controller.update_user);


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