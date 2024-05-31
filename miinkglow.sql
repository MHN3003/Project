-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 31 mai 2024 à 18:26
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `miinkglow`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`category`) VALUES
(' exfoliator'),
('cleanser'),
('essence&toners'),
('mask'),
('moisturizer'),
('serum'),
('sunscreen');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idC` int(8) NOT NULL,
  `username` varchar(35) NOT NULL,
  `clientfirstname` varchar(40) NOT NULL,
  `clientlastname` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `birthdate` date NOT NULL,
  `skintype` varchar(20) NOT NULL,
  `phonenumber` int(11) NOT NULL,
  `FullAddress` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idC`, `username`, `clientfirstname`, `clientlastname`, `email`, `password`, `gender`, `birthdate`, `skintype`, `phonenumber`, `FullAddress`) VALUES
(12, 'Username', '1stname ', 'lastname', 'jdk@gmail.com', 'hhh', 'female', '2002-04-09', '', 688990055, 'fulladress');

-- --------------------------------------------------------

--
-- Structure de la table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderID` int(6) NOT NULL,
  `productID` int(5) NOT NULL,
  `clientID` int(8) NOT NULL,
  `quantity` int(5) NOT NULL,
  `shippingPlace` varchar(40) NOT NULL,
  `totalPrice` varchar(10) NOT NULL,
  `shippingStatu` varchar(20) NOT NULL,
  `orderStatu` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `orderdetails`
--

INSERT INTO `orderdetails` (`orderID`, `productID`, `clientID`, `quantity`, `shippingPlace`, `totalPrice`, `shippingStatu`, `orderStatu`, `date`) VALUES
(1, 3, 12, 1, 'Adrar', '24.00', 'ongoing', 'ongoing', '0000-00-00 00:00:00'),
(2, 3, 12, 1, 'Chlef', '24.00', 'ongoing', 'ongoing', '2024-05-31 13:08:43'),
(5, 11, 12, 1, 'Adrar', '32.00', 'ongoing', 'ongoing', '2024-05-31 13:12:52'),
(6, 4, 12, 1, 'Adrar', '20.00', 'ongoing', 'ongoing', '2024-05-31 13:12:52'),
(7, 6, 12, 1, 'Adrar', '35.00', 'ongoing', 'ongoing', '2024-05-31 13:58:10');

-- --------------------------------------------------------

--
-- Structure de la table `prefecture`
--

CREATE TABLE `prefecture` (
  `prefecture` varchar(15) NOT NULL,
  `price` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prefecture`
--

INSERT INTO `prefecture` (`prefecture`, `price`) VALUES
('Adrar', '$9.00'),
('Chlef', '$9.00');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `proID` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ingredients` text NOT NULL,
  `instructions` text NOT NULL,
  `volume` varchar(10) NOT NULL,
  `price` varchar(6) NOT NULL,
  `rating` float NOT NULL,
  `category` varchar(30) NOT NULL,
  `skintype` varchar(30) NOT NULL,
  `skinConcerns` varchar(50) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `isnew` varchar(5) NOT NULL DEFAULT 'FALSE',
  `detail1` varchar(1000) NOT NULL,
  `detail2` varchar(1000) NOT NULL,
  `detail3` varchar(1000) NOT NULL,
  `salles` int(6) NOT NULL,
  `exist` varchar(5) NOT NULL DEFAULT 'FALSE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`proID`, `name`, `description`, `ingredients`, `instructions`, `volume`, `price`, `rating`, `category`, `skintype`, `skinConcerns`, `image`, `isnew`, `detail1`, `detail2`, `detail3`, `salles`, `exist`) VALUES
(1, 'Glow Serum : Propolis + Niacinamide', 'This serum is made for those struggling with enlarged pores and skin inflammation. With a blend of 60% propolis extract and 2% niacinamide, it skillfully manages sebum production while ensuring your skin remains hydrated. ', 'Propolis Extract, Dipropylene Glycol, Glycerin, Butylene Glycol, Water, Niacinamide, 1,2-Hexanediol, Melia Azadirachta Flower Extract, Melia Azadirachta Leaf Extract, Sodium Hyaluronate, Curcuma Longa (Turmeric) Root Extract, Ocimum Sanctum Leaf Extract, Theobroma Cacao (Cocoa) Seed Extract, Melaleuca Alternifolia (Tea Tree) Extract, Centella Asiatica Extract, Corallina Officinalis Extract, Lotus Corniculatus Seed Extract, Calophyllum Inophyllum Seed Oil, Betaine Salicylate, Sodium Polyacryloyldimethyl Taurate, Tromethamine, Polyglyceryl-10 Laurate, Caprylyl Glycol, Ethylhexylglycerin, Dextrin, Pentylene Glycol, Octanediol, Tocopherol, Xanthan Gum, Carbomer', 'Apply 2-3 drops of serum onto the face. Pat gently to aid absorption.Apply gently to your face and neck, focusing on areas that need extra hydration or brightness. Tap lightly with your fingertips until the serum is fully absorbed into your skin.', '30ml ', '$17.00', 3.375, 'serum', 'DRY SKIN', ' ACNE & BREAKOUTS', 'https://beautyofjoseon.com/cdn/shop/files/1_8f4b1947-4539-4aff-b2f7-18192c23cbf8.png?v=1705211384&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_187e8b57-fbb7-4c2a-8a0f-1f03c4a9aff7.png?v=1705211385&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/GS2.jpg?v=1715287685&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/4_aaa8dcaa-7f08-4ca6-8a34-96001611c2e1.png?v=1715045034&width=3000', 0, 'FALSE'),
(2, 'Relief Sun : Rice + Probiotics (SPF50+ PA++++)', 'Relief Sun is a lightweight and creamy type organic sunscreen that\'s comfortable on skin. Even if you apply a large amount several times, it is not sticky and gives a moist finish like that of a light moisturizing cream. Containing 30% rice extract and grain fermented extracts, it provides moisture and nourishment to the skin.', 'Water, Oryza Sativa (Rice) Extract (30%), Dibutyl Adipate, Propanediol, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Polymethylsilsesquioxane, Ethylhexyl Triazone, Niacinamide, Methylene Bis-benzotriazolyl Tetramethylbutylphenol, Coco-caprylate/Caprate, Caprylyl Methicone, Diethylhexyl Butamido Triazone, Glycerin, Butylene Glycol, Oryza Sativa (Rice) Germ Extract, Camellia Sinensis Leaf Extract, Lactobacillus/Pumpkin Ferment Extract, Bacillus/Soybean Ferment Extract, Saccharum Officinarum (Sugarcane) Extract, Macrocystis Pyrifera (Kelp) Extract, Cocos Nucifera (Coconut) Fruit Extract, Panax Ginseng Root Extract, Camellia Sinensis Leaf Extract, Monascus/Rice Ferment, Pentylene Glycol, Behenyl Alcohol, Poly C10-30 Alkyl Acrylate, Polyglyceryl-3 Methylglucose Distearate, Decyl Glucoside, Tromethamine, Carbomer, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, 1,2-Hexanediol,Sodium Stearoyl Glutamate, Polyacrylate Crosspolymer-6, Ethylhexylglycerin, Adenosine, Xanthan Gum, Tocopherol, Lactobacillus/Rice Ferment, Aspergillus Ferment, Saccharomyces/Rice Ferment Filtrate', 'At the last step of skin care routine, evenly spread a generous amount over areas vulnerable to sun exposure.', '50ml ', '$18.00', 2.85714, 'sunscreen', 'OILY SKIN', 'DULLNESS & UNEVEN TONE', 'https://beautyofjoseon.com/cdn/shop/files/2_29779981-09b1-41e9-a788-5e7892f0f13d.png?v=1705211868&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/3_0346b3ff-887c-464f-a224-8e8fe30ace61.png?v=1705211869&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/Relief-2.jpg?v=1715287665&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/2_e902a154-25c0-44f5-8817-59e860dd2fbb.png?v=1712695785&width=3000', 0, 'FALSE'),
(3, 'Dynasty Cream', 'Meet the \'Dynasty Cream,\' our very first product here at Beauty of Joseon, and a long-time favorite of many of our customers. Its firm and creamy texture gives your skin deep, long-lasting moisture and nourishment. This all-in-one cream is filled with good-for-skin ingredients like rice bran water, ginseng water, squalane, and niacinamide. These ingredients help to keep your skin healthy, hydrated, and balanced. Its firm texture sinks into your skin, providing moisture and nourishment from deep within.', 'Water, Oryza Sativa (rice) Bran Water, Glycerin, Panax Ginseng Root Water, Hydrogenated polydecene, 1,2-Hexanediol, Niacinamide, Squalane, Butylene glycol, Propanediol, Dicaprylate/Dicaprate, Cetearyl Olivate, Sorbitan Olivate, Ammonium acryloyldimethyltaurate/VP Copolymer, Xanthan Gum, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Tromethamine, Carthamus Tinctorius (Safflower) Seed Oil, Hydrogenated Coconut Oil, Glyceryl Acrylate/Acrylic Acid Copolymer, Ethylhexylglycerin, Adenosine, Caprylic/Capric Triglyceride, Disodium EDTA, Hyaluronic Acid, Hydrolyzed Hyaluronic Acid, Sodium Hyaluronate, Honey Extract, Ceramide NP, Hydrogenated Lecithin, Coptis Japonica Root Extract, Raphanus Sativus (Radish) Seed Extract, Lycium Chinense Fruit Extract, Theobroma Cacao (Cocoa) Seed Extract, Phellinus Linteus Extract, Dextrin, Scutellaria Baicalensis Root Extract', 'After your regular skincare routine, apply an appropriate amount of Dynasty Cream to your face and neck. Gently pat with your fingertips to enhance absorption.', '50ml', '$24.00', 2.5, 'moisturizer', 'DRY SKIN', 'WRINKLES', 'https://beautyofjoseon.com/cdn/shop/files/1_47b12b73-e25f-482c-8d6b-10eaddebdad8.png?v=1705211265&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_da4f386b-3762-4575-b8ec-9929772dee85.png?v=1705211266&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/dynasty_86aec398-86ba-488f-8dca-c7bb1fca3e08.jpg?v=1715287688&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/dynasty-cream.jpg?v=1715287686&width=3000', 0, 'FALSE'),
(4, 'Ginseng Cleansing Oil', 'At Beauty of Joseon, we value cleansing as the most important step in skincare. If neglected, skin impurities and sebum can build up in your pores, potentially causing skin inflammation. Our cleansing oil gently emulsifies and removes these impurities, ensuring a clean and refreshed complexion.\r\nEnriched with ginseng seed oil, our cleansing oil imparts a subtle, calming scent, transforming your skincare routine into a peaceful ritual.\r\n', 'Glycine Soja (Soybean) Oil, Cetyl Ethylhexanoate, Sorbeth-30 Tetraoleate, Isododecane, Olea Europaea (Olive) Fruit Oil, Camellia Japonica Seed Oil, Hydrogenated Coconut Oil, Octyldodecanol, Polybutene, Caprylic/Capric Triglyceride, Water, Tocopherol, Salvia Officinalis (Sage) Oil, Panax Ginseng Seed Oil(1000 ppm), Artemisia Vulgaris Oil, Ocimum Basilicum (Basil) Oil, Corylus Avellana (Hazelnut) Seed Oil, Nigella Sativa Seed Oil, Butylene Glycol, Panax Ginseng Berry Extract(1.1 ppb), Glycerin, 1,2-Hexanediol, Methylpropanediol, Panax Ginseng Root Extract, Panax Ginseng Root Extract(0.3 ppb), Ethyl Hexanediol, Panax Ginseng Extract(0.1 ppb), Panax Ginseng Leaf/Stem Extract(0.1 ppb), Ethylhexylglycerin', 'After pumping cleansing oil 1-2 times, gently massage onto a dry face. Then gently rinse with lukewarm water and cleanse with a foam cleanser once again.', '210ml', '$20.00', 4, 'cleanser', 'OILY SKIN', ' ACNE & BREAKOUTS', 'https://beautyofjoseon.com/cdn/shop/files/1_de2af4bd-f530-45da-88bd-8710eb65e937.png?v=1705211261&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_131e5382-f055-4677-b234-11fcfb13a172.png?v=1715045533&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/GCO-thumb.jpg?v=1715287668&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/4_27535c13-a852-4789-98f2-465adc7d6a0d.png?v=1715044625&width=3000', 0, 'FALSE'),
(6, 'Watermelon Glow PHA+BHA Pore-Tight Tone', 'Hydrate skin and tighten pores at once with the ultra-gentle Watermelon Glow PHA + BHA Pore-Tight Toner for supple, smooth skin. An essential part of any good skin-care routine, toners help prep and plump skin to readily absorb the rest of your routine. Our innovative formula contains a balance of hydrating ingredients and pore-tightening actives to equally minimize the look of pores and hydrate skin, with gentle yet effective pore actives such as PHA and BHA. \r\n', 'Opuntia Ficus-Indica Stem Extract, Citrullus Lanatus (Watermelon) Fruit Extract, Glycerin, Hyaluronic Acid, Water/Aqua/Eau, Gluconolactone, Sodium Polyglutamate, Betaine Salicylate, Salix Alba (Willow) Bark Extract, Melaleuca Alternifolia (Tea Tree) Extract, Hibiscus Sabdariffa Flower Extract, Lactobacillus/Watermelon Fruit Ferment Extract, Cucumis Sativus (Cucumber) Fruit Extract, Saccharum Officinarum (Sugarcane) Extract/Saccharum Officinarum/Extrait de canne à sucre, Glycyrrhiza Glabra (Licorice) Root Extract, Scutellaria Baicalensis Root Extract, Paeonia Suffruticosa Root Extract, Brassica Oleracea Capitata (Cabbage) Leaf Extract, Ipomoea Batatas Root Extract, Sorbitan Oleate, Levulinic Acid, Sodium Levulinate, Pyrus Communis (Pear) Fruit Extract, Rosa Damascena Flower Water, Fragaria Ananassa (Strawberry) Fruit Extract, Vaccinium Angustifolium (Blueberry) Fruit Extract, Cucumis Melo Seed Extract, Iris Florentina Root Extract, Vetiveria Zizanoides Root Oil.', 'To Use As A Toner:\r\nCleanse, and then move on to this first liquid treatment in your routine. Dispense into the palm of hands and gently pat into skin—don’t wipe away or rub. Follow with your serum, moisturizer, and SPF or overnight mask (depending on the time of day!) If you prefer to use a reusable cotton pad, you can dispense the product onto the cotton pad and gently pat into skin. Again, don’t wipe or rub to minimize friction. Avoid eye area. During the day, follow with sunscreen.', '150ml', '35$', 0, 'essence&toners', 'COMBINATION SKIN', 'PORES & SEBUM', 'https://www.glowrecipe.com/cdn/shop/products/GlowToner_1200x1500_d25506e2-72b8-4654-9e64-4cf5af103b20_600x.jpg?v=1592838412', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/GLOW_TONER_7580_1200x1500_1_600x.jpg?v=1707841794', 'https://www.glowrecipe.com/cdn/shop/products/GlowToner_1200x1500_2_600x.jpg?v=1707841794', 'https://www.glowrecipe.com/cdn/shop/files/PDP56_600x.png?v=1707841794', 0, 'FALSE'),
(7, 'Watermelon Glow Niacinamide Dew Drop', 'Reveal a dewy glow instantly and over time with this niacinamide-infused highlighting serum, formulated without mica, glitter, or pearls. This first of its kind highlighting skincare + makeup hybrid helps visibly brighten skin and deliver an effortless glow instantly and over time, while helping to reduce hyperpigmentation and without leaving a gray cast.', 'Aqua/Water/Eau, Propanediol, Glycereth-26, Glycerin, Niacinamide, 2,3-Butanediol, 1,2-Hexanediol, Cetyl Ethylhexanoate, Citrullus Lanatus Fruit Extract, Sodium Hyaluronate, Eclipta Prostrata Extract, Melia Azadirachta Leaf Extract, Polyglyceryl-3 Methylglucose Distearate, Tromethamine, Glyceryl Stearate, Carbomer, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Ethylhexylglycerin, Xanthan Gum, Polyquaternium-51, Moringa Oleifera Seed Oil, Fragrance/Parfum, Benzyl Benzoate.', 'For a natural glow and brightening serum:\r\nApply one pump before moisturizer for long-lasting, glowing skin results.\r\nAs a priming step:\r\nApply one to two pumps as the last step in your skincare routine before makeup.\r\nFor a maximum glow:\r\nOn a no-makeup day, apply one to two pumps as the last step of your entire routine.', '40ml', '35$', 4, 'serum', 'DRY SKIN', 'WRINKLES', 'https://www.glowrecipe.com/cdn/shop/files/05_03_23_PDP_DD_ALLURE_WINNER_1_600x.jpg?v=1683121296', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/glowrecipe_dewdrops_0484_600x.jpg?v=1707841569', 'https://www.glowrecipe.com/cdn/shop/products/B_A_CLAIMS_SERUM_LP_pdp-14_e1b7ff56-dbf1-4f88-93ab-bc857eadee56_600x.png?v=1707841569', 'https://www.glowrecipe.com/cdn/shop/products/PDP_DD_Fullsize_and_BOTF_6c3a6918-8bc6-4f3a-9de7-d4a8e13b0666_600x.jpg?v=1707841569', 0, 'FALSE'),
(8, 'Watermelon Glow Pink Juice oil-Free Refillable Moisturizer', 'This lightweight gel moisturizer instantly hydrates and refreshes skin. The oil-free and non-comedogenic formula is packed with watermelon, licorice root, and botanical extracts to soothe and visibly boost radiance while hyaluronic acid and glycerin lock in moisture for long-lasting hydration.', 'Glycerin, Paeonia Suffruticosa Root Extract, Cetearyl Olivate, Glutamic Acid, Sorbitan Olivate, Sodium Hyaluronate, Jasminum Grandiflorum (Jasmine) Flower Wax, Cetyl Alcohol, Cyamopsis Tetragonoloba (Guar) Gum, Xanthan Gum, Apricot Kernel Amino Acids, Alkanna Tinctoria Root Extract, Beta-Glucan, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Brassica Oleracea Capitata Leaf (Cabbage) Extract, Ipomoea Batatas Root Extract, Olea Europaea (Olive) Leaf Extract, Hydrolyzed Corn Protein, Hydrolyzed Soy Protein, Hydrolyzed Wheat Protein, Vaccinium Angustifolium (Blueberry) Fruit Extract, Scutellaria Baicalensis Root Extract, Fragaria Ananassa (Strawberry) Fruit Extract, Rosa Damascena Flower Water, Pyrus Communis (Pear) Fruit Extract, Cucumis Melo (Melon) Seed Extract, Iris Florentina Root Extract, Vetiveria Zizanoides Root Extract, Butylene Glycol, 1,2-Hexanediol', 'Apply 1-2 pumps as the last step of your skincare routine both morning and night. Gently pat into skin until fully absorbed.', '50ml', '40$', 0, 'moisturizer', 'COMBINATION SKIN', 'DRYNESS', 'https://www.glowrecipe.com/cdn/shop/files/12_26_23_PINK_JUICE_REFILL_LAUNCH_PDP2_5133bac5-c015-4c28-ac70-f75c7bb84476_600x.png?v=1703267284', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/files/12_26_23_PINK_JUICE_REFILL_LAUNCH3_54f5a4aa-3d29-473c-bc55-e4082aa640e1_600x.png?v=1703267284', 'https://www.glowrecipe.com/cdn/shop/files/WM_PJ_REFILL_INFOGRAPHICS_2000x20004_1_f2a476b1-415c-41a9-abe0-2c72706316ab_600x.png?v=1703267284', 'https://www.glowrecipe.com/cdn/shop/files/12_26_23_PINK_JUICE_REFILL_LAUNCH5_95bfa0d2-7d9d-41d2-a93d-d8f1c9f40d44_600x.png?v=1703267284', 0, 'FALSE'),
(9, 'Plum Plump Hyaluronic Serum', 'Plump your skin by filling each skin layer with intense, juicy hydration with the Plum Plump Hyaluronic Serum. Its silky, watergel texture is infused with juicy plum and 5 molecular weights of next-gen hyaluronic acid that fill each skin layer with hydration for visibly plumper skin. Formulated with vegan silk protein, this lightweight, oil-free serum deeply hydrates dry, dehydrated skin and diminishes the appearance of visible fine lines for healthy, bouncy, youthful skin.', 'Aqua/Water/Eau, Glycerin, Propanediol, Pentylene Glycol, Pleiogynium Timorense Fruit Extract, Podocarpus Elatus Fruit Extract, Terminalia Ferdinandiana Fruit Extract, Sodium Acetylated Hyaluronate, Sodium Hyaluronate, Tremella Fuciformis Polysaccharide, Acacia Seyal Gum Extract, sr-Spider Polypeptide-1**, Pantothenic Acid, Phospholipids, Sodium Hydroxide, Spirulina Platensis Extract, Raphanus Sativus Root Extract, Caprylyl Glycol, Chlorphenesin, Tetrasodium Glutamate Diacetate, Polyglyceryl-6 Caprylate, Polyglyceryl-4 Caprate, Potassium Sorbate, Propylene Glycol, Leuconostoc/Radish Root Ferment Filtrate, 1,2-Hexanediol, Citric Acid, Ethylhexylglycerin, Hydroxyacetophenone, Carrageenan, Xanthan Gum, Sodium Glycolate, Sodium Formate, Phenoxyethanol, Fragrance/Parfum*. *Natural Fragrance', 'Before moisturizer, dispense 1–2 pumps and gently pat onto slightly damp face and neck until fully absorbed. Apply daily, AM and PM.', '30ml', '$45', 0, 'serum', 'DRY SKIN', 'DULLNESS & UNEVEN TONE', 'https://www.glowrecipe.com/cdn/shop/products/PLUM_20437_PPAGE_600x.jpg?v=1597771795', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/PLUM_20556_PPAGE_600x.jpg?v=1655235565', 'https://www.glowrecipe.com/cdn/shop/products/PLUM_21022_PPAGE_600x.jpg?v=1671159896', 'https://www.glowrecipe.com/cdn/shop/products/B_A_CLAIMS_SERUM_LP_pdp-13_93b363df-05aa-4355-9479-d3ee190bb755_600x.png?v=1655235565', 0, 'FALSE'),
(10, 'Lip Sleeping Mask', 'A leave-on lip mask that delivers intense moisture and antioxidants while you sleep with Berry Fruit Complex™, Murumuru seed and Shea butter.', 'COTTON CANDY DIISOSTEARYL MALATE, HYDROGENATED POLYISOBUTENE, PHYTOSTERYL / ISOSTEARYL / CETYL/STEARYL / BEHENYL DIMER DILINOLEATE, POLYBUTENEHYDROGENATED POLY(C6-14 OLEFIN), MICROCRYSTALLINE WAX / CERA MICROCRISTALLINA / CIRE MICROCRISTALLINE, BUTYROSPERMUM PARKII (SHEA) BUTTER, SYNTHETIC WAX, ETHYLENE/PROPYLENE/STYRENE COPOLYMER, SUCROSE TETRASTEARATE TRIACETATE, MICA, EUPHORBIA CERIFERA (CANDELILLA) WAX / EUPHORBIA CERIFERA CERA / CIRE DE CANDELILLA, FRAGRANCE / PARFUM,  METHICONE, COCOS NUCIFERA (COCONUT) OIL, RED 7 LAKE (CI 15850), BLUE 1 (CI 42090), PENTAERYTHRITYL TETRA-DI-T-BUTYL HYDROXYHYDROCINNAMATE, ASCORBIC ACID, TOCOPHEROL, WATER / AQUA / EAU', 'Apply lip mask in the evening and leave overnight ', '20 g', ' $24', 0, 'mask', 'DRY SKIN', 'DULLNESS & UNEVEN TONE', 'https://cdn.shopify.com/s/files/1/0255/0189/2660/files/PDPImage_1000x1000_LSM_415x415_crop_center.jpg?v=1709058541', 'FALSE', 'https://cdn.shopify.com/s/files/1/0255/0189/2660/products/Sydney-LSM-1000x1000_415x415_crop_center.jpg?v=1709058541%20width=', 'https://cdn.shopify.com/s/files/1/0255/0189/2660/products/LN_LSMSydneyEnhancedPDP_ALT_04_415x415_crop_center.jpg?v=1709655368%20width=', 'https://cdn.shopify.com/s/files/1/0255/0189/2660/products/LN_LSMSydneyEnhancedPDP_ALT_05_415x415_crop_center.jpg?v=1709655368%20width=', 0, 'FALSE'),
(11, 'Glowy Makeup Serum', 'Get your glow on with a lightweight, hydrating glowy makeup serum and glass skin primer that keeps oil in check for visibly smoother skin and long-lasting makeup wear.', 'WATER / AQUA / EAU, GLYCERIN, PEG/PPG-17/6 COPOLYMER, DIGLYCERIN, METHYL GLUCETH-20, PROPANEDIOL, DIMETHICONE, 1,2-HEXANEDIOL, BETAINE, UNDECANE, ACRYLATES/C10-30 ALKYLACRYLATE CROSSPOLYMER, TROMETHAMINE, CAPRYLYLMETHICONE, TRIDECANE, SACCHARIDE HYDROLYSATE, FRUCTOOLIGOSACCHARIDES, SILICA DIMETHYL SILYLATE, MICA, XANTHAN GUM, C30-45 ALKYL CETEARYL DIMETHICONE CROSSPOLYMER, PULLULAN, TITANIUM DIOXIDE (CI77891), ECLIPTA PROSTRATA EXTRACT, OLEA EUROPAEA (OLIVE) FRUIT OIL, LAURYL DIMETHICONE, SYNTHETIC FLUORPHLOGOPITE, MELIA AZADIRACHTA LEAF EXTRACT, CARMINE (CI75470), DIAMOND POWDER, CAESALPINIA SPINOSA FRUIT EXTRACT, MELIA AZADIRACHTA FLOWER EXTRACT, MORINGA OLEIFERA SEED OIL', 'Use as the final step in your skincare routine. Apply 2-3 drops to face. Pat until fully absorbed.', '30 mL', ' $32', 4.28571, 'serum', 'DRY SKIN', 'DULLNESS & UNEVEN TONE', 'https://cdn.shopify.com/s/files/1/0255/0189/2660/products/gms22_415x415_crop_center.jpg?v=1660080478', 'FALSE', 'https://us.laneige.com/cdn/shop/products/gms1.jpg?v=1690480424&width=390', 'https://us.laneige.com/cdn/shop/products/gms15.jpg?v=1690480424&width=390', 'https://us.laneige.com/cdn/shop/products/beauty6.jpg?v=1660080478&width=390', 0, 'TRUE'),
(12, 'Cream Skin Toner & Moisturizer', 'A comforting milky cream and toner hybrid in a refillable bottle, enriched with nourishing ceramide and peptide for radiant-looking, hydrated skin. Packaging may vary.', 'Full Ingredient List:\r\nWATER / AQUA / EAU, BUTYLENE GLYCOL, GLYCERIN, LIMNANTHES ALBA (MEADOWFOAM) SEED OILISOPENTYLDIOL, 1, 2-HEXANEDIOL, SQUALANE, POLYGLYCERYL-10 STEARATE, GLYCERYL STEARATE CITRATE, SODIUM STEAROYL GLUTAMATE, INULIN LAURYL CARBAMATE, GLYCERYL CAPRYLATE, ETHYLHEXYLGLYCERIN, PROPANEDIOL, DISODIUM EDTA, CARBOMER, MANNITOL, ACRYLATES/STEARYL METHACRYLATE COPOLYMER, TREMELLA FUCIFORMIS SPOROCARP EXTRACT', 'Just pour, press and pat! Apply gently some drops after cleansing your skin.', '170 mL', '$36', 4.33333, 'moisturizer', 'SENSITIVE SKIN', 'DULLNESS & UNEVEN TONE', 'https://cdn.shopify.com/s/files/1/0255/0189/2660/files/CS1.5ADPDP11000x1000copy-100_415x415_crop_center.jpg?v=1710259210', 'FALSE', 'https://cdn.shopify.com/s/files/1/0255/0189/2660/files/CS1000x1000_1_415x415_crop_center.jpg?v=1714080948%20width=', 'https://cdn.shopify.com/s/files/1/0255/0189/2660/files/LN_CreamSkin_Jumbo_1000x1000_1_415x415_crop_center.jpg?v=1714080813%20width=', 'https://us.laneige.com/cdn/shop/files/LN_LN_CreamSkin_Jumbo_ContentBlock_522x332_2_522x332_crop_center.jpg?v=1703711388', 0, 'TRUE'),
(13, 'Cica Sleeping Mask', 'Specially formulated for sensitive skin, the overnight Cica Sleeping Mask derived from Forest Yeast delivers intense moisture to soothe stressed skin and visibly strengthen the skin’s moisture barrier.', 'Full Ingredient List: WATER / AQUA / EAU, PROPANEDIOL, CETYL ETHYLHEXANOATE, SQUALANEHYDROGENATED POLY(C6-14 OLEFIN), GLYCERIN, PANTHENOL, CETEARYL ALCOHOL, BUTYROSPERMUM PARKII (SHEA) BUTTER, GLYCERYL STEARATE CITRATE, 1, 2-HEXANEDIOL, POLYGLYCERYL-3 METHYLGLUCOSE DISTEARATE, POLYGLYCERYL-10 STEARATE, HYDROXYETHYL ACRYLATE/SODIUM ACRYLOYLDIMETHYL TAURATE COPOLYMER, BUTYLENE GLYCOL, DISODIUM EDTA, ASIATICOSIDE, MADECASSIC ACID, SORBITAN ISOSTEARATE, ASIATIC ACID, MELALEUCA ALTERNIFOLIA (TEA TREE) LEAF OIL,', 'Apply it gently on skin before sleeping and leave it over the night.', '60 mL', '$34', 5, 'mask', 'DRY SKIN', 'DRYNESS', 'https://us.laneige.com/cdn/shop/products/Module1A_InfographicCica1000x1000_v1.jpg?crop=center&height=415&v=1703721963&width=415', 'FALSE', 'https://us.laneige.com/cdn/shop/files/Cica-Sleeping-Mask-PDP_522x332_Benefits-Block_v1_522x332_crop_center.jpg?v=1690409116', 'https://us.laneige.com/cdn/shop/files/Cica-Sleeping-Mask-PDP_500x500_Ingredients_v2.jpg?crop=center&height=240&v=1690409138&width=240', 'https://us.laneige.com/cdn/shop/files/LANEIGE-Cica-Sleeping-Mask-10ml_PDP-1000x1000-v2_1.jpg?crop=center&height=415&v=1695839141&width=415', 0, 'TRUE'),
(14, 'The True Cream Aqua Bomb with Hyaluronic Acid and Niacinamide', ' A bestselling moisturizer that boosts skin hydration levels by 231.4 percent and delivers hydration to ten layers of the skin in as little as ten seconds.', 'Water/Eau, Dipropylene Glycol, Glycerin, Methyl Trimethicone, Alcohol Denat., Dimethicone, Cyclopentasiloxane, 1,2-Hexanediol, Caprylic/Capric Triglyceride, PEG/PPG/Polybutylene Glycol-8/5/3 Glycerin, Pentaerythrityl Tetraethylhexanoate, Avena Sativa (Oat) Kernel Extract, Calendula Officinalis Flower Extract, Nepeta Cataria Extract, Rubus Idaeus (Raspberry) Leaf Extract, Baptisia Tinctoria Root Extract, Stellaria Media (Chickweed) Extract, Alchemilla Vulgaris Leaf Extract, Equisetum Arvense Leaf Extract, Urtica Dioica (Nettle) Leaf Extract, Sodium Hyaluronate, Niacinamide, Polymethylsilsesquioxane, Panthenol, PEG-150, Pentaerythrityl Tetraisostearate, Phenyl Trimethicone, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Carbomer, Tromethamine, Squalane, PEG-40 Hydrogenated Castor Oil', 'After cleansing and toning, apply a dime-size amount (or more) to skin with a gentle patting motion.Can be used daily, AM and PM.', '50 ml', '$38.00', 0, 'moisturizer', 'COMBINATION SKIN', 'DRYNESS', 'https://www.sephora.com/productimages/sku/s2742674-main-zoom.jpg?imwidth=1224', 'FALSE', 'https://www.sephora.com/productimages/product/p510117-av-28-zoom.jpg?imwidth=1224', 'https://www.sephora.com/productimages/product/p510117-av-27-zoom.jpg?imwidth=1224', 'https://www.sephora.com/productimages/product/p510117-av-29-zoom.jpg?imwidth=1224', 0, 'FALSE'),
(15, 'Aqua Bomb Hydrating Jelly Cleanser', ' A gentle jelly-to-foam cleanser with the same explosive burst of hydration as belif\'s cult favorite The True Cream Aqua Bomb, that gently removes all traces of makeup and impurities without stripping the skin of moisture.', 'Water, Glycerin, Potassium Cocoyl Glycinate, Coco-Betaine, 1,2-Hexanediol, Potassium Cocoate, Lauramidopropyl Betaine, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Stellaria Media (Chickweed) Extract+ **, Alchemilla Vulgaris Leaf Extract**, Equisetum Arvense Leaf Extract**, Urtica Dioica (Nettle) Leaf Extract**, Avena Sativa (Oat) Kernel Extract+, Calendula Officinalis Flower Extract+, Nepeta Cataria Extract+, Rubus Idaeus (Raspberry) Leaf Extract+, Baptisia Tinctoria Root Extract+, Potassium Hydroxide, Sodium Chloride, Ethylhexylglycerin, Glyceryl Oleate, ', 'Take a penny-size amount of the product in your palm and lather with water. Massage gently and thoroughly over the face and rinse with lukewarm water.Use daily, morning and evening.', '160 mL', '$30.00', 0, 'cleanser', 'OILY SKIN', 'PORES & SEBUM', 'https://www.sephora.com/productimages/sku/s2224632-main-zoom.jpg?imwidth=1224', 'FALSE', 'https://www.sephora.com/productimages/product/p444057-av-7-zoom.jpg?imwidth=1224', 'https://www.sephora.com/productimages/product/p444057-av-4-zoom.jpg?imwidth=1224', 'https://www.sephora.com/productimages/product/p444057-av-5-zoom.jpg?imwidth=1224', 0, 'FALSE'),
(16, 'Aqua Bomb Hydrating Toner with Hyaluronic Acid', 'A lightweight toner that provides a refreshing splash of hydration to help nurture skin for a healthy-looking glow.\r\n', 'Water, Glycerin, Alcohol Denat., Dipropylene Glycol, 1,2-Hexanediol, Betaine, Panthenol, PEG/PPG/Polybutylene Glycol-8/5/3 Glycerin, Avena Sativa (Oat) Kernel Extract*, Stellaria Media (Chickweed) Extract*+, Calendula Officinalis Flower Extract*, Nepeta Cataria Extract*, Rubus Idaeus (Raspberry) Leaf Extract*, Baptisia Tinctoria Root Extract*, Alchemilla Vulgaris Leaf Extract+, Equisetum Arvense Leaf Extract+, Urtica Dioica (Nettle) Leaf Extract+, Adansonia Digitata (Baobab) Seed Extract,', 'After cleansing, moisten a cotton pad and gently sweep across the face or dispense a dime-size amount into palm and gently press into the face. Use twice daily, morning and evening, after cleansing the face and before moisturizer.', '200 mL', '$30.00', 0, 'essence&toners', 'OILY SKIN', 'PORES & SEBUM', 'https://www.sephora.com/productimages/sku/s2280295-main-zoom.jpg?imwidth=1224', 'FALSE', 'https://www.sephora.com/productimages/product/p449175-av-15-zoom.jpg?imwidth=1224', 'https://www.sephora.com/productimages/product/p449175-av-10-zoom.jpg?imwidth=1224', 'https://www.sephora.com/productimages/product/p449175-av-14-zoom.jpg?imwidth=1224', 0, 'FALSE'),
(17, 'The True Cream Aqua Bomb SPF 45 Korean Moisturizer Face Sunscreen', 'A lightweight, two-in-one, moisturizing sunscreen with broad-spectrum SPF 45 to hydrate your skin while blocking UV rays.', 'Water, Glycerin, Dimethicone, Isododecane, Cetearyl Alcohol, Potassium Cetyl Phosphate, Acrylates/Polytrimethylsiloxymethacrylate Copolymer, 1,2-Hexanediol, Panthenol, Benzotriazolyl Dodecyl P-Cresol, Glyceryl Caprylate, Glyceryl Stearate, Polymethyl Methacrylate, Magnesium Aluminum Silicate, Cetearyl Olivate, Inulin Lauryl Carbamate, Sorbitan Olivate, Citrus Aurantium Dulcis (Orange) Peel Oil, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Xanthan Gum, Citrus Aurantifolia (Lime) Oi.', 'Apply as the last step of your skincare routine.Apply generously and evenly to your face, ears, and neck at least 15 minutes before sun exposure.Reapply at least every two hours and use a water-resistant sunscreen if swimming or sweating.', '50ml', '$38.00', 0, 'sunscreen', 'SENSITIVE SKIN', 'DULLNESS & UNEVEN TONE', 'https://www.sephora.com/productimages/sku/s2774867-main-zoom.jpg?imwidth=1224', 'FALSE', 'https://www.sephora.com/productimages/sku/s2774867-av-4-zoom.jpg?imwidth=1224', 'https://www.sephora.com/productimages/sku/s2774867-av-7-zoom.jpg?imwidth=1224', 'https://www.sephora.com/productimages/sku/s2774867-av-5-zoom.jpg?imwidth=1224', 0, 'FALSE'),
(18, 'First Care Activating Serum VI Mini', 'Sulwhasoo\'s best-selling First Care Activating Serum, now formulated with precious ginseng, strengthens the skin barrier while also addressing pre-mature visible signs of aging.', 'WATER / AQUA / EAU, ALCOHOL DENAT., BUTYLENE GLYCOL, BETAINE, 1,2-HEXANEDIOL, BIS-PEG-18 METHYL ETHER DIMETHYL SILANE, GLYCERYL POLYMETHACRYLATE, PROPANEDIOL, CARBOMER, PPG-13-DECYLTETRADECETH-24, TROMETHAMINE, GLYCERYL CAPRYLATE, SCUTELLARIA BAICALENSIS ROOT EXTRACT, ETHYLHEXYLGLYCERIN, FRAGRANCE / PARFUM, ADENOSINE, LIMONENE, DEXTRIN, THEOBROMA CACAO (COCOA) EXTRACT, METHYL TRIMETHICONE, DISODIUM EDTA', 'Warm 2-3 pumps of the serum in your hand and apply them gently in circles on your skin.', '15mL', '$25', 0, 'serum', 'COMBINATION SKIN', 'WRINKLES', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_FCAS_VI_1080x1080_15ml.jpg?v=1689087718&width=772', 'FALSE', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_FCAS_VI_1080x1080_Texture_d1f25805-9774-4763-8fcd-b85dffa79ef3.jpg?v=1689087730&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Infograhic_FCAS_VI_1080x1080_2_1c319134-76f6-4155-9f80-8e507703dba1.jpg?v=1710954816&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_FCAS_VI_1080x1080_Model_Cut_Hand_1_227502bc-173d-46d1-83e7-298122895b5e.jpg?v=1710954847&width=772', 0, 'FALSE'),
(19, 'Concentrated Ginseng Renewing Cream', 'Our silky-soft anti-aging cream that helps skin look firmer, smoother and more refreshed. Its weightless yet hydrating texture absorbs quickly and provides a visibly lifting effect with a subtle scent of ginseng flower. ', '', '', '60mL', '$260', 0, 'moisturizer', 'DRY SKIN', 'WRINKLES', 'https://us.sulwhasoo.com/cdn/shop/products/CGRC.jpg?v=1662670523&width=772', 'FALSE', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_BRAND_COM_PDP_1080x1080_CGR_Cream.jpg?v=1700166319&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_PDP_Ingredient_Infographic_CGR_Cream_BRAND_COM_1080x1080_f1fd046a-9d50-4950-a497-2bea35c54d95.jpg?v=1700166319&width=772', 'https://us.sulwhasoo.com/cdn/shop/products/Sulhwasoo_01_0123_0226-fix-1-1_8229d62a-82b1-4b06-af98-a8ccbeeb03f5.jpg?v=1700166319&width=772', 0, 'FALSE'),
(20, 'Overnight Vitalizing Mask', 'A nourishing sleeping mask that delivers hydration to skin while strengthening skin\'s moisture barrier while you sleep.', 'WATER / AQUA / EAU, BUTYLENE GLYCOL, GLYCERIN, CETYL ETHYLHEXANOATE, 1,2-HEXANEDIOL, SQUALANE, BUTYROSPERMUM PARKII (SHEA) BUTTER, DI-C12-13 ALKYL MALATE, CYCLOPENTASILOXANE, DIMETHICONE, GLYCERYL STEARATE, CYCLOHEXASILOXANE, TREHALOSE, C14-22 ALCOHOLS, PALMITIC ACID, STEARIC ACID, CETEARYL ALCOHOL, HYDROGENATED CASTOR OIL ISOSTEARATE, HYDROXYPROPYL STARCH PHOSPHATE, PEG-100 STEARATE, DIMETHICONE/VINYL DIMETHICONE CROSSPOLYMER, C12-20 ALKYL GLUCOSIDE,', 'After the last step of your skincare routine, apply the mask and wait for 5 minutes until the skin absrobs it then you can sleep.Rinse with warm water the next morning.', '120 mL', '$54', 0, 'mask', 'DRY SKIN', 'DULLNESS & UNEVEN TONE', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Overnight_Vitalizing_Mask_1080x1080_120ml.jpg?v=1689088009&width=772', 'FALSE', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Overnight_Vitalizing_Mask_1080x1080_Model_Cut_Hand_1.jpg?v=1689088009&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Overnight_Vitalizing_Mask_1080x1080_Model_Cut_Hand_2.jpg?v=1689088009&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Overnight_Vitalizing_Mask_1080x1080_Model_Cut_Hand_3.jpg?v=1689087997&width=772', 0, 'FALSE'),
(22, 'Concentrated Ginseng Rescue Ampoule', 'A powerful anti-aging ampoule that activates Ginsenomics™ and ginseng berry extract.', ' WATER / AQUA / EAU, BUTYLENE GLYCOL, 1,2-HEXANEDIOL, PANAX GINSENG BERRY EXTRACT, DEXTRIN, THEOBROMA CACAO (COCOA) EXTRACT, ETHYLHEXYLGLYCERIN, ADENOSINE, CYANOCOBALAMIN ', 'When using for the first time, hold the bottom part of the container with one hand and the upper part with the other. Turn each part into opposite directions. Shake the bottle sideways so the two formulas can mix.', '20 mL', '$130', 0, 'serum', 'COMBINATION SKIN', 'WRINKLES', 'https://us.sulwhasoo.com/cdn/shop/products/3.jpg?v=1629750296&width=772', 'FALSE', 'https://us.sulwhasoo.com/cdn/shop/products/cropped-Ingredient---CGRA.jpg?v=1631293691&width=772', 'https://us.sulwhasoo.com/cdn/shop/products/croppedBenefit_Ampoule-texture-on-hand.jpg?v=1631293692&width=772', 'https://us.sulwhasoo.com/cdn/shop/products/Sulwhasoo_20210624_7801copy.jpg?v=1629750334&width=772', 0, 'FALSE'),
(23, 'Revive Eye Serum : Ginseng + Retinal', 'The loss of protein, which provides elasticity to our skin\'s dermal layer, leads to a decrease in collagen and hyaluronic acid, resulting in wrinkles. We developed an eye serum designed to mitigate these wrinkles, combining ginseng extract and retinal.\r\n', 'Water, panax ginseng root extract, glycerin, dipropylene glycol, caprylic/caprictriglyceride, 1,2-hexanediol, pentaerythrityl tetraethylhexanoate, niacinamide, butyleneglycol dicaprylate/dicaprate, cetearyl alcohol, sorbitan olivate, cetearyl olivate,butylene glycol, hydrogenated lecithin, tromethamine, carbomer, glyceryl stearate,macadamia ternifolia seed oil, adenosine, theobroma cacao (cocoa) extract, dextrin,cholesterol, polyglyceryl-10 oleate, retinal, brassica campestris (rapeseed)', 'After smoothing out the skin’s texture with toner, pump the serum 1-2 times and apply it around the eyes or the entire face.', '30ml', '$17.00', 0, 'serum', 'COMBINATION SKIN', 'WRINKLES', 'https://beautyofjoseon.com/cdn/shop/files/allureres_0000_LayerComp1.jpg?v=1707795220&width=480', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_d63c47cb-bb3f-4424-ae08-3c6c60839a94.png?v=1716255594&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/Revive-1.jpg?v=1716255594&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/Revive-2.jpg?v=1716255594&width=3000', 0, 'FALSE'),
(24, 'Matte Sun Stick : Mugwort+Camelia (SPF 50+ PA++++)', 'While most sun sticks are tailored for outdoor pursuits, we\'ve designed ours to be just as beneficial in our everyday urban environments. Regular sunscreen reapplication every 2-3 hours is crucial for optimal SPF and PA protection, but it\'s often challenging. Therefore, we\'ve engineered a sun stick with a matte formula that applies smoothly, without becoming clumpy or greasy, even when reapplied over makeup.', 'Methyl Methacrylate Crosspolymer, Synthetic Wax, Dibutyl Adipate, Coco-Caprylate/Caprate, Isopropyl Palmitate, Caprylyl Methicone, Caprylyl Trimethicone, Ethylhexyl Palmitate, Silica, Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Boron Nitride, Butyloctyl Salicylate, Ethylhexyl Triazone, Microcrystalline Wax, Polysilicone-15, Vinyl Dimethicone, Camellia Japonica Seed Oil, Curcuma Longa (Turmeric) Root Extract, Melia Azadirachta Flower Extract, Melia Azadirachta Leaf Extract, Corallina Officinalis Extract, Melia Azadirachta Bark Extract, Ocimum Sanctum Leaf Extract, Moringa Oleifera Seed Oil,Coccinia Indica Fruit Extract, Solanum Melongena (Eggplant) Fruit Extract, Amber Powder,', 'Apply to areas that need sun protection, such as the face and body.\r\nReapply every 2-3 hours.', '18g', '$18.00', 0, 'sunscreen', 'OILY SKIN', ' ACNE & BREAKOUTS', 'https://beautyofjoseon.com/cdn/shop/files/1_46b9d50f-9f7d-43e3-b45f-d05edb86ece0.png?v=1705211626&width=480', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_8b393abd-ac12-4926-a966-9bcf9e8f0152.png?v=1705211624&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/mss-1.jpg?v=1715287667&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/5_34d65a31-9984-44fd-9a30-3b35e2983916.png?v=1715044898&width=3000', 0, 'FALSE'),
(25, 'Ginseng Essence Water', 'Ginseng has been a cherished herb in Korean history, renowned for its benefits to our overall health and particularly our skin. Our Ginseng Essence Water, made with 80% ginseng water, harnesses the natural power of ginseng, nourishing and hydrating the skin deeply.', 'Panax Ginseng Root Water, Butylene Glycol, Glycerin, Propanediol, Niacinamide, 1,2-Hexanediol, Water, Hydroxyacetophenone, Glyceryl Glucoside, Xanthna Gum, Panthenol, Dipotassium Glycyrrhizate, Allantoin, Adenosine, Panax Ginseng Callus Culture Extract, Theobroma Cacao(Cocoa) Extract, Dextrin, Glucose, Panax Ginseng Root Extract, Panax Ginseng Berry Extract, Lactobacillus/Panax Ginseng Root Ferment Filtrate, Sodium Hyaluronate, Ethylhexyglycerin, Disodium EDTA', 'After cleansing, pour a few drops into your hands and pat gently onto the face', '150ml', '$18.00', 0, 'essence&toners', 'DRY SKIN', 'DULLNESS & UNEVEN TONE', 'https://beautyofjoseon.com/cdn/shop/files/1_c7df0b43-9352-46c1-8dac-dd0602014d6b.png?v=1705211262&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_ebe454b0-0bf9-418d-a802-591f876e86a3.png?v=1705211263&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/3_aab61db9-cdda-4a8d-894f-cc042f407973.png?v=1705211259&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/4_6fc1b668-1cb1-485f-924f-e1ebc459a158.png?v=1705211261&width=3000', 0, 'FALSE'),
(26, 'Red Bean Refreshing Pore Mask', 'Our pores are essentially pathways that sebum uses to reach the surface of our skin. When dead skin cells and surplus sebum clog these pathways, pores tend to enlarge. Proper pore care involves clearing away the built-up dead skin cells and sebum, followed by cooling the skin.   ', 'Phaseolus angularis seed extract, glycerin, kaolin, caprylic/capric triglyceride, 1,2-hexanediol, phaseolus angularis seed powder, hectorite, cetyl alcohol, glyceryl stearate se, sorbitan olivate, cetearyl olivate, ultramarines, pyrus communis (pear) fruit extract, ethylhexylglycerin, sodium acrylate/sodium acryloyldimethyl taurate copolymer, hedera helix (ivy) leaf/stem extract, water, polyisobutene, pyrus malus (apple) leaf extract, fragaria chiloensis (strawberry) fruit extract, ci 77491, caprylyl/capryl glucoside, sorbitan oleate, triethoxycaprylylsilane  ', 'After cleansing, apply evenly on a dry face.\r\nAfter 5-10 minutes, gently massage with lukewarm water and rinse off.  ', '140ml', '$20.00', 0, 'cleanser', 'COMBINATION SKIN', ' ACNE & BREAKOUTS', 'https://beautyofjoseon.com/cdn/shop/files/1_ed366512-7a8b-481b-aff1-13ff67549ae7.png?v=1705211742&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_82d2d9f1-d9c1-44dc-abb0-1a4a8733fb28.png?v=1715045505&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/3_0575da06-a770-41e1-8e5b-8d8af16328b9.png?v=1715044722&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/4_bba51ffa-5bd7-4064-a68a-9a4c2626ed0e.png?v=1715044722&width=3000', 0, 'FALSE'),
(27, 'Green Plum Refreshing Cleanser', 'Choosing a cleanser involves finding a balance between thorough cleansing and maintaining the skin\'s barrier health. Our Green Plum Refreshing Cleanser, with its gentle, slightly acidic formulation, harnesses the power of plant-derived extracts from plum and mung bean seeds to achieve just that.\r\n', 'Water, Prunus Mume Fruit Water, Cocamidopropyl Hydroxysultaine, Phaseolus Radiatus Seed Extract, Sodium Cocoyl Isethionate, Glycerin, Sodium Chloride, Camellia Sinensis Leaf Extract, Houttuynia Cordata Extract, Nelumbo Nucifera Flower Extract, Oryza Sativa (Rice) Extract, Prunus Mume Fruit Extract, Vaccinium Angustifolium (Blueberry) Fruit Extract, Guar Hydroxypropyltrimonium Chloride, Coconut Acid', 'Apply an appropriate amount of water to your wet hands and gently massage your face. ​​Wash it off with lukewarm water. ​', '100ml', '$13.00', 0, 'cleanser', 'OILY SKIN', ' ACNE & BREAKOUTS', 'https://beautyofjoseon.com/cdn/shop/files/1_d7960c2c-5eb4-4a81-aaeb-928061f92696.png?v=1705211384&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_9f7c3bb4-df37-4b6c-9ba0-6049f3eca135.png?v=1705211380&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/3_051bf442-5453-4519-b6fd-999c2ae83d9c.png?v=1705211383&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/4_d27582cf-d52a-4847-9e1c-338ca0826098.png?v=1705211381&width=3000', 0, 'FALSE'),
(28, 'Glow Replenishing Rice Milk', 'During the Joseon Dynasty, rice bran water, known as migamsu, was used to beautify the skin, much like today\'s toner or essence. Glow Replenishing Rice Milk modernizes this tradition to maximize skincare benefits. The nutrient-rich rice extract and rice amino acids penetrate deeply to hydrate and smooth dry, rough skin.', 'Water, Methylpropanediol, Propanediol, 1,2-Hexanediol, Glycerin, Glycereth-26, Polymethyl Methacrylate, Oryza Sativa (Rice) Extract, Coptis Japonica Root Extract, Ulmus Davidiana Root Extract, Amaranthus Caudatus Seed Extract, Ficus Carica (Fig) Fruit Extract, Centella Asiatica Extract, Theobroma Cacao (Cocoa) Seed Extract, Hydrogenated Lecithin, Sodium Hyaluronate, Panthenol, Hydroxyethyl Urea, Aluminum Chlorohydrate, Butylene Glycol, Microcrystalline Cellulose, Sodium Citrate, Kaolin, Ethylhexylglycerin, Dipotassium Glycyrrhizate, Citric Acid, Dextrin, Ceramide NP, Tocopherol, Rice Amino Acids', 'After cleansing, pour a few drops onto your palms and gently press the toner into your face for absorption. Alternatively, soak a cotton pad and gently wipe it over your skin from the center outward.', '150ml', '$16', 0, 'moisturizer', 'SENSITIVE SKIN', ' ACNE & BREAKOUTS', 'https://beautyofjoseon.com/cdn/shop/files/RiceMilkThumb_0003_LayerComp4.jpg?v=1715643188&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/texture_0000_LayerComp1.jpg?v=1715924466&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/RiceMilkThumb_0001_LayerComp2.jpg?v=1715924466&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/RiceMilkThumb_0000_LayerComp1.jpg?v=1715924466&width=3000', 0, 'FALSE'),
(29, 'Revive Serum : Ginseng + Snail Mucin', 'This serum is made for skin that has lost its vitality.\r\nIt contains \'ginseng\', which has been used as an important herbal ingredient for a long time, and 3% ‘snail secretion filtrate\', which creates the best synergy for skin elasticity.', 'Panax Ginseng Root Water, Water, Butylene Glycol, Snail Secretion Filtrate, Dipropylene Glycol, 1,2-Hexanediol, Glycerin, Niacinamide, Propanediol, Trehalose Carbomer, Tromethamine, Xanthan Gum,Centella Asiatica Extract, Ganoderma Lucidum(Mushroom) Extract, Panax Ginseng Root Extract, Malt Extract, Sodium Polyacrylate, Adenosine, Glyceryl Acrylate/Acrylic Acid Copolymer, Disodium Edta, Phellinus Linteus Extract, Sodium Hyaluronate, Hydrolyzed Hyaluronic Acid, ', 'Apply 2-3 drops of serum onto the face. Pat gently to aid absorption.', '30ml ', '$17', 0, 'serum', 'COMBINATION SKIN', ' ACNE & BREAKOUTS', 'https://beautyofjoseon.com/cdn/shop/files/1_b027ea19-871b-4e1d-9db0-a192467f17b7.png?v=1712695784&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/2_8f1540da-de7e-49d7-8f57-c118399b7568.png?v=1712023317&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/3_060874b0-1193-4c5d-96d7-300422102a35.png?v=1712023317&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/4_581b75da-dd47-40c6-a5d3-5113224ee673.png?v=1712023317&width=3000', 0, 'FALSE'),
(30, 'Apricot Blossom Peeling Gel', 'This is a gommage type exfoliator, enriched with 19% Prunus Mume Flower Water and 8% plant-based Cellulose. It aims to alleviate skin concerns linked to uneven texture and excessive sebum production.', 'Water, Prunus Mume Flower Water, Cellulose, Methypropandiol, 1,2-Hexandiol, Carbomer, Arginine, Ethylhexylglycerin, Allantoin, Sorbitol, Pyrus Malus (Apple) Fruit Extract, Camellia Sinensis Leaf Extract, Houttuynia Cordata Extract, Nelumbo Nucifera Flower Extract, Oryza Sativa (Rice) Extract, Prunus Mume Fruit Extract, Vaccinium Angustifolium (Blueberry) Fruit Extract, Butylene Glycol, Disodium EDTA', 'Apply a proper amount on your dry face except areas near eyes. Massage gently for about 20 seconds.', '100ml', '$13.00', 0, ' exfoliator', 'COMBINATION SKIN', ' ACNE & BREAKOUTS', 'https://beautyofjoseon.com/cdn/shop/files/1_9c9ff559-5eeb-463b-81eb-ba67424560b8.png?v=1705211145&width=3000', 'TRUE', 'https://beautyofjoseon.com/cdn/shop/files/3_7a2a2c56-c472-4d36-a6f3-8ea554beb76a.png?v=1705211144&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/2_a8e119b9-3127-4f2d-ae10-0b124b3aa1dc.png?v=1705211142&width=3000', 'https://beautyofjoseon.com/cdn/shop/files/4_73fde248-4e14-4c71-ac21-776c0134c65e.png?v=1705211149&width=3000', 0, 'FALSE'),
(31, 'Water Bank Blue Hyaluronic Cream Moisturizer', 'This lush, dewy hydrating cream is powered by micro-sized, fast absorbing Blue Hyaluronic Acid, while Pepta-Panthenol Complex™ and Squalane visibly firm and reinforce skin\'s moisture barrier for a healthy and resilient complexion.', 'WATER / AQUA / EAU, GLYCERIN, BUTYLENE GLYCOL, SQUALANEDICAPRYLYL ETHER, POLYGLYCERYL-3 METHYLGLUCOSE DISTEARATE, METHYL TRIMETHICONE, GLYCERYL STEARATE, PENTAERYTHRITYL TETRAETHYLHEXANOATE, 1, 2-HEXANEDIOL, STEARYL DIMETHICONE, BIS-HYDROXYETHOXYPROPYL DIMETHICONE, CETYL ALCOHOL, LACTOBACILLUS FERMENT LYSATE, CAPRYLIC/CAPRIC/MYRISTIC/STEARIC TRIGLYCERIDE, PALMITIC ACID, STEARIC ACID, PANTHENOL, HYDROXYETHYL ACRYLATE/SODIUM ACRYLOYLDIMETHYL TAURATE COPOLYMER, PROPANEDIOL, ACRYLATES/C10-30 ALKYL ACRYLATE CROSSPOLYMER, XANTHAN GUM, GLYCERYL CAPRYLATE', '', '50 mL', ' $40', 0, 'mask', 'SENSITIVE SKIN', 'DRYNESS', 'https://us.laneige.com/cdn/shop/files/Cream_CONTENT_BLOCK_522x332_copy_522x332_crop_center.jpg?v=1703777829', 'FALSE', 'https://us.laneige.com/cdn/shop/files/PEPTA-PANTHENOL_Ingredient_Image_500x500_d8e19752-011b-4703-b326-5ea93880896f.png?crop=center&height=240&v=1703714956&width=240', 'https://us.laneige.com/cdn/shop/files/LP-SiteContentBlock522x332-3_522x332_crop_center.jpg?v=1703108235', 'https://us.laneige.com/cdn/shop/files/BLUE_HYALURONIC_Ingredient_Image_500x500_ee088700-f1c5-4c3a-af9c-e9e9c915db52.png?crop=center&height=240&v=1703714957&width=240', 0, 'FALSE'),
(32, 'Radian-C Cream', 'C-ya later dark spots! Hydrate skin with a gentle daily moisturizer enriched with Vitamin C & Vitamin E for visibly brighter skin in just 3 days.', 'WATER / AQUA / EAU, 3-O-ETHYL ASCORBIC ACID, GLYCERIN, CETEARYL ALCOHOLCAPRYLIC/CAPRIC TRIGLYCERIDE, PROPANEDIOL, METHYL TRIMETHICONE, HYDROGENATED POLY(C6-14 OLEFIN), PENTAERYTHRITYL TETRAETHYLHEXANOATE, CETEARYL OLIVATE, POTASSIUM CETYL PHOSPHATE, 1, 2-HEXANEDIOL, SORBITAN OLIVATE, HYDROXYETHYL ACRYLATE/SODIUM ACRYLOYLDIMETHYL TAURATE COPOLYMER, LIMONENE,', '', '30 mL', '$35', 0, 'moisturizer', 'OILY SKIN', 'DULLNESS & UNEVEN TONE', 'https://us.laneige.com/cdn/shop/products/LANEIGE_RADIANC_PPAGE_PRODUCT.jpg?crop=center&height=415&v=1703722640&width=415', 'FALSE', 'https://us.laneige.com/cdn/shop/files/LN_RadianC_Cream_Product_03_522x332_crop_center.jpg?v=1652300798', 'https://us.laneige.com/cdn/shop/files/1.jpg?crop=center&height=240&v=1658861979&width=240', 'https://us.laneige.com/cdn/shop/files/LN_RadianC_Cream_Product_09_1_522x332_crop_center.jpg?v=1652305790', 0, 'FALSE'),
(33, 'Water Sleeping Mask', 'An overnight, hydrating gel mask that quickly absorbs while you sleep to deeply hydrate skin.', 'WATER / AQUA / EAU, BUTYLENE GLYCOL, GLYCERIN, TREHALOSEMETHYL TRIMETHICONE, 1, 2-HEXANEDIOL, SQUALANE, PHENYL TRIMETHICONE, PCA DIMETHICONE, CAPRYLYL METHICONE, AMMONIUM ACRYLOYLDIMETHYLTAURATE/VP COPOLYMER, LACTOBACILLUS FERMENT LYSATE, CARBOMER, PROPANEDIOL, TROMETHAMINE, ACRYLATES/C10-30 ALKYL ACRYLATE CROSSPOLYMER, GLYCERYL CAPRYLATE, ETHYLHEXYLGLYCERIN', 'After applying a face cream, apply your mask and leave it overnight', '70 mL', ' $32', 0, 'mask', 'SENSITIVE SKIN', 'DRYNESS', 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwc4dc9566/images/hi-res/alternates/PID_alternate1/PID_alternate1_277/P3662004_1.jpg', 'FALSE', 'https://us.laneige.com/cdn/shop/files/1_2_27031289-83c9-4e27-be72-4f58d18a9d61.jpg?v=1713974819&width=390', 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwe6a3af5c/images/hi-res/alternates/PID_alternate3/PID_alternate3_195/P3662004_3.jpg', 'https://us.laneige.com/cdn/shop/files/2_3_d49eee9d-d5df-41b7-9d2e-3bd944c2f4bb.jpg?v=1713974819&width=390', 0, 'FALSE'),
(34, 'Water Bank Blue Hyaluronic Cleansing Foam', 'A bouncy foam cleanser that gently and effectively cleanses skin, creating the perfect blank canvas before the rest of your skincare!', 'EAU, GLYCERIN, MYRISTIC ACID, STEARIC ACIDPEG-32, POTASSIUM HYDROXIDE, PALMITIC ACID, LAURIC ACID, COCAMIDOPROPYL BETAINE, GLYCERYL STEARATE, PEG-100 STEARATE, MICROCRYSTALLINE CELLULOSE, FRAGRANCE / PARFUM, SODIUM CHLORIDE, DISODIUM EDTA, BUTYLENE GLYCOL, SODIUM BENZOATE, MENTHA ARVENSIS LEAF EXTRACT, HYDROLYZED HYALURONIC ACID, POLYCAPROLACTONE, TARABICA (COFFEE) ', 'Gently rub the cleanser on your palm with some water to get a foam, then use this foam to cleanse your face.', '150 g', ' $25', 0, 'cleanser', 'OILY SKIN', 'PORES & SEBUM', 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw2eb5ed24/images/hi-res/alternates/PID_alternate3/PID_alternate3_2048/P10047311_3.jpg', 'FALSE', 'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw9458f775/images/hi-res/SKU/SKU_3738/610866_swatch.jpg?sw=585&sh=585&sm=fit', 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dwe23d148c/images/hi-res/alternates/PID_alternate1/PID_alternate1_2703/P10047311_1.jpg', 'https://www.sephora.fr/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw3ae135fd/images/hi-res/alternates/PID_alternate2/PID_alternate2_2366/P10047311_2.jpg', 0, 'FALSE');
INSERT INTO `product` (`proID`, `name`, `description`, `ingredients`, `instructions`, `volume`, `price`, `rating`, `category`, `skintype`, `skinConcerns`, `image`, `isnew`, `detail1`, `detail2`, `detail3`, `salles`, `exist`) VALUES
(35, 'Plum Plump Hyaluronic Cream', 'Hydrate, plump & balance skin with our new whipped gel cream moisturizer that fills each skin layer with long-lasting, plumping hydration for a dewy glow. Skin-Balancing. Quick-Absorbing. Non-Greasy.', 'Water/Aqua/Eau, Propanediol, Glycerin, C13-15 Alkane, Caprylic/Capric Triglyceride, C9-12 Alkane, Prunus Domestica Seed Oil*, Pentylene Glycol, Squalane, Terminalia Ferdinandiana Seed Oil*, Hyaluronic Acid, Sodium Acetylated Hyaluronate, Sodium Hyaluronate, Davidsonia Jerseyana Fruit Extract*, Terminalia Ferdinandiana Fruit Powder*, Podocarpus Elatus Fruit Extract*, Polyglutamic Acid,', 'Gentle enough to use morning & night, smooth a dime-sized amount onto clean skin after Plum Plump Hyaluronic Serum. Gently pat into skin until fully absorbed.', '50ml', '$40', 0, 'moisturizer', 'COMBINATION SKIN', 'DRYNESS', 'https://www.glowrecipe.com/cdn/shop/products/PLUM-MOISTURIZER-3_1200x1500_8d3d1d8a-b724-466b-8a4c-11549c84bc94copy_600x.jpg?v=1711115465', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/PLUM-MOISTURIZER-3_1200x1500_8d3d1d8a-b724-466b-8a4c-11549c84bc94_600x.jpg?v=1711115465', 'https://www.glowrecipe.com/cdn/shop/products/B_A_-CLAIMS_SERUM_LP_600x.jpg?v=1711115465', 'https://www.glowrecipe.com/cdn/shop/products/plum_botf_2_600x.jpg?v=1711115465', 0, 'FALSE'),
(36, 'apaya Sorbet Enzyme Cleansing Balm', 'eveal smooth, glowing skin from the start of your routine and effortlessly dissolve makeup, dirt, and oil with the PEG-free Papaya Sorbet Enzyme Cleansing Balm.', 'Cetyl Ethylhexanoate, Sorbitan Oleate, Prunus Armeniaca (Apricot) Kernel Oil, Polyethylene, Aqua/Water/Eau, Camellia Japonica Seed Oil, Carica Papaya (Papaya) Seed Oil,', 'Scoop a generous amount. On dry skin, gently massage formula in circular motions for up to 1 minute with dry hands, focusing on areas that have more makeup.', '100ml', '$32', 0, 'cleanser', 'COMBINATION SKIN', ' ACNE & BREAKOUTS', 'https://www.glowrecipe.com/cdn/shop/products/PAPAYA_ENZYME_1200X1500_ceb48394-6208-499f-a1e1-fa8e4b8a262c_600x.jpg?v=1597089575', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/PAPAYA_ENZYME_2_1200X1500_5624c460-2118-49c4-80b7-9d7cbebce754_600x.jpg?v=1597089594', 'https://www.glowrecipe.com/cdn/shop/products/PAPAYA_ENZYME_3_1200X1500_a43c7b81-fdaf-4721-b08d-81fb24ed67d6_600x.jpg?v=1597089648', 'https://www.glowrecipe.com/cdn/shop/products/HowToDoubleCleanse_PPAGE_d55dd38a-2232-4a21-a99c-568d3250f398_600x.jpg?v=1597090373', 0, 'FALSE'),
(37, 'Avocado Melt Retinol Eye Cream', 'Potent, yet gentle encapsulated retinol gently time-releases for hours to effectively smooth fine lines and firm the delicate eye area. Paired with avocado extract, hyaluronic acid, niacinamide, and coffeeberry, this creamy yet lightweight formula helps to nourish, brighten, and depuff by morning.', 'qua/Water/Eau, Glycerin, Propanediol, Glyceryl Stearate, Cetearyl Alcohol, Persea Gratissima (Avocado) Oil, C9-12 Alkane, Sodium Lauroyl Glutamate, Stearic Acid, Persea Gratissima (Avocado) Fruit Extract, Squalane, Niacinamide, Ethylhexylglycerin, Hexylresorcinol, Oryza Sativa (Rice) Extract, Tocopheryl Acetate, Aloe Barbadensis Leaf Juice', 'After cleansing, apply a pea-sized amount to the entire orbital eye area and gently pat into skin using ring finger for optimal absorption. Apply nightly. Do not layer with other eye creams. Use before applying serums.', '15ml', '$42', 0, 'moisturizer', 'OILY SKIN', 'WRINKLES', 'https://www.glowrecipe.com/cdn/shop/products/IMG_9441_CREAM_600x.jpg?v=1659371155', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/GR_AVOCADO_RETINOL_EYE_PPAGE_2_600x.jpg?v=1668721312', 'https://www.glowrecipe.com/cdn/shop/products/Remerch_AvoEye-Edit_CREAM.jpg?v=1668721297', 'https://www.glowrecipe.com/cdn/shop/products/GUAVA_EYE_AVO_EYE_COMPARISON_1_1.jpg?v=1668721312', 0, 'FALSE'),
(38, 'Watermelon Glow Niacinamide Dew Balm SPF 45', 'This hydrating balm contains broad spectrum SPF 45 and is rated PA+++, to shield against UVA/UVB rays while helping to even tone & prevent hyperpigmentation. The translucent, non-comedogenic formula leaves skin with a dewy glow, never greasy!', 'Active Ingredients: Avobenzone 3%, Homosalate 5%, Octisalate 5% Inactive Ingredients: Neopentyl Glycol Dicaprylate/Dicaprate, Octyldodecanol, C15-19 Alkane, Coco- Caprylate/Caprate, Silica Silylate, Butyloctyl Salicylate, Polyester-8, Dibutyl Lauroyl Glutamide, Squalane, Capryloyl Glycerin/Sebacic Acid Copolymer', 'efore applying, warm the bullet up on the back of your hand.For each area of skin, apply 4 passes back and forth as the last step of your skincare routine for optimal protection.', '', '$30', 0, 'sunscreen', 'OILY SKIN', 'DULLNESS & UNEVEN TONE', 'https://www.glowrecipe.com/cdn/shop/files/4_30_24_DEW_BALM_PDP_2_600x.jpg?v=1713899990', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/files/4_30_24_DEW_BALM_PDP_5_600x.jpg?v=1713906854', 'https://www.glowrecipe.com/cdn/shop/files/DEW_BALM_HERO_INGREDIENT_INFOGRAPHIC_1080x1350_US_600x.jpg?v=1713906854', 'https://www.glowrecipe.com/cdn/shop/files/HOW_DEW_YOU_APPLY_DEW_BALM_INFOGRAPHIC_1080x1350_eeb96836-f978-49fd-a1a1-4c35b873053f_600x.jpg?v=1713906854', 0, 'FALSE'),
(39, 'Essential Comfort Firming Cream', 'A hypoallergenic, whipped moisturizing cream that visibly improves skin firmness and the look of elasticity for a supple, bouncy complexion.', 'WATER / AQUA / EAU, BUTYLENE GLYCOL, GLYCERIN, BUTYLENE GLYCOL DICAPRYLATE/DICAPRATE, CETYL ETHYLHEXANOATE, CAPRYLIC/CAPRIC TRIGLYCERIDE, CYCLOPENTASILOXANE, DIISOSTEARYL MALATE, 1,2-HEXANEDIOL, GLYCERYL STEARATE, POLYGLYCERYL-3 METHYLGLUCOSE DISTEARATE, CYCLOHEXASILOXANE, PEG-100 STEARATE, CETEARYL ALCOHOL, HYDROXYETHYL ACRYLATE/SODIUM ACRYLOYLDIMETHYL TAURATE COPOLYMER, POLYACRYLATE-13, ', 'Warm the cream with your fingertips and then apply it on you face and neck.', ' 75mL', '$120', 0, 'moisturizer', 'SENSITIVE SKIN', 'WRINKLES', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_EC_FirmingCream_1080x1080_75ml.jpg?v=1689086922&width=772', 'FALSE', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_EC_FirmingCream_1080x1080_Texture.jpg?v=1689086922&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_EC_FirmingCream_1080x1080_Model_Cut_1.jpg?v=1689086922&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_EC_FirmingCream_1080x1080_Model_Cut_2.jpg?v=1689086922&width=772', 0, 'FALSE'),
(40, 'Essential Comfort Balancing Emulsion', 'A lightweight lotion that immediately absorbs and delivers soothing hydration while balancing the skin. ', 'WATER / AQUA / EAU, BUTYLENE GLYCOL, HYDROGENATED POLY(C6-14 OLEFIN), OCTYLDODECYL MYRISTATE, GLYCERIN, POLYGLYCERYL-3 METHYLGLUCOSE DISTEARATE, CETYL ETHYLHEXANOATE, LIMNANTHES ALBA (MEADOWFOAM) SEED OIL, HYDROGENATED VEGETABLE OIL, CETEARYL ALCOHOL, 1,2-HEXANEDIOL, GLYCERYL STEARATE, MANGIFERA INDICA (MANGO) SEED BUTTER, DIMETHICONE, GLYCERYL STEARATE CITRATE, STEARIC ACID, PALMITIC ACID, ZIZIPHUS JUJUBA FRUIT EXTRACT, PROPANEDIOL, HONEY, (SHEA) BUTTER, GLYCERYL CAPRYLATE, TROMETHAMINE', 'After applying a toner apply 2 to 3 pumps of Essential Comfort Balancing Emulsion onto skin.', '125mL', '$72', 0, 'essence&toners', 'COMBINATION SKIN', 'DRYNESS', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_EC_Emulsion_1080x1080_125ml.jpg?v=1689086849&width=772', 'FALSE', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_EC_Emulsion_1080x1080_Texture.jpg?v=1689086857&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_EC_Emulsion_1080x1080_Texture.jpg?v=1689086857&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_EC_Emulsion_1080x1080_Mood_Cut.jpg?v=1689086857&width=772', 0, 'FALSE'),
(42, 'Clarifying Mask', 'A unique, honey-like textured, peel-off mask that removes dead skin cells and impurities to deliver smoother and visibly clear skin.', '', '', '120mL', '$45', 0, 'mask', 'OILY SKIN', 'PORES & SEBUM', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Clarifying_Mask_1080x1080_120ml.jpg?v=1689087632&width=772', 'FALSE', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Infographic_Clarifying_Mask_1080x1080_94c83213-abed-4f44-878c-588fcda36164.jpg?v=1689087643&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Clarifying_Mask_1080x1080_Model_Cut_2.jpg?v=1689087643&width=772', 'https://us.sulwhasoo.com/cdn/shop/files/SWS_Thumbnail_Clarifying_Mask_1080x1080_Model_Cut_Hand_1.jpg?v=1689087643&width=772', 0, 'FALSE'),
(43, 'Concentrated Ginseng Renewing Eye Cream', 'From dryness and dullness to visible fine lines and wrinkles, this rich eye cream will help minimize visible signs of aging on your eye area. It features our two proprietary anti-aging ingredients: Ginsenomics™and Ginseng Retinol™ to improve visible signs of aging.', 'WATER / AQUA / EAU, SQUALANE, BUTYLENE G LY-COL, POLYGLYCERYL-3 METHYLGLUCOSE DISTEARATE, DIMETHICONE, PROPANEDIOL, CETYL ETHYLHEXANOATE, GLYCERYL STEARATE, CETEA-RYL ALCOHOL, PHYTOSTERYL ISOSTEARYL DIMER DILINOLEATE, BEHENYL ALCOHOL, 1,2-HEXANEDIOL, GLYCERIN, HYDROGENATED CASTOR OIL ISO-STEARATE, PANAX GINSENG ROOT WATER, POLYACRYLATE-13, SILICA,', 'Gentely tap a small amount around the eye area, then start messaging using the metal applicator.', '20mL', '$140', 0, 'moisturizer', 'DRY SKIN', 'WRINKLES', 'https://us.sulwhasoo.com/cdn/shop/products/HQ_SWS_CGREC_Product_02.jpg?v=1661287573&width=772', 'FALSE', 'https://us.sulwhasoo.com/cdn/shop/products/HQ_SWS_CGREC_Texture_01.jpg?v=1661287573&width=772', 'https://us.sulwhasoo.com/cdn/shop/products/SWS_CGREC_Product_2022AD_03.jpg?v=1661287573&width=772', 'https://us.sulwhasoo.com/cdn/shop/products/HQ_SWS_CGREC_Model_2022AD_01.jpg?v=1661287573&width=772', 0, 'FALSE'),
(44, 'Guava Vitamin C Bright-Eye Gel Cream', 'isibly brighten dark circles and rejuvenate tired, puffy eyes with this potent, yet gentle eye cream.', 'Water/Aqua/Eau, Caprylic/Capric Triglyceride, Glycerin, Niacinamide, *Behenyl Alcohol, Sorbitan Olivate, Cetearyl Olivate, Sodium Ascorbyl Phosphate, Butylene Glycol, Diisostearyl Malate, Tetrahexyldecyl Ascorbate, Cetyl Palmitate, Psidium Guajava Fruit Extract, Ammonium Acryloyldimethyltaurate/VP Copolymer, Simmondsia Chinensis (Jojoba) Seed Oil, Psidium Guajava Seed Oil', 'Using your ring finger, gently tap a pea-sized amount onto the entire eye area, including the under eyes, eyelids and between eyebrows, until absorbed.', '15ml', '$38.00', 0, 'moisturizer', 'COMBINATION SKIN', 'DRYNESS', 'https://www.glowrecipe.com/cdn/shop/products/09_06_22_GUAVA_LAUNCH_PDP-copy-3_600x.jpg?v=1661374473', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/09_06_22_GUAVA_LAUNCH_PDP-copy-4_600x.jpg?v=1664556269', 'https://www.glowrecipe.com/cdn/shop/products/09_06_22_GUAVA_LAUNCH_PDP-copy-2_600x.jpg?v=1683512033', 'https://www.glowrecipe.com/cdn/shop/products/GUAVA_EYE_INGREDIENT_INFORGRAPH_PDP_600x.jpg?v=1664556269', 0, 'FALSE'),
(45, 'Avocado Ceramide Moisture Barrier Cleanser', 'With an improved creamy gel-to-foam texture and now hyaluronic acid, this nourishing cleanser gently yet effectively melts away impurities to reveal softer, refreshed skin.', 'Water/Aqua/Eau, Glycerin, Sodium Cocoyl Alaninate, Sodium Methyl Cocoyl Taurate, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Inulin, Butylene Glycol, Ceramide NP, Colloidal Oatmeal, Caprylyl Glycol, Lauryl Hydroxysultaine, Coco-Glucoside, Sodium Hyaluronate, Persea Gratissima (Avocado) Oil, Persea Gratissima (Avocado) Fruit Extract, Saccharide Isomerate, Micrococcus Lysate,', 'Dispense an almond-sized amount into wet palms and create a lather.\r\nGently massage into a damp face and neck in small circular motions until fully cleansed or until makeup is dissolved.\r\nRinse thoroughly and follow with your usual skincare regimen AM and PM.', '', '$28.00', 0, 'cleanser', 'DRY SKIN', 'PORES & SEBUM', 'https://www.glowrecipe.com/cdn/shop/files/1_21_23_AVO_RELAUNCH_PDP4_600x.png?v=1705691819', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/files/1_21_23_AVO_RELAUNCH_PDP_600x.png?v=1708983091', 'https://www.glowrecipe.com/cdn/shop/files/1_21_23_AVO_RELAUNCH_PDP3_600x.png?v=1708983091', 'https://www.glowrecipe.com/cdn/shop/files/AVO_CLEANSER_UPDATED_INFOGRPAHIC_1080x1350_02_23_24_600x.png?v=1708983091', 0, 'FALSE'),
(46, 'Strawberry Smooth BHA+AHA Salicylic Serum', 'Meet Strawberry Smooth: Gently smooth texture, clear breakouts, and refine pores, while calming skin with our most powerful, yet gentle daily clarifying BHA+AHA serum.', 'Water/Aqua/Eau, Methylpropanediol, C9-12 Alkane, Fragaria Vesca (Strawberry) Fruit Extract, Hydroxypropyl Starch Phosphate, Salicylic Acid, Pentylene Glycol, Mandelic Acid, Succinic Acid, Fragaria Vesca (Strawberry) Leaf Extract, Azelaic Acid, Allantoin, Sodium Hyaluronate, Bisabolol, Opuntia Ficus-Indica (Prickly Pear) Flower Extract, Niacinamide, Glucosamine, Zingiber Officinale (Ginger) Root Extract,', 'This serum is gentle enough to use daily, both morning & night. Dispense 1–2 pumps and gently pat onto a clean face and neck until fully absorbed. During the day, follow with sunscreen after moisturizer.', '30 mL', '$42.00', 0, 'serum', 'OILY SKIN', ' ACNE & BREAKOUTS', 'https://www.glowrecipe.com/cdn/shop/products/glow_strawberry2_1259_1200X1500pxv2_600x.jpg?v=1648228857', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/B_A_CLAIMS_SERUM_LP_pdp-11_600x.png?v=1683511929', 'https://www.glowrecipe.com/cdn/shop/products/glow_strawberry_model_1351__1200x1500px_600x.jpg?v=1683511929', 'https://www.glowrecipe.com/cdn/shop/products/GR_SB_INFOGRAPHICS_PDP-01_1200X1500px_600x.jpg?v=1683511929', 0, 'FALSE'),
(47, 'Blueberry Bounce Gentle Cleanser', 'This effective yet gentle 3-in-1 bouncy makeup eraser, cleanser, and deep clarifying mask hydrates the skin without stripping it, helping to combat blemishes and breakouts over time.', 'Water/Aqua/Eau, Decyl Glucoside, Caulerpa Lentillifera Extract, Beta-Glucan, Sodium Hyaluronate, Vaccinium Angustifolium (Blueberry) Fruit, Glycolic Acid, Lactic Acid, Physalis Peruviana Fruit Extract, Rubus Idaeus (Raspberry) Fruit, Arctostaphylos Uva-Ursi Leaf Extract, ', 'Dispense one pump into wet palms and rub hands to create a lather. Massage gently onto wet skin for one minute, then rinse thoroughly with lukewarm water. Admire how bouncy your skin looks and then follow with your usual skincare regimen.', '160ml', '$34.00', 0, 'cleanser', 'COMBINATION SKIN', 'PORES & SEBUM', 'https://www.glowrecipe.com/cdn/shop/products/GR_BLUEBERRY_CLEANSER_PPAGE_1_600x.jpg?v=1592840170', 'FALSE', 'https://www.glowrecipe.com/cdn/shop/products/GR_BLUEBERRY_CLEANSER_PPAGE_2_BYRDIE_SEAL_600x.jpg?v=1612806151', 'https://www.glowrecipe.com/cdn/shop/products/GR_BLUEBERRY_CLEANSER_PPAGE_8_600x.jpg?v=1671036897', 'https://www.glowrecipe.com/cdn/shop/products/KakaoTalk_20190528_135634417_600x.jpg?v=1671036897', 0, 'FALSE');

-- --------------------------------------------------------

--
-- Structure de la table `product_pairs`
--

CREATE TABLE `product_pairs` (
  `product_id` int(5) NOT NULL,
  `pairs_with_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_pairs`
--

INSERT INTO `product_pairs` (`product_id`, `pairs_with_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `product_id` int(5) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `experience` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ratings`
--

INSERT INTO `ratings` (`id`, `product_id`, `user_id`, `rating`, `experience`) VALUES
(1, 1, NULL, NULL, 'kkk'),
(2, 1, NULL, NULL, '3kkkk'),
(3, 1, NULL, NULL, '3kkkk'),
(4, 1, NULL, NULL, 'pppp'),
(5, 1, NULL, NULL, 'ppp'),
(6, 1, NULL, NULL, 'oooo'),
(7, NULL, NULL, 2, 'ppp'),
(8, NULL, NULL, 2, 'pppp'),
(9, NULL, NULL, 3, 'pppp'),
(10, 1, NULL, NULL, 'ppp'),
(11, 1, NULL, NULL, 'ppp'),
(12, 1, NULL, NULL, 'pppp'),
(13, 1, NULL, NULL, 'ppp'),
(14, 1, NULL, NULL, 'ppp'),
(15, 1, NULL, NULL, 'ppp'),
(16, 1, NULL, NULL, 'llll'),
(17, NULL, NULL, 2, 'ppp'),
(18, NULL, NULL, 4, 'ppp'),
(19, 1, NULL, 3, 'ppp'),
(20, 1, NULL, 4, 'pppp'),
(21, 1, NULL, 5, ''),
(22, 1, NULL, 2, 'kkk'),
(23, 1, NULL, 3, 'ooo'),
(24, 2, NULL, 3, 'experince'),
(25, 2, NULL, 4, 'exeperience'),
(26, 3, NULL, 4, 'exepeience'),
(27, 1, NULL, 4, 'exeprience'),
(28, 1, 12, 4, 'oooo'),
(29, 1, 12, 4, 'oooo'),
(30, 1, NULL, 3, 'pp'),
(31, 1, NULL, 3, 'ppppppp'),
(32, 1, NULL, 4, 'ppppppp'),
(33, 1, NULL, 3, 'ppp'),
(34, 1, NULL, 3, 'ppp'),
(35, 1, NULL, 3, 'lll'),
(36, 1, NULL, 2, 'll'),
(37, 4, 12, 4, 'pppp'),
(38, 4, 12, NULL, 'pppp'),
(39, 4, 12, 4, 'pppp'),
(40, 2, 12, 3, 'exeperience'),
(41, 2, 12, 4, 'pppp'),
(42, 2, 12, 4, 'pppp'),
(43, 2, 12, 1, ''),
(44, 2, 12, 1, ''),
(45, 3, 12, 1, 'pppp'),
(46, 11, 12, 1, 'pppp'),
(47, 1, 12, 4, 'pppp'),
(48, 7, 12, 4, 'ppp'),
(49, 7, 12, 4, 'ppp'),
(50, 7, 12, 4, 'ppp'),
(51, 7, 12, 4, 'ppp'),
(52, 7, 12, 4, 'ppp'),
(53, 7, 12, 4, 'ppp'),
(54, 11, 12, 4, 'ppp'),
(55, 11, 12, 5, 'ppp'),
(56, 11, 12, 5, 'ppp'),
(57, 11, 12, 5, 'ppp'),
(58, 11, 12, 5, 'ppp'),
(59, 11, 12, 5, 'ppp'),
(60, 12, 12, 5, 'pppp'),
(61, 13, 12, 5, 'comment'),
(62, 12, 12, 4, 'exeperience'),
(63, 12, 12, 4, 'exeperience'),
(64, 8, 12, 5, 'experience');

-- --------------------------------------------------------

--
-- Structure de la table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `cartID` int(5) NOT NULL,
  `clientID` int(8) NOT NULL,
  `productID` int(5) NOT NULL,
  `quantity` int(5) NOT NULL,
  `purchasedate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `skinconcerns`
--

CREATE TABLE `skinconcerns` (
  `skinConcerns` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skinconcerns`
--

INSERT INTO `skinconcerns` (`skinConcerns`) VALUES
(' ACNE & BREAKOUTS'),
('DRYNESS'),
('DULLNESS & UNEVEN TONE'),
('PORES & SEBUM'),
('WRINKLES');

-- --------------------------------------------------------

--
-- Structure de la table `skintype`
--

CREATE TABLE `skintype` (
  `skintype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skintype`
--

INSERT INTO `skintype` (`skintype`) VALUES
('COMBINATION SKIN'),
('DRY SKIN'),
('OILY SKIN'),
('SENSITIVE SKIN');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idC`),
  ADD KEY `fk_client_pref` (`FullAddress`);

--
-- Index pour la table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `fk_client_purchase` (`clientID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `fk_order_pref` (`shippingPlace`);

--
-- Index pour la table `prefecture`
--
ALTER TABLE `prefecture`
  ADD PRIMARY KEY (`prefecture`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`proID`),
  ADD KEY `fk_new_cat` (`category`),
  ADD KEY `fk_new_type` (`skintype`),
  ADD KEY `fk_new_concernes` (`skinConcerns`);

--
-- Index pour la table `product_pairs`
--
ALTER TABLE `product_pairs`
  ADD PRIMARY KEY (`product_id`,`pairs_with_id`),
  ADD KEY `fk_product_pairswell2` (`pairs_with_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`cartID`),
  ADD KEY `fk_client_cart` (`clientID`),
  ADD KEY `fk_product_cart` (`productID`);

--
-- Index pour la table `skinconcerns`
--
ALTER TABLE `skinconcerns`
  ADD PRIMARY KEY (`skinConcerns`);

--
-- Index pour la table `skintype`
--
ALTER TABLE `skintype`
  ADD PRIMARY KEY (`skintype`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idC` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `proID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  MODIFY `cartID` int(5) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `fk_client_purchase` FOREIGN KEY (`clientID`) REFERENCES `client` (`idC`),
  ADD CONSTRAINT `fk_order_pref` FOREIGN KEY (`shippingPlace`) REFERENCES `prefecture` (`prefecture`),
  ADD CONSTRAINT `fk_product_purchase` FOREIGN KEY (`productID`) REFERENCES `product` (`proID`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_new_cat` FOREIGN KEY (`category`) REFERENCES `category` (`category`),
  ADD CONSTRAINT `fk_new_concernes` FOREIGN KEY (`skinConcerns`) REFERENCES `skinconcerns` (`skinConcerns`),
  ADD CONSTRAINT `fk_new_type` FOREIGN KEY (`skintype`) REFERENCES `skintype` (`skintype`);

--
-- Contraintes pour la table `product_pairs`
--
ALTER TABLE `product_pairs`
  ADD CONSTRAINT `fk_product_pairswell1` FOREIGN KEY (`product_id`) REFERENCES `product` (`proID`),
  ADD CONSTRAINT `fk_product_pairswell2` FOREIGN KEY (`pairs_with_id`) REFERENCES `product` (`proID`);

--
-- Contraintes pour la table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`proID`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `client` (`idC`);

--
-- Contraintes pour la table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `fk_client_cart` FOREIGN KEY (`clientID`) REFERENCES `client` (`idC`),
  ADD CONSTRAINT `fk_product_cart` FOREIGN KEY (`productID`) REFERENCES `product` (`proID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
