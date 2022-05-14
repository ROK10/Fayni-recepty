package com.naukma.faynirecepty.repository;

import com.naukma.faynirecepty.model.entity.Ingredient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ingredientRepository")
public interface IngredientRepository extends JpaRepository<Ingredient, Long> {

    List<Ingredient> findAll();

}
