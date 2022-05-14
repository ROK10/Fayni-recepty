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

    @RequestMapping({"/recipe/{id}", ""})
    public String showInfoPage(@PathVariable(name = "id") Long id, HttpSession session) {
        Recipe recipe = recipeRepository.getById(id);
        if (recipe != null) {

//            String liked = "no";

//            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//            if (!(authentication instanceof AnonymousAuthenticationToken)) {
//                String currentUserName = authentication.getName();
//
//                Set<Book> likedBooks = userService.getUserByUsername(currentUserName).getLikedBooks();
//
//                if(likedBooks != null) {
//                    liked = likedBooks.contains(book)? "yes" : "no";
//                }
//            }

//            BookDto bookDto = new BookDto(book, liked);
            session.setAttribute("recipe", recipe);
            return "recipe";
        }
        return "wrong_id_recipe";
    }

}
