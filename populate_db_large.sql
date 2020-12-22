-- populate table author 10000
\COPY author(id, author_name, country) from 'author.csv' delimiter ',' csv header;

-- populate table category
insert into category values (1, 'Breakfast');
insert into category values (2, 'Lunch');
insert into category values (3, 'Dinner');
insert into category values (4, 'Appetizers');
insert into category values (5, 'Salads');
insert into category values (6, 'Beef');
insert into category values (7, 'Poultry');
insert into category values (8, 'Pork');
insert into category values (9, 'Seafood');
insert into category values (10, 'Vegetarian');
insert into category values (11, 'Desserts');
insert into category values (12, 'Holidays');
insert into category values (13, 'Brunch');
insert into category values (14, 'Kid Friendly');
insert into category values (15, 'Slow Cooker');
insert into category values (16, 'Budget');
insert into category values (17, 'Healthy Diet');
insert into category values (18, 'Comfort Food');
insert into category values (19, 'Gluten Free');
insert into category values (20, 'Soups');


-- populate table cuisine
insert into cuisine values (1, 'Vietnamese');
insert into cuisine values (2, 'Thai');
insert into cuisine values (3, 'Mexican');
insert into cuisine values (4, 'Indian');
insert into cuisine values (5, 'Chinese');
insert into cuisine values (6, 'Japanese');
insert into cuisine values (7, 'French');
insert into cuisine values (8, 'Korean');
insert into cuisine values (9, 'Chinese');
insert into cuisine values (10, 'Greek');
insert into cuisine values (11, 'Spanish');
insert into cuisine values (12, 'Irish');
insert into cuisine values (13, 'German');
insert into cuisine values (14, 'Indonesian');
insert into cuisine values (15, 'African');
insert into cuisine values (16, 'Mediterranean');
insert into cuisine values (17, 'Italian');
insert into cuisine values (18, 'Middle East');
insert into cuisine values (19, 'American');
insert into cuisine values (20, 'Russian');

-- populate table recipe 10000
\COPY recipe(id, title, rep_descript, prep_time, cook_time, category_id, cuisine_id, author_id, views) from 'recipe.csv' delimiter ',' csv header;

-- populate table ingredient
insert into ingredient values (1, 20, 'Barberry');
insert into ingredient values (2, 19, 'Coconut');
insert into ingredient values (3, 18, 'Endive');
insert into ingredient values (4, 17, 'Okra');
insert into ingredient values (5, 17, 'Jarrahdale Pumpkin');
insert into ingredient values (6, 16, 'Goat Cheese');
insert into ingredient values (7, 15, 'Brown Mushrooms');
insert into ingredient values (8, 14, 'Spinach');
insert into ingredient values (9, 13, 'Raisin');
insert into ingredient values (10, 12, 'Blueberries');
insert into ingredient values (11, 12, 'Jelly');
insert into ingredient values (12, 11, 'Cream');
insert into ingredient values (13, 10, 'Spinach');
insert into ingredient values (14, 9, 'Slivered Almonds');
insert into ingredient values (15, 8, 'Mint');
insert into ingredient values (16, 7, 'Monkfish');
insert into ingredient values (17, 6, 'Asparagus');
insert into ingredient values (18, 5, 'Haloumi');
insert into ingredient values (19, 4, 'Besan');
insert into ingredient values (20, 4, 'Brazil Nut');
insert into ingredient values (21, 3, 'Tabasco');
insert into ingredient values (22, 3, 'Kidney Beans');
insert into ingredient values (23, 3, 'Purple Rice');
insert into ingredient values (24, 2, 'Agar');
insert into ingredient values (25, 2, 'Aniseed');
insert into ingredient values (26, 1, 'Vegetable Stock');
insert into ingredient values (27, 1, 'Kokam');
insert into ingredient values (28, 1, 'Tapioca Flour');
insert into ingredient values (29, 5, 'Barramundi');
insert into ingredient values (30, 9, 'Besan');
insert into ingredient values (31, 10, 'Tofu');
insert into ingredient values (32, 14, 'Haricot Beans');
insert into ingredient values (33, 17, 'Brazil Nut');
insert into ingredient values (34, 20, 'Tapioca Flour');
insert into ingredient values (35, 19, 'Wheat');
insert into ingredient values (36, 8, 'Leeks');
insert into ingredient values (37, 8, 'Red Wine');
insert into ingredient values (38, 4, 'Aubergine');
insert into ingredient values (39, 9, 'Lentils');
insert into ingredient values (40, 7, 'Szechuan Pepperberry');
insert into ingredient values (41, 1, 'Margarine');
insert into ingredient values (42, 17, 'Farmed Prawns');
insert into ingredient values (43, 11, 'Cardamom');
insert into ingredient values (44, 5, 'Mahlab');
insert into ingredient values (45, 6, 'Cavalo');
insert into ingredient values (46, 4, 'Flaxseed Oil');
insert into ingredient values (47, 12, 'Banana');
insert into ingredient values (48, 13, 'Lychees');
insert into ingredient values (49, 14, 'Curry Powder');
insert into ingredient values (50, 11, 'Beetroot');

-- populate table quantity
insert into quantity values (18, 20, 3, 'pint');
insert into quantity values (11, 8, 1/2, 'quart');
insert into quantity values (3, 7, 5, 'teaspoon');
insert into quantity values (5, 50, 2, 'gallon');
insert into quantity values (18, 45, 1, 'tablespoon');
insert into quantity values (16, 35, 10, 'teaspoon');
insert into quantity values (4, 32, 8, 'cup');
insert into quantity values (15, 11, 3/4, 'cup');
insert into quantity values (15, 10, 1/2, 'teaspoon');
insert into quantity values (6, 9, 3, 'teaspoon');
insert into quantity values (3, 8, 3/4, 'teaspoon');
insert into quantity values (15, 8, 2, 'quart');
insert into quantity values (4, 5, 1, 'cup');
insert into quantity values (11, 2, 1, 'gallon');
insert into quantity values (10, 1, 3, 'teaspoon');
insert into quantity values (14, 22, 1, 'gallon');
insert into quantity values (16, 23, 5, 'quart');
insert into quantity values (12, 34, 1/4, 'teaspoon');
insert into quantity values (13, 12, 1/2, 'pint');
insert into quantity values (1, 8, 1, 'quart');
insert into quantity values (18, 23, 3, 'pint');
insert into quantity values (11, 24, 1/2, 'quart');
insert into quantity values (3, 25, 5, 'teaspoon');
insert into quantity values (5, 26, 2, 'gallon');
insert into quantity values (18, 27, 1, 'tablespoon');
insert into quantity values (16, 28, 10, 'teaspoon');
insert into quantity values (4, 29, 8, 'cup');
insert into quantity values (15, 30, 3/4, 'cup');
insert into quantity values (15, 19, 1/2, 'teaspoon');
insert into quantity values (16, 31, 3, 'teaspoon');
insert into quantity values (13, 33, 3/4, 'teaspoon');
insert into quantity values (5, 36, 2, 'quart');
insert into quantity values (14, 38, 1, 'cup');
insert into quantity values (1, 41, 1, 'gallon');
insert into quantity values (10, 47, 3, 'teaspoon');
insert into quantity values (12, 50, 1, 'gallon');
insert into quantity values (6, 12, 5, 'quart');
insert into quantity values (2, 34, 1/4, 'teaspoon');
insert into quantity values (3, 12, 1/2, 'pint');
insert into quantity values (1, 18, 1, 'quart');
insert into quantity values (1, 50, 1, 'gallon');
insert into quantity values (6, 23, 5, 'quart');
insert into quantity values (5, 34, 1/4, 'teaspoon');
insert into quantity values (8, 12, 1/2, 'pint');
insert into quantity values (10, 8, 1, 'quart');
insert into quantity values (19, 50, 1, 'gallon');
insert into quantity values (16, 27, 5, 'quart');
insert into quantity values (12, 13, 1/4, 'teaspoon');
insert into quantity values (13, 21, 1/2, 'pint');
insert into quantity values (1, 9, 1, 'quart');

-- populate table instruction
insert into instruction values (1, '28-day aged 300g USDA Certified Prime Ribeye, rosemary-thyme garlic butter, with choice of two sides.');
insert into instruction values (2, 'Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.');
insert into instruction values (3, 'Two buttermilk waffles, topped with whipped cream and maple syrup, a side of two eggs served any style, and your choice of smoked bacon or smoked ham.');
insert into instruction values (4, 'Two butter croissants of your choice (plain, almond or cheese). With a side of herb butter or house-made hazelnut spread.');
insert into instruction values (5, '28-day aged 300g USDA Certified Prime Ribeye, rosemary-thyme garlic butter, with choice of two sides.');
insert into instruction values (6, 'Three egg whites with spinach, mushrooms, caramelized onions, tomatoes and low-fat feta cheese. With herbed quinoa, and your choice of rye or whole-grain toast.');
insert into instruction values (7, 'Breaded fried chicken with waffles, and a side of maple syrup.');
insert into instruction values (8, 'Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.');
insert into instruction values (9, 'Smoked salmon, poached eggs, diced red onions and Hollandaise sauce on an English muffin. With a side of roasted potatoes.');
insert into instruction values (10, 'Fresh parsley, Italian sausage, shallots, garlic, sun-dried tomatoes and mozzarella cheese in an all-butter crust. With a side of mixed fruits.');
insert into instruction values (11, 'Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.');
insert into instruction values (12, 'Fresh Norwegian salmon, lightly brushed with our herbed Dijon mustard sauce, with choice of two sides.');
insert into instruction values (13, 'Fresh Norwegian salmon, lightly brushed with our herbed Dijon mustard sauce, with choice of two sides.');
insert into instruction values (14, 'Thick slices of French toast bread, brown sugar, half-and-half and vanilla, topped with powdered sugar. With two eggs served any style, and your choice of smoked bacon or smoked ham.');
insert into instruction values (15, 'Fresh parsley, Italian sausage, shallots, garlic, sun-dried tomatoes and mozzarella cheese in an all-butter crust. With a side of mixed fruits.');
insert into instruction values (16, 'Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.');
insert into instruction values (17, 'Creamy mascarpone cheese and custard layered between espresso and rum soaked house-made ladyfingers, topped with Valrhona cocoa powder.');
insert into instruction values (18, 'Breaded fried chicken with waffles, and a side of maple syrup.');
insert into instruction values (19, 'Three egg omelet with Roquefort cheese, chives, and ham. With a side of roasted potatoes, and your choice of toast or croissant.');
insert into instruction values (20, 'Three eggs with cilantro, tomatoes, onions, avocados and melted Emmental cheese. With a side of roasted potatoes, and your choice of toast or croissant.');

-- populate table note
\COPY note(recipe_id, note_descript) from 'note.csv' delimiter ',' csv header;

-- populate table users 50000
\COPY users(id, username, country) from 'users.csv' delimiter ',' csv header;

-- populate table review
insert into review values (17, 16, 4, 'Great place to stop in from a chaotic Times Square adventure! The coffee is great, the drinks are creative and the staff is very nice and hospitable. Cant wait to stop in again. Without a doubt 5 stars from me!!');
insert into review values (10, 2, 2, 'Staff was very accommodating but the chef were no nonsense. The ambiance is clean and tranquil which is perfect if youre looking to have a conversation with a date or a friend.');
insert into review values (14, 17, 2, 'In terms of omakase, they had a few options but the one we chose was the 87 dollar version which include sashimi and sushi.');
insert into review values (7, 13, 3, 'For dessert, we ordered the chocolate drizzled churros and they were delicious too! They even came with some fresh fruit (blueberries and strawberries).');
insert into review values (6, 3, 4, 'They are way understaffed, where the cashier needs to stop taking orders to help pack to-go orders. The line ends up piling up and people are neglected.  Seen this happen multiple times during lunch hours.');
insert into review values (8, 11, 1, 'This particular location like the many other restaurants down the block has ample seating and a second floor.');
insert into review values (19, 6, 4, 'Fish was high quality but portions were small. $57 for 9 pieces and a hand roll which is fair but on the expensive side.');
insert into review values (8, 1, 5, 'Fish was high quality but portions were small. $57 for 9 pieces and a hand roll which is fair but on the expensive side.');
insert into review values (2, 14, 1, 'Staff was very accommodating but the chef were no nonsense. The ambiance is clean and tranquil which is perfect if youre looking to have a conversation with a date or a friend.');
insert into review values (9, 5, 3, 'Fish was high quality but portions were small. $57 for 9 pieces and a hand roll which is fair but on the expensive side.');
insert into review values (16, 20, 4, 'In terms of omakase, they had a few options but the one we chose was the 87 dollar version which include sashimi and sushi.');
insert into review values (10, 17, 3, 'Overall, the evening was a smash and I am so glad there is a new location closer to my office!!');
insert into review values (4, 1, 4, 'The counter is on the left side, and so is the menu. It can get pretty busy with 30 min wait times. I recommend checking the website and see how busy their store is.');
insert into review values (16, 17, 1, 'Id have to say that each piece was fresh and had their own slight unique flavor twist to it, pushing the line between traditional edomae and fusion. The Hokkaido uni and the ocean trout topped with cook seaweed was the highlights of the meal. But each piece served was really something special.');
insert into review values (3, 19, 3, 'Ambience was good, service was no nonsense but friendly.');
insert into review values (19, 11, 5, 'Great lattes and cold drinks as well. Nice to see a place carrying local coffee and products in Times Square! Excited to make it a part of my morning commute as it is much less crowded than the chain coffee shops around here.');
insert into review values (10, 15, 2, 'Great lattes and cold drinks as well. Nice to see a place carrying local coffee and products in Times Square! Excited to make it a part of my morning commute as it is much less crowded than the chain coffee shops around here.');
insert into review values (20, 5, 4, 'Ambience was good, service was no nonsense but friendly.');
insert into review values (12, 14, 1, 'I first heard about this place through Instagram post. The drinks looked creative so I made it a point to give it try while in the city. Located inside American Eagle in Times Square they serve up the coolest non-alcoholic beverages. You have an array of options from tea, soda, coffee, latte, water and more. Theres countertops (with phone chargers) so youre able to stand and enjoy your beverage. This visit I opted for the Pegasus latte which was not only beautiful but tasted just as good as it looked. Great staff and great service. This is a must try if you are in the area. Im sure Ill be back soon!');
insert into review values (20, 13, 1, 'Brand new. Great design. Odd to hear pop music in a Mexican establishment. Music is a bit loud. It should be background.');
insert into review values (8, 3, 5, 'Best recipe for pho Ive ever tried. I omit the daikon but this broth is Excellent! TIP for slicing the beef: Put it in the freezer until its partially frozen (or thaw it until its still partly frozen). This allows you to slice it very thinly because its firmer and sturdier.');
insert into review values (16, 3, 5, 'This recipe reminds me of my childhood');
insert into review values (2, 3, 5, 'Great Pho. I made it per recipe and it was very good. I will make two changes to adjust to my own taste. I would cut the star anise pods by half and only add 1.5 gallons of water. I had to simmer it an additional 2-3 hours to reduce the volume to up the beef flavor. I believe it will be resturant quality with these adjustments. I would serve it to dinner guest any time.');
insert into review values (14, 3, 5, 'OMG crazy awesome! The whole family swarmed my kitchen for seconds including my picky 9 yr old son but there was not enough broth.');
insert into review values (11, 3, 4, 'Pho is the best! I used shrimp instead of meat and used mung bean noodles for a change.');
insert into review values (9, 3, 5, 'My husband and I eat pho often and this was every bit as good as the restaurant. Highly recommend it worth the time it takes to make the broth.
');
insert into review values (10, 3, 5, 'This recipe was really good but I alternated it. Oxtail are too expensive to use to make pho. Believe me pho restaurants do not use oxtails.');
insert into review values (3, 3, 5, 'I do think that 2 oz. of star anise is a misprint though because that was a huge amount like 40 or so of them');

-- populate table rate
insert into rate values (11, 18, 1, 'For dinner we ordered the shrimp enchiladas, chicken enchiladas, chicken burrito, chimichangas, and steak quesadillas. Everything was so tasty and amazing. I wasnt surprised because the food at the FiDi location is the best so I figured this location would be just as good and it was!!! The enchiladas with the green sauce is to die for. My go to at the FiDi location is usually the chicken enchiladas but I decided to try something new and the shrimp enchiladas did not disappoint.');
insert into rate values (5, 12, 1, 'My only critique would be that the rice could of used more vingaer and for them to use real wasabi. Also the variety of fish in stock wasnt a lot but hopefully that can change over time. The cost justify the quality youre getting. A solid 4 stars.');
insert into rate values (10, 2, 1, 'For dinner we ordered the shrimp enchiladas, chicken enchiladas, chicken burrito, chimichangas, and steak quesadillas. Everything was so tasty and amazing. I wasnt surprised because the food at the FiDi location is the best so I figured this location would be just as good and it was!!! The enchiladas with the green sauce is to die for. My go to at the FiDi location is usually the chicken enchiladas but I decided to try something new and the shrimp enchiladas did not disappoint.');
insert into rate values (4, 16, 1, 'In terms of omakase, they had a few options but the one we chose was the 87 dollar version which include sashimi and sushi.');
insert into rate values (2, 12, 1, 'Ambience was good, service was no nonsense but friendly.');
insert into rate values (10, 9, 0, 'Great lattes and cold drinks as well. Nice to see a place carrying local coffee and products in Times Square! Excited to make it a part of my morning commute as it is much less crowded than the chain coffee shops around here.');
insert into rate values (1, 2, 1, 'The chicken nachos were delicious and the atmosphere was great. The frozen margaritas were a little on the weak side. Would probably return for a work happy hour but was pretty disappointed about the lack of free tequila and beer we read about!');
insert into rate values (16, 7, 1, 'Great lattes and cold drinks as well. Nice to see a place carrying local coffee and products in Times Square! Excited to make it a part of my morning commute as it is much less crowded than the chain coffee shops around here.');
insert into rate values (17, 16, 1, 'For dinner we ordered the shrimp enchiladas, chicken enchiladas, chicken burrito, chimichangas, and steak quesadillas. Everything was so tasty and amazing. I wasnt surprised because the food at the FiDi location is the best so I figured this location would be just as good and it was!!! The enchiladas with the green sauce is to die for. My go to at the FiDi location is usually the chicken enchiladas but I decided to try something new and the shrimp enchiladas did not disappoint.');
insert into rate values (2, 1, 0, 'Brand new. Great design. Odd to hear pop music in a Mexican establishment. Music is a bit loud. It should be background.');
insert into rate values (16, 17, 1, 'Id have to say that each piece was fresh and had their own slight unique flavor twist to it, pushing the line between traditional edomae and fusion. The Hokkaido uni and the ocean trout topped with cook seaweed was the highlights of the meal. But each piece served was really something special.');
insert into rate values (1, 17, 0, 'For dessert, we ordered the chocolate drizzled churros and they were delicious too! They even came with some fresh fruit (blueberries and strawberries).');
insert into rate values (18, 2, 1, 'The counter is on the left side, and so is the menu. It can get pretty busy with 30 min wait times. I recommend checking the website and see how busy their store is.');
insert into rate values (12, 10, 1, 'Great place to stop in from a chaotic Times Square adventure! The coffee is great, the drinks are creative and the staff is very nice and hospitable. Cant wait to stop in again. Without a doubt 5 stars from me!!');
insert into rate values (20, 11, 0, 'In terms of omakase, they had a few options but the one we chose was the 87 dollar version which include sashimi and sushi.');
insert into rate values (20, 19, 1, 'I first heard about this place through Instagram post. The drinks looked creative so I made it a point to give it try while in the city. Located inside American Eagle in Times Square they serve up the coolest non-alcoholic beverages. You have an array of options from tea, soda, coffee, latte, water and more. Theres countertops (with phone chargers) so youre able to stand and enjoy your beverage. This visit I opted for the Pegasus latte which was not only beautiful but tasted just as good as it looked. Great staff and great service. This is a must try if you are in the area. Im sure Ill be back soon!');
insert into rate values (15, 8, 1, 'Ambience was good, service was no nonsense but friendly.');
insert into rate values (6, 6, 0, 'Fish was high quality but portions were small. $57 for 9 pieces and a hand roll which is fair but on the expensive side.');
insert into rate values (18, 10, 0, 'The chicken nachos were delicious and the atmosphere was great. The frozen margaritas were a little on the weak side. Would probably return for a work happy hour but was pretty disappointed about the lack of free tequila and beer we read about!');
insert into rate values (3, 17, 0, 'Id have to say that each piece was fresh and had their own slight unique flavor twist to it, pushing the line between traditional edomae and fusion. The Hokkaido uni and the ocean trout topped with cook seaweed was the highlights of the meal. But each piece served was really something special.');