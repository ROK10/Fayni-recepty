package com.naukma.faynirecepty.service;

import com.naukma.faynirecepty.model.entity.Recipe;

import java.util.regex.Pattern;

public class ValidationService {

    public static final String USERNAME_REGEX = "^[A-Za-z0-9]+$";
    public static final String PSW_REGEX = "^.{8,20}$";

    public static boolean isRecipeValid(Recipe recipe) {

        if (recipe.getTitle().equals("") ||
                recipe.getDescription().equals("") ||
                recipe.getTime().equals("") ||
                recipe.getDifficulty().equals("") || recipe.getImg().equals(""))
            return false;

        return true;
    }

    public static boolean isRegFormValid(String username, String password) {

        if (isPswValid(password) && isUsernameValid(username)) return true;

        return false;
    }

    private static boolean isUsernameValid(String username) {
        return Pattern.matches(USERNAME_REGEX, username);
    }

    private static boolean isPswValid(String psw) {
        return Pattern.matches(PSW_REGEX, psw);
    }

}
