package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Post;

public class PostValidator {

    public static List<String> validate(Post p) {

        List<String> errors = new ArrayList<String>();

        String brandName_error = _validateBrandName(p.getBrandName());
        if(!brandName_error.equals("")) {
            errors.add(brandName_error);
        }

        String content_error = _validateContent(p.getContent());
        if(!content_error.equals("")){
            errors.add(content_error);
        }

        return errors;

    }

    private static String _validateBrandName(String brandName) {
        if(brandName == null || brandName.equals("")) {
            return "ブランド名を入力してください。";
            }

        return "";
    }

    private static String _validateContent(String content) {
        if(content == null || content.equals("")) {
            return "内容を入力してください。";
            }

        return "";
    }
}



