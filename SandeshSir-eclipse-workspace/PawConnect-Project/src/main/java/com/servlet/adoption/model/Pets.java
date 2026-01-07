package com.servlet.adoption.model;

public class Pets {
    private int pet_id;
    private String petname;
    private String species;
    private String breed;
    private int age;
    private String gender;
    private String imageUrl;
    private String location;

    public Pets() {}

    public Pets(int pet_id, String petname, String species, String breed, int age,
                String gender, String imageUrl, String location) {
        this.pet_id = pet_id;
        this.petname = petname;
        this.species = species;
        this.breed = breed;
        this.age = age;
        this.gender = gender;
        this.imageUrl = imageUrl;
        this.location = location;
    }

    public int getPet_Id() {
        return pet_id;
    }

    public void setPet_Id(int pet_id) {
        this.pet_id = pet_id;
    }

    public String getPetName() {
        return petname;
    }

    public void setPetName(String name) {
        this.petname = name;   // FIXED
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}