const connected = require("../connection/connecting");
const queries = require("./auth_query")
const jwt = require("jsonwebtoken");
const secretkey = process.env.secretkey || "IDEV#GOLD";
const bcrypt = require("bcrypt");




// const update_user = async (request, respond) => {
//     const  {  user_id,user_name, user_password , pin_user} = request.body;

//     const encryptPassword = await bcrypt.hash(user_password || secretkey, 10);
 
//     connected.query(queries.updateQuery , [user_name, encryptPassword, pin_user, new Date() ,new Date (),user_id], (error, results) => {

//       if (error) {
//           console.error("update Error", error);
//           return respond.status(500).json({ resultCode: "ມີບັນຫາໃນການອັບເດດ" ,error});
//       }else if (results.affectedRows === 0) {
//         respond.json({ resultCode: "ບໍ່ສາມາດອັບເດດໄດ້" });
          
//       }else{
//         respond.json({ resultCode: "ອັບເດດສຳເລັດ" });
//       }
//       console.log("results", results);
//     })


//   }



const register_user = async (request, respond) => {
  const { 
      
      user_name,
      user_password, 
      pin_user
  } = request.body;

  // Encrypt the password (Use provided password if available)
  const encryptPassword = await bcrypt.hash(user_password || secretkey, 10);

  // Check if the user already exists
  connected.query(queries.check_user, [user_name], (error, results) => {
    if(error)throw error;
      if (results.length) {
          respond.json({ resultCode: "ຜູ້ໃຊ້ນີ້ມີໃນລະບົບແລ້ວ" });

          return;
      }

      // Insert new user
      connected.query(
          queries.register,
          [
              user_name,
              encryptPassword,
              pin_user,
              new Date(), // create_at
              new Date(), // update_at
          ],
          (error, results) => {
              if (error) {
                  console.error("Insert Error:", error);
                  respond.status(500).json({ resultCode: "ມີບັນຫາໃນການລົງທະບຽນ", error });
                  return;
              }
              respond.json({ resultCode: "ລົງທະບຽນສຳເລັດ" });
          }
      );
  });
};


const login_ByPassWord = (request, respond) => {
  const { user_name, user_password } = request.body;

  if (!user_name || !user_password ) {
    return respond
      .status(400)
      .json({ resultCode: "missing username, password or pin" });
  }

  connected.query(queries.login_user, [user_name], async (error, results) => {
    if (error) {
      console.error("Database query error:", error);
      return respond.status(500).json({ resultCode: "internal server error" });
    }

    if (results.length) {
      const user = results[0];
      console.log("results", results);

      const isPasswordMatch = await bcrypt.compare(user_password, user.user_password);

      if (!isPasswordMatch) {
        return respond.status(401).json({ resultCode: "password not match" });
      }


      // Generate JWT token
      const accessToken = jwt.sign(
        { id_user: user.user_id, user_status_id: user.user_status_id },
        secretkey,
        { expiresIn: "1 d" }
      );

      return respond.json({
        resultCode: "OK",
        id_user: user.user_id,
        user_name: user.user_name,
        user_status: user.user_status_id,
        role_name: user.role_name,
        depart_name: user.depart_name,
        accessToken,
      });
    } else {
      return respond.status(404).json({ resultCode: "no user" });
    }
  });
};


const login_byPin =  (request, respond) => {
    const { user_name, pin_user } = request.body;

    if (!user_name || !pin_user) {
      return respond.status(400).json({ resultCode: "missing username or pin" });
    }

    connected.query(queries.login_user2,[user_name], async(error,results)=>{
        if (error) {
            console.error("Database query error:", error);
            return respond.status(500).json({ resultCode: "internal server error" });
          }
    
          if (results.length) {
            const user = results[0];
            console.log("results", results);
    
            if (pin_user !== user.pin_user) {
              return respond.status(400).json({ resultCode: "pin user ບໍ່ຖືກຕ້ອງ" });
            }
    
            // Generate JWT token
            const accessToken = jwt.sign(
              { id_user: user.user_id, user_status_id: user.user_status_id },
              secretkey,
              { expiresIn: "1 d" }
            );
    
            return respond.json({
              resultCode: "OK",
              id_user: user.user_id,
              user_name: user.user_name,
              user_status: user.user_status_id,
              role_name: user.role_name,
              depart_name: user.depart_name,
              accessToken,
            });
          } else {
            return respond.status(404).json({ resultCode: "no user" });
          }
    })
   
};

module.exports = {
  login_ByPassWord,
  register_user,
  login_byPin
};

