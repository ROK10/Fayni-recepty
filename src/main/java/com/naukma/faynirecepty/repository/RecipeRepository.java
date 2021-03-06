package com.naukma.faynirecepty.repository;

import com.naukma.faynirecepty.model.entity.Recipe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository("recipeRepository")
public interface RecipeRepository extends JpaRepository<Recipe, Long> {

    Optional<Recipe> findById(Long id);

    List<Recipe> findAll();

    @Query(value = "select * " +
            "from recipes rec " +
            "order by rec.popularity desc " +
            "limit 5",
            nativeQuery = true)
    List<Recipe> findPopular();

    @Query(value = "select * " +
            "from recipes rec " +
            "where lower(rec.title) " +
            "like concat('%',:search,'%')",
            nativeQuery = true)
    List<Recipe> findAllContaining(@Param("search") String search);

}
