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

const check_user = ` SELECT * FROM tb_users WHERE user_name = ?`;
const register = ` 
INSERT INTO tb_users (
    user_name,
    user_password,	
    pin_user,
    create_at,
    update_at
) VALUES (?, ?, ?, ?, ?)`;

const login_user = `SELECT user_id, user_name, user_password
  FROM tb_users
  WHERE user_name = ?;`;


const updateQuery = `UPDATE tb_users SET user_name = ?, user_password = ?, pin_user = ?,
create_at = ?, update_at = ? WHERE user_id = ?;`;


const login_user2 = `SELECT user_id,user_name,pin_user FROM tb_users WHERE user_name = ?`;

module.exports = {
  login_user,
  register,
  check_user,
  updateQuery,
  login_user2
  
};


