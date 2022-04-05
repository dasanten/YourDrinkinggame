package de.dasanten.YourDrinkinggame.security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;

public class SecurityUtil {

    private static Jwt getUser() {
        return (Jwt) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

    public static String getMail() {
        return getUser().getClaimAsString("email");
    }

    public static String getAuthId() {
        return getUser().getSubject();
    }

}
