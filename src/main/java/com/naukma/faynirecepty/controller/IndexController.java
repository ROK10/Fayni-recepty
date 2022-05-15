package com.naukma.faynirecepty.controller;

import com.naukma.faynirecepty.config.CustomPasswordEncoder;
import com.naukma.faynirecepty.model.entity.Recipe;
import com.naukma.faynirecepty.model.entity.User;
import com.naukma.faynirecepty.repository.RecipeRepository;
import com.naukma.faynirecepty.service.UserService;
import com.naukma.faynirecepty.service.ValidationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private RecipeRepository recipeRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private CustomPasswordEncoder customPasswordEncoder;

    @RequestMapping({"/register", ""})
    public String register() {
        return "registration";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/registerForm", method = RequestMethod.POST)
    public String form(@RequestParam(name = "username") String username,
                       @RequestParam(name = "psw") String psw,
                       Model model, HttpServletRequest request) {

        System.out.println(username + " " + psw);

        if (!ValidationService.isRegFormValid(username, psw)) {
            model.addAttribute("problem", "Username should only contain latin and numbers, " +
                    "password must be 8-20 characters long");

            System.out.println("hi, im a little bitch");

            return "forward:/register";
        }

        if (userService.getUserByUsername(username) != null) {
            model.addAttribute("problem", "This user already exists");
            return "forward:/register";
        }

        userService.createUser(username, customPasswordEncoder.encode(psw));

        return "redirect:/login";
    }

    @RequestMapping({"/", ""})
    public String index(Model model){

        List<Recipe> popular = recipeRepository.findPopular();

        model.addAttribute("popular", popular);

        return "index";
    }

    @RequestMapping({"/recipe/{id}", ""})
    public String showInfoPage(Model model, @PathVariable(name = "id") Long id, HttpSession session) {
        Recipe recipe = recipeRepository.getById(id);
        User creator = userService.getUserById(recipe.getCreatorId());

        model.addAttribute("recipe", recipe);
        model.addAttribute("creator", creator);
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

    @RequestMapping(value = "/find-recipes", method = RequestMethod.POST)
    public String form(@RequestParam(name = "searchInput") String search,
                       Model model, HttpSession session) {

        List<Recipe> searchRes = recipeRepository.findAllContaining(search);
        model.addAttribute("searchRes", searchRes);
        session.setAttribute("search", search);

        return "redirect:/search-result";
    }

    @RequestMapping(value = "/search-result", method = RequestMethod.GET)
    public String findGet(Model model, HttpSession session) {

        String search = (String) session.getAttribute("search");

        List<Recipe> searchRes = recipeRepository.findAllContaining(search);
        model.addAttribute("searchRes", searchRes);

        return "search-result";
    }

}
