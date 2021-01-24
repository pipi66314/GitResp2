package dao;

import domain.Admin;

/**
 * 用户操作的Dao
 */

public interface AdminDao {

    public Admin findAdminByUsernameAndPassword(String username, String password);
}
