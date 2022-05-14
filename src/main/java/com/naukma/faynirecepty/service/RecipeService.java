package com.naukma.faynirecepty.service;

import com.naukma.faynirecepty.repository.RecipeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service("recipeService")
@AllArgsConstructor
public class RecipeService {

    private RecipeRepository recipeRepository;

}
