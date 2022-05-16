package com.naukma.faynirecepty.model;

import com.naukma.faynirecepty.model.entity.Recipe;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RecipeDto {

    private Long id;

    private String title;

    private String description;

    private String img;

    private String time;

    private String difficulty;

    private Long creatorId;

    private String liked;

    public RecipeDto(Recipe recipe, String liked){
        this.id = recipe.getId();
        this.title = recipe.getTitle();
        this.description = recipe.getDescription();
        this.img = recipe.getImg();
        this.time = recipe.getTime();
        this.difficulty = recipe.getDifficulty();
        this.creatorId = recipe.getCreatorId();
        this.liked = liked;
    }

}
