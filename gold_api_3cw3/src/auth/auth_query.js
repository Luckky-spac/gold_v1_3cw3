// const register = `
// INSERT INTO tb_user (
//     full_name,
//     user_name,
//     user_password,
//     user_status_id,
//     role_id,
//     depart_id,
//     picturs,
//     village,
//     district_id,
//     add_by,
//     create_at,
//     update_at
// ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

const check_user = ` SELECT * FROM tb_users WHERE phone_number = ?`;
const register = ` 
INSERT INTO tb_users (
    phone_number,
    user_password,	
    pin_user,
    create_at,
    update_at
) VALUES (?, ?, ?, ?, ?)`;

const login_user = `SELECT user_id, phone_number, user_password
  FROM tb_users
  WHERE phone_number = ?;`;


const updateQuery = `UPDATE tb_users SET phone_number = ?, user_password = ?, pin_user = ?,
create_at = ?, update_at = ? WHERE user_id = ?;`;


const login_user2 = `SELECT user_id,phone_number,pin_user FROM tb_users WHERE phone_number = ?`;

module.exports = {
  login_user,
  register,
  check_user,
  updateQuery,
  login_user2
  
};


