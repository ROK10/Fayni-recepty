package com.naukma.faynirecepty.controller;

import com.naukma.faynirecepty.model.entity.Recipe;
import com.naukma.faynirecepty.repository.RecipeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

@Controller
public class IndexController {

    @Autowired
    private RecipeRepository recipeRepository;

    @RequestMapping({"/", ""})
    public String index(Model model){

        List<Recipe> popular = recipeRepository.findPopular();

        model.addAttribute("popular", popular);

        return "index";
    }

}
