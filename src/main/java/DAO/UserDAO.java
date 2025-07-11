package DAO;

import models.User;

public interface UserDAO {
    int register(User user);
    boolean login(User user);

    int getUserIdByUsername(String username);
}
