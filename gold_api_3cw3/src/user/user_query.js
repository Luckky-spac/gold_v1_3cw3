
const check_user_id = `SELECT * FROM tb_users WHERE user_id = ?`;
const check_user_name = ` SELECT * FROM tb_users WHERE user_name = ?`;
const update_user = `UPDATE tb_users SET user_name = ?, user_password = ?, pin_user = ?,
create_at = ?, update_at = ? WHERE user_id = ?;`;


module.exports = {
    check_user_id,
    check_user_name,
    update_user
};