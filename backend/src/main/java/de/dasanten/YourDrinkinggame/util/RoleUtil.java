package de.dasanten.YourDrinkinggame.util;

import de.dasanten.YourDrinkinggame.entity.enums.UserRole;

public class RoleUtil {

    public static boolean isAdmin(UserRole role) {
        if (role==null) return false;
        return
            role.equals(UserRole.ADMIN) ||
            role.equals(UserRole.SUPER_ADMIN);
    }

    public static boolean isMod(UserRole role) {
        if (role==null) return false;
        return
            role.equals(UserRole.MODERATOR) ||
            role.equals(UserRole.ADMIN) ||
            role.equals(UserRole.SUPER_ADMIN);
    }

    public static boolean isHelper(UserRole role) {
        return !role.equals(UserRole.USER);
    }

}
