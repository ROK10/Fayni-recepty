package com.naukma.faynirecepty.service;

import com.naukma.faynirecepty.model.entity.Recipe;
import com.naukma.faynirecepty.model.entity.User;
import com.naukma.faynirecepty.repository.RecipeRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Set;

@Service("recipeService")
public class RecipeService {

    @Autowired
    private RecipeRepository recipeRepository;

    @Transactional
    public Recipe findById(Long id){
        return recipeRepository.findById(id).orElse(null);
    }

    @Transactional
    public List<Recipe> findAll(){
        return recipeRepository.findAll();
    }

    @Transactional
    public List<Recipe> findPopular(){
        return recipeRepository.findPopular();
    }

    @Transactional
    public List<Recipe> findAllContaining(String search){
        return recipeRepository.findAllContaining(search.toLowerCase());
    }

    @Transactional
    public void save(Recipe recipe){
        recipeRepository.save(recipe);
    }

    @Transactional
    public void delete(Recipe recipe){
        recipeRepository.delete(recipe);
    }


}
