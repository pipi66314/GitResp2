package dao;

import domain.User;

import java.util.List;
import java.util.Map;

/**
 * 用户操作的Dao
 */

public interface UserDao {
    public List<User> findAll();

    public User findUserByUsernameAndPassword(String username, String password);

    void add(User user);

    void delete(String id);

    User findUserById(String id);

    void update(User user);

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<User> findByPage(int start, int rows, Map<String, String[]> condition);

    /**
     * 查询总记录数
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);
}
