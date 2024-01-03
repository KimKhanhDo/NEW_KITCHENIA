-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: kitchenia
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Cookware',1),(2,'Bakeware',2),(3,'Tabletop',3),(4,'Accessories',4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT 'null',
  `brand` varchar(100) DEFAULT 'null',
  `price` double DEFAULT '0',
  `image` varchar(200) DEFAULT 'null',
  `category` varchar(200) NOT NULL DEFAULT 'null',
  `quantity` int DEFAULT '0',
  `description` varchar(500) DEFAULT 'null',
  `category_id` int DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'10-Piece Hard Anodized Ceramic Nonstick Cookware Set','KITCHENAID',229.99,'cookware1.webp','Cookware',100,'CERAMIC 1.5-quart saucepan with lid, 3-quart saucepan with lid, 6-quart stockpot with lid, 3-quart sauté pan with lid, 8.25-inch frying pan, 10-inch frying pan',1,1),(2,'Stainless Steel 11-Piece Cookware Set','AYSHA CURRY',149.99,'cookware2.webp','Cookware',100,'1.5-Quart Saucepan with Lid, 2-Quart Saucepan with Lid, 3-Quart Sauté with Lid, 6-Quart Stockpot with Lid, 8.5-Inch Frying Pan, 10-inch Frying Pan, 11.5-Inch Spatula',1,1),(3,'Cucina 12-Piece Nonstick Cookware Set','RACHAEL RAY',159.99,'cookware3.webp','Cookware',100,'1-Quart and 3-Quart Saucepans with Lids, 6-Quart Stockpot with Lid, 8.5-Inch and 10-Inch Frying Pans, 3-Quart Sauté Pan with Lid, Slotted Turner and Spoon',1,1),(4,'Advanced Home 11-Piece Cookware Set','ANOLON',299.99,'cookware4.webp','Cookware',100,'1.5-Quart Covered Saucepan, 3-Quart Covered Saucepan, 8-Quart Covered Stockpot, 4-Quart Covered Sauté with Helper Handle, 8.5-Inch Skillet, 12-Inch Covered Deep Skillet with Helper Handle and Lid',1,1),(5,'Signature French Oven Cerise 28cm','LE CREUSET',750,'cookware5.jpeg','Cookware',100,'Made in France, this Le Creuset Signature French Oven is perfectly designed for stews, roasts, soups, casseroles and baking. It’s an iconic piece and will quickly become your one-stop pot for memorable meals with an intense depth of mouth-watering flavour.',1,0),(6,'Combo Cooker 26cm (3L)','LOGGE CAST IRON',169,'cookware6.webp','Cookware',100,'The Lodge Cast Iron Combo Cooker is a versatile piece of cookware that allows you to prepare almost any recipe. The deep skillet can be used for frying, while the Dutch oven is great for Soups, Stews, and Braised dishes.',1,0),(7,'Anolon Endurance+ Skillet Triple Pack','ANOLON',149,'cookware7.webp','Cookware',100,'This pack includes three frypans in different sizes, so you can tackle any recipe with ease. The durable construction in these pans ensures that your cookware will last for years to come.',1,0),(8,'Induction Frypan & Saute 28cm with Detachable Handle Set 2 Piece','WOOL DIAMOND',299.99,'cookware8.webp','Cookware',100,'This incredible kitchen companion features a 28cm size frypan & saute pan with lid, making it perfect for quick and easy meals.',1,0),(9,'Saucepan Set 3 Piece','ESSTEELE PER VITA',269,'cookware9.webp','Cookware',100,'The Essteele Per Vita Saucepan Set of 3 is the perfect choice for any kitchen. The sleek design and classic style of these pans will make a great addition to any kitchen, and the functional lid ensures that your meals retain all their flavor and nutrients. ',1,0),(10,'Nonstick Bakeware Set','AYESHA CURRY',59.99,'bakeware1.webp','Bakeware',120,'BAKE LIKE AYESHA: 5-piece nonstick baking pan set has all the essentials for home chefs who emulate Ayesha Curry\'s signature style of stylish simplicity',2,1),(11,'4-Piece Toaster Oven Baking Set','AYESHA CURRY',59.99,'bakeware2.webp','Bakeware',120,'Pop! Put that toaster oven to work (or bake smaller portions in a normal oven) with this clever toaster oven bakeware set. Constructed from high-performance steel, this mini-me set has everything you need for toaster oven baking and features excellent warp resistance for great results, recipe after recipe. Diamond textured surface assists with both enhanced browning and easy food release.',2,1),(12,'Nonstick Bakeware Set','RACHAEL RAY',89.9,'bakeware3.webp','Bakeware',120,'NONSTICK BAKEWARE 9-Inch x 13-Inch Covered Cake Pan, 10-Inch x 15-Inch Cookie Pan with Crisper Insert, Loaf Pan w/ Insert, Two 9-Inch Round Cake Pans, 9-Inch Square Cake Pan, 9-Inch x 13-Inch Cookie Pan',2,1),(13,'Covered Cake Pan & Muffin Pan','RACHAEL RAY',39.99,'bakeware4.webp','Bakeware',120,'Get three incredibly versatile pans for baking, crisping and roasting. Made from heavy gauge steel, these nonstick cookie pans resist warping and feature long-lasting nonstick that provides excellent food release. Oven safe to 450°F.',2,1),(14,'Cucina 10\'x15\' Crisper Pan Set','RACHAEL RAY',24.99,'bakeware5.webp','Bakeware',120,'Prepare foods with oven-crisped goodness when baking or roasting with this heavy gauge steel crisping sheet set. Durable cookie sheets are finished with long-lasting, nonstick inside and out for outstanding food release with quick cleanup. Oven safe to 450°F.',2,0),(15,'-Piece Nonstick Cookie Pan Set','RACHAEL RAY',29.99,'bakeware6.webp','Bakeware',120,'Make a triple play of baking and roasting favorites with this nonstick cookie pan set. Crafted from durable, high-performance steel, these sheet pans boast excellent warp resistance, recipe after recipe. A textured diamond pattern assists with enhanced browning and easy food release, and extended edges provide a sturdy grip for pulling pans in and out of a hot oven.',2,0),(16,'9\'x13\' Ceramic Baking Dish','RACHAEL RAY',39.99,'bakeware7.webp','Bakeware',120,'A stylish profile gives this baker from Rachael Ray just the right accent of chic, table-ready design, while the large cooking area offers plenty of room for family-sized meals. High-quality, durable ceramic heats foods evenly and features a stain-resistant glazed finish so it works perfectly as a lasagna pan. Oven safe to 450°F and microwave, freezer, and dishwasher safe, too.',2,0),(17,'Lasagna Lover Pan','RACHAEL RAY',39.99,'bakeware8.webp','Bakeware',120,'Bake delicious lasagna, cheesy scalloped potatoes, or holiday casseroles with this durable ceramic baking dish. Wide handles are comfortable to hold and the versatile casserole dish is conveniently safe for use in the freezer, microwave, and dishwasher. Oven safe to 500°F.',2,0),(18,'Oval Baker Set','RACHAEL RAY',49.99,'bakeware9.webp','Bakeware',120,'Bake and serve lasagna, rich mac and cheese, or an apple crumble with this versatile baking dish set. These non-porous, ceramic baking dishes are designed to be table ready for easy bake and serve dining. Microwave, freezer, and oven safe to 500°F, this set of bakers is also dishwasher safe for quick cleanup.',2,0),(20,'Cucina 16-Piece Dinnerware Set','RACHAEL RAY',299.99,'tabletop1.webp','Tabletop',140,'Crafted from durable ceramic and glazed with earthy, warm color, this dinnerware set offers handcrafted texture and an antiqued look. Oven safe up to 250°F for 30 minute warm-ups as well as microwave, freezer and dishwasher safe.',3,1),(21,'Dinner Set of 12','DENBY HALO SPECKLE',324,'tabletop2.webp','Tabletop',140,'Featuring a durable, chip resistant glaze, this Halo set is the perfect addition for any family mealtime or get together. Handcrafted in England at Denby Pottery using locally sourced clay just behind our factory.\n\nHalo is a unique design which incorporates two tones of glaze to produce a striking, speckled finish. Produced at Denby Pottery in Derbyshire, Halo has been handcrafted to the highest-standard.',3,1),(22,'12-Piece Dinner Set White','CASERO ORA',159.95,'tabletop3.webp','Tabletop',140,'Casero Ora White Dinner Set 12 Piece is the perfect choice for those who want to enjoy a beautiful and elegant dining experience. The clean and simple design of this set will complement any décor. Whether you are hosting a dinner party or enjoying an intimate meal with family, this set will help make every moment special.',3,1),(23,'Dinner Set Duck Egg','ECOLOGY SPECKLE',99.95,'tabletop4.jpeg','Tabletop',140,'Stand out from the crowd with Ecology’s Speckled 12 Piece Duck Egg Dinner Set. Organically shaped and featuring a subtle dimpled texture, the earthy design and natural colour will add style to any home.  Here at Kitchenia, we love the earthy tones of the duck egg blue and its construction of durable stoneware.',3,1),(24,'Conran 16 Piece Dinner Set','PORTMEIRION SOPHIE',355,'tabletop5.webp','Tabletop',140,'The Portmeirion Sophie Conran 16 Piece Dinner Set combines style and function to create a collection perfect for modern day living. Designed by Sophie Conran and winner of the ELLE Decoration Award for Best in Kitchens, this oven-to-tableware set is sure to impress.',3,0),(25,'Pacific Pasta Bowls 22cm (Set of 6)','ROYAL DOULTON',139,'tabletop6.webp','Tabletop',140,'Dress up your dinner table with the Pacific Set of 6 22cm Pasta Bowls. The mix and match style designs create a stunning effect when serving pastas, currys, risottos and other sauce-based dishes in these bowles.\n\nCrafted from chip-resistant porcelain, the striking patterns feature splash, dots, lines, texture, circle and brushstroke designs evoke a homemade, organic look and feel.',3,0),(26,'Pacific Cereal Bowls 16cm (Set of 6)','ROYAL DOULTON',118,'tabletop7.webp','Tabletop',140,'Serve anything from your morning fruit salad to side servings of creamy potato salad in Royal Doulton\'s Set of 6 Pacific 16cm Cereal Bowls.\n\nGenerously sized, they\'re beautifully crafted from chip-resistant porcelain with the striking patterns featuring splash, dots, lines, texture, circle and brushstroke designs which evoke a homemade, organic look and feel.',3,0),(27,'Pacific Mugs Set 6 Piece','ROYAL DOULTON',125,'tabletop8.webp','Tabletop',140,'Elevate your morning cup of coffee and take some \'me-time\' that you know you deserve with the elegant 420ml Pacific Mugs Set 6 Piece.\n\nGenerously sized, they\'re beautifully crafted from chip-resistant porcelain with the striking patterns featuring splash, dots, lines, texture, circle and brushstroke designs which evoke a homemade, organic look and feel.',3,0),(28,'16 Piece Pacific Lines Dinner Set','ROYAL DOULTON',38.9,'tabletop9.webp','Tabletop',140,'Royal Doulton\'s elegant Pacific Lines 16 Piece Dinner Set makes a beautiful addition to any home. Perfect for new homeowners, students or if you just want to shake up your existing casual tableware!\n\nCrafted from chip-resistant porcelain, the striking pattern is inspired by the natural seashore and distant horizon.',3,0),(29,'Ceramic 21-Ounce Bacon Grease Jar','AYESHA CURRY',49.99,'accessories1.webp','Accessories',160,'Crafted from durable ceramic, this bacon grease collection jar boasts a bold, modern color with a stain-resistant glaze finish for easy cleanup. The snug-fitting lid is easy to open and close to preserve the contents between use, so cooks can be sure the grease is good to go when adding a dollop to shrimp and grits, fried chicken, or Southern Mustard Greens.',4,1),(30,'Stainless Steel 3-Piece Nesting Mixing Bowl Set','AYESHA CURRY',59.99,'accessories2.webp','Accessories',160,'These made-to-last stainless steel mixing bowls nest conveniently together for easy storage and feature a rubberized base, so they won\'t slide around on the countertop when you\'re beating eggs for a batch of Ayesha\'s Prosciutto Egg Cups With Asparagus. ',4,1),(31,'4-Piece Cooking Utensil Set','AYESHA CURRY',24.99,'accessories3.webp','Accessories',160,'The bold, colorful kitchen tools easily reach into mixing bowls and jars, corners of baking and cooking pans, and are perfect for dishing out rich pasta meals or scraping batter from the mixing bowl.',4,1),(32,'Tool Crock','AYESHA CURRY',59.99,'accessories4.webp','Accessories',160,'Keep your spoons, spatulas, servers and scoops in hand\'s reach with this stylish ceramic tool crock. Keep your utensils and gadgets organized and on display or even go crazy and use the crock as a serving bowl for gazpacho or as an ice bucket for a snazzy cocktail party. Either way, cleanup is easy with this versatile serve and store utensil holder that\'s conveniently dishwasher, freezer and microwave safe.\n',4,1),(33,'4-Way Box Grater','RACHAEL RAY',49.99,'accessories5.webp','Accessories',160,'Slice, julienne, and grate everything from veggies to chocolate to cheeses with the versatile Rachael Ray Tools & Gadgets Box Grater. One of Rach\'s go-to kitchen tools, this durable box grater makes short order out of slicing cucumbers and carrots with dual-action slicing and julienne blades honed from ultra-sharp, etched stainless steel for effortless cuts in double-time. ',4,0),(34,'6-Piece Tools Set','RACHAEL RAY',28.99,'accessories6.webp','Accessories',160,'More payment options\nEverything you need to get cooking and baking is right here in this kitchen utensils set. Whisk eggs, flip pancakes, and dish out bowls of soup with these sturdy nylon utensils that are gentle enough for use on nonstick cookware. ',4,0),(35,'2-Piece Evoo Oil And Vinegar Bottle Set','RACHAEL RAY',69,'accessories7.webp','Accessories',160,'Shake things up in the kitchen with a set of Rach\'s iconic EVOO bottles that are perfect for dispensing oil, vinegar, or other cooking sauces. Featuring built-in handles for a balanced, easy grip, the bottles have a stainless steel pour spout and are contoured for precision pouring. ',4,0),(36,'Nesting Mixing Bowl Set','RACHAEL RAY',48,'accessories8.webp','Accessories',160,'Mix pancake batter or dress side salads with these durable melamine nesting mixing bowls. Built-in pour spouts make it easy to get every last drop while the rubberized bottom keeps the bowls from slipping on countertops.',4,0),(37,'6-Piece Knife Block Set','RACHAEL RAY',119.99,'accessories9.webp','Accessories',160,'Cut and chop ingredients for family-sized meals with this premium quality Japanese stainless steel set. Knives feature handles equipped with colorful silicone grips for comfort and he knife set comes with a beautiful wood block for decorative and organized countertop storage.',4,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-03 12:21:49
