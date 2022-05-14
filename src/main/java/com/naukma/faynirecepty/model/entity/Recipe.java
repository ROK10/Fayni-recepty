package com.naukma.faynirecepty.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "recipes")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Recipe {

    @Id
    @Column(name = "id", nullable = false, unique = true)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "description")
    private String description;

//    the amount of likes
    @Column(name = "popularity")
    private Integer popularity;

    @Column(name = "img")
    private String img;

    @Column(name = "ingredients")
    private String ingredients;

    @Column(name = "time")
    private String time;

    @Column(name = "difficulty")
    private String difficulty;

}
