package service;

import domain.Admin;

/**
 * 用户管理的业务接口
 */

public interface AdminService {
    /**
     * 查询所有用户信息
     * @return
     */

    public Admin login(Admin admin);
}
