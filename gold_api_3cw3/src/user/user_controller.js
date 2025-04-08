const connected = require("../connection/connecting");
const queries = require("./user_query");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const secretkey = process.env.secretkey || "IDEV#GOLD";

const update_user = (req, res) =>{

    const { user_id, user_name, user_password, pin_user } = req.body;

jwt.verify(req.token, secretkey, (token_error, rstoken) => {
    
    if (token_error) {
        return res.status(403).json({ resultCode: "ບໍ່ສາມາດເຂົ້າໃຊ້" });
    } else{
        connected.query(queries.check_user_id, [user_id], (error, results) => {
            if(error) throw error;
            if (!results.length){
                return res.json({ resultCode: "ບໍ່ສາມາດອັບເດດໄດ້" });

            } else{
                connected.query(queries.check_user_name, [user_name], (error, results) => {
                    if(error) throw error;
                    if (results.length) {
                        return res.json({ resultCode: "ຜູ້ໃຊ້ນີ້ມີໃນລະບົບແລ້ວ" });
                    } else {
                        const encryptPassword = bcrypt.hashSync(user_password || secretkey, 10);
                        connected.query(queries.update_user, [user_name, encryptPassword, pin_user, new Date(), new Date(), user_id], (error, results) => {
                            if(error) throw error;
                            if(results.affectedRows === 0) {
                                return res.json({ resultCode: "ບໍ່ສາມາດອັບເດດໄດ້2" });
                            }
                            return res.json({ resultCode: "ອັບເດດສຳເລັດ" });
                })
            }
        })
    }
})

}})}


module.exports = {
    update_user
}
