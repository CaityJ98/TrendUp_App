# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ["dresses", "shorts", "tops", "jeans", "shoes", "outerwear"]
#if category not selected cycle through all categories. 
if Category.count == 0
    categories.each do |c|
        Category.create(name: c)
        puts "created #{c} category"
    end 
end 
# if feature is not selected cycle through all features

    features = ["male", "female", "small", "medium", "large"]
    if Feature.count == 0
        features.each do |f|
            Feature.create(name: f)
            puts "created #{f} feature"
        end
    end 
