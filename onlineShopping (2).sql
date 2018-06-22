-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 28, 2015 at 03:37 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlineShopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
`AddID` int(11) NOT NULL,
  `Street` varchar(200) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) NOT NULL,
  `ZipCode` varchar(6) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddID`, `Street`, `City`, `State`, `ZipCode`, `CID`) VALUES
(500, 'c-503 saraswati vihar', 'new delhi', 'Delhi', '110034', 100),
(501, 'a-23 ranibagh', 'new delhi', 'Delhi', '110088', 101),
(502, 'b-45 purana kila', 'bikaner', 'Rajasthan', '313001', 102),
(503, 'd-12 husain sagar', 'sindh', 'Hyderabad', '500002', 103),
(504, 'Door No 737, Choultry Street', 'Ramanagram', 'Kerala', '320069', 104),
(505, 'Khans, St. Joseph’s Road', 'Bannimantap', 'Haryana', '112345', NULL),
(506, 'CFTRI House', 'CFTRI', 'Delhi', '110069', NULL),
(507, 'Vanarpet', 'Viveknagar', 'Bihar', '690004', NULL),
(508, 'a-11, big door', 'Outhicamannii House', 'Kerala', '320014', NULL),
(509, 'nd 29, kohat enclave, pitampura', 'new delhi', 'delhi', '110034', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE IF NOT EXISTS `basket` (
`BID` int(11) NOT NULL,
  `CID` int(11) DEFAULT NULL,
  `NumProds` int(11) DEFAULT NULL,
  `TotalCost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `basketProds`
--

CREATE TABLE IF NOT EXISTS `basketProds` (
  `BID` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `Quatity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
`CommID` int(11) NOT NULL,
  `CID` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `Comment` varchar(500) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`CommID`, `CID`, `PID`, `Comment`) VALUES
(101, 101, 13, 'awesome tennis cap!! '),
(102, 100, 12, 'this racquet is definitely worth the price!'),
(103, 102, 33, 'lost colour after a few washes, not worth the money!'),
(104, 104, 25, 'puma delivers what it promises, love the shoes!'),
(105, 101, 32, 'what a waste of money!'),
(106, 103, 36, 'the best ac in it''s price range!'),
(107, 105, 5, 'worthless piece of sh*t!'),
(108, 102, 9, 'good fit but average quality!'),
(109, 105, 25, 'cool shoes! though a bit overpriced!'),
(110, 103, 13, 'the quality is not up to the mark!'),
(111, 102, 25, 'the shoes tore after a few wears, wouldn''t recommend them to anyone!');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
`CID` int(11) NOT NULL,
  `CName` varchar(100) NOT NULL,
  `CGender` varchar(1) DEFAULT NULL,
  `CDOB` date DEFAULT NULL,
  `CEmail` varchar(100) NOT NULL,
  `CPass` varchar(100) NOT NULL,
  `CMobileNo` varchar(15) DEFAULT NULL,
  `BillingAddID` int(11) DEFAULT NULL,
  `DeliveryAddID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CID`, `CName`, `CGender`, `CDOB`, `CEmail`, `CPass`, `CMobileNo`, `BillingAddID`, `DeliveryAddID`) VALUES
(100, 'Akhilesh', 'M', '1994-09-04', 'akhilesh_alliswell@yahoo.com', 'abcd', '9911052855', 500, 500),
(101, 'Mayank', 'M', '1994-09-05', 'mayankjain94@yahoo.com', 'adbc', '9845632157', 501, 501),
(102, 'Aman', 'M', '1992-01-01', 'aman1123@gmail.com', 'pqrs', '9711881372', 502, 502),
(103, 'Akhil', 'M', '1993-10-10', 'akhilnsit12@gmail.com', 'wxyz', '9874563210', 503, 503),
(104, 'Anmol', 'M', '1994-01-01', 'anmolchugh19@yahoo.in', 'asdf', '9658742310', 504, 504),
(105, 'Udit', 'M', '1994-07-06', 'uditarora@gmail.com', 'asds', '9846516555', 509, 509);

-- --------------------------------------------------------

--
-- Table structure for table `orderedProduct`
--

CREATE TABLE IF NOT EXISTS `orderedProduct` (
  `OrderID` int(11) NOT NULL DEFAULT '0',
  `PID` int(11) NOT NULL DEFAULT '0',
  `Quatity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordr`
--

CREATE TABLE IF NOT EXISTS `ordr` (
`OrderID` int(11) NOT NULL,
  `CID` int(11) DEFAULT NULL,
  `PurchaseDate` date NOT NULL,
  `PaymentMode` varchar(20) DEFAULT NULL,
  `OrderStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`PID` int(11) NOT NULL,
  `PName` varchar(200) NOT NULL,
  `PDesc` varchar(5000) DEFAULT NULL,
  `PPrice` float NOT NULL,
  `PImgSrc` varchar(500) DEFAULT NULL,
  `PStock` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PID`, `PName`, `PDesc`, `PPrice`, `PImgSrc`, `PStock`) VALUES
(1, 'Samsung Galaxy S', NULL, 30000, 'http://cdn2.gsmarena.com/vv/bigpic/samsung-galaxy-s.jpg', 43),
(2, 'Alienware 17', NULL, 178000, 'http://www.notebookcheck.net/uploads/tx_nbc2/alienware_17_light1_s.jpg', 10),
(3, 'Kingston 8GB', NULL, 300, 'http://s0.static.mymemory.co.uk/images/product_shots/large_25007_1297702795.jpg', 100),
(4, 'Microsoft Geek400 Mouse', NULL, 1100, 'http://static3.shop.indiatimes.com/images/products/additional/original/B1064841_View_1/computers/keyboard-mouse/microsoft-wrls-mobile-mouse-1000.jpg', 25),
(5, 'Microsoft Geek400 Keyboard', NULL, 1500, 'http://blog.garethjmsaunders.co.uk/wp-content/uploads/2012/05/microsoft-intellitype-digital-pro-us.jpg', 25),
(6, 'LG Microwave Oven', NULL, 11000, 'http://www.pricepaaji.com/product_images/MJ3281BPG/520X315/LG-MJ3281BPG-32-Litres-Convection-Microwave-Oven8762.PNG', 30),
(7, 'Inalsa Mixer Grinder', NULL, 4000, 'http://www.inalsaappliances.com/inalsa_cms/productimages/PRD162-362012.jpg', 40),
(8, 'Cosco Football', NULL, 2200, 'http://stat.homeshop18.com/homeshop18/images/productImages/228/cosco-milano-football-medium_e7eed0200cae5484677fe275dcf35cfc.jpg', 110),
(9, 'Nivia Studs', NULL, 3000, 'http://sportspot.in/wordpress/wp-content/uploads/2014/04/Nivia-New-Ultra.jpeg', 50),
(10, 'MRF Bat', NULL, 12000, 'https://www.cricketmerchant.com/media/catalog/product/cache/1/image/600x547/9df78eab33525d08d6e5fb8d27136e95/m/r/mrf-players-special-virat-kohli.jpg', 30),
(11, 'Cosco Cricket Ball', NULL, 100, 'http://img6a.flixcart.com/image/ball/x/c/z/cosco-cricket-ball-cricket-275x275-imadcq32v34htkxq.jpeg', 123),
(12, 'Wilson Lawn Tennis Racquet', NULL, 6000, 'http://thesportmall.in/image/cache/data/372.1-600x600.jpg', 50),
(13, 'Wilson Lawn Tennis Cap', NULL, 600, 'http://ecx.images-amazon.com/images/I/31dHuhXfQGL._SY355_.jpg', 32),
(14, 'Levis Denim Jeans', NULL, 1200, 'http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=35317992', 150),
(15, 'Levis Denim Jacket', NULL, 5200, 'http://www.upscalehype.com/wp-content/uploads/2010/05/LevisDenimjacket.jpg', 60),
(16, 'Calvin Klein Sweat Shirt', NULL, 2200, 'http://images.asos-media.com/inv/media/3/2/0/6/4186023/image3xl.jpg', 100),
(17, 'Timberland Shorts', NULL, 3200, 'http://www.cargopants.com/gallery/products/1133/big/1299793997_timberland_shorts_-_phantom.jpg', 78),
(18, 'Woodland Sneakers', NULL, 1800, 'http://ecx.images-amazon.com/images/I/815IN7zJ6tL._UL1500_.jpg', 89),
(19, 'Jack and Jones sandals', NULL, 700, 'http://images.shuperb.co.uk/images/products/zoom/1371834102-09324400.jpg', 78),
(20, 'Lacoste formal shoes', NULL, 2300, 'http://www.outfittrends.com/wp-content/uploads/2011/04/New-Lacost-Shoes-2011.jpg', 89),
(21, 'Titan Watch', NULL, 3000, 'http://titanworld.com/in/images/data/collections/PURPLE.png', 23),
(22, 'Gforce Watch', NULL, 3500, 'http://www.gshock.com/resource/img/products/watches/xlarge/GPW1000-1B_xlarge.png', 45),
(23, 'Nike studs', NULL, 5000, 'http://www.footballboots.co.uk/wp-content/uploads/2009/10/Nike-2.jpg', 34),
(25, 'Puma sports shoes', NULL, 4500, 'http://static2.shop.indiatimes.com/images/products/additional/original/B1822313_View_2/fashion/sports/puma-white-men-sports-shoes-pumasurge.jpg', 50),
(27, 'Philips vacuum Cleaner', NULL, 5000, NULL, 31),
(28, 'usha diplomat ceiling fan', NULL, 1079, 'http://img5a.flixcart.com/image/fan/b/x/k/usha-diplomat-400x400-imaeyaur25dejnba.jpeg', 320),
(29, 'Roadster Premium Slim Fit Men''s Trousers', NULL, 1528, 'http://img5a.flixcart.com/image/trouser/x/v/c/395938-roadster-28-400x400-imae56a6pufkmekz.jpeg', 10),
(30, 'Gritstones Solid Men''s Turtle Neck T-Shirt', NULL, 437, 'http://img6a.flixcart.com/image/t-shirt/d/z/w/gsfsrfplkt60054blk-gritstones-s-400x400-imadrwtjynzhefjz.jpeg', 15),
(31, 'Tuscan High power extension cord 4 Strip Surge Protector', NULL, 299, 'http://img6a.flixcart.com/image/surge-protector/k/z/c/tsc-040-tuscan-400x400-imaeyraznrrgxubt.jpeg', 51),
(32, 'Skullcandy S2IKDZ-101 Ink''d 2 Headphone', NULL, 1199, 'http://img6a.flixcart.com/image/headphone/x/t/f/skullcandy-s2ikdz-101-400x400-imaddgqhyqmuukv7.jpeg', 21),
(33, 'Bombay Dyeing Polycotton Printed Double Bedsheet', NULL, 895, 'http://img5a.flixcart.com/image/bedsheet/c/s/3/cs03mr75925001-bombay-dyeing-400x400-imae5zfzp5zf5gga.jpeg', 16),
(34, 'Karma Race and Dash', NULL, 949, 'http://img6a.flixcart.com/image/remote-control-toy/d/2/h/karma-race-and-dash-400x400-imae3yfhj7ukmgdd.jpeg', 35),
(35, 'Audio Technica ATH-ANC23 BK In-the-ear Noise Cancelling Headphone', NULL, 4699, 'http://img6a.flixcart.com/image/headphone/f/2/c/audio-technica-ath-anc23-bk-400x400-imadnyaztbmzq9xb.jpeg', 15),
(36, 'Blue Star 3HW18JB1 1.5 Ton 3 Star Split AC', NULL, 24490, 'http://img6a.flixcart.com/image/air-conditioner-new/f/g/y/1-5-blue-star-split-3hw18jb1-400x400-imadvupthanuzhz9.jpeg', 8);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `CID` int(11) NOT NULL DEFAULT '0',
  `PID` int(11) NOT NULL DEFAULT '0',
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
`TagID` int(11) NOT NULL,
  `TagName` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`TagID`, `TagName`) VALUES
(1007, 'alienware'),
(1030, 'ball'),
(1031, 'balls'),
(1028, 'bat'),
(1029, 'bats'),
(1115, 'calvin'),
(1114, 'calvinklein'),
(1035, 'cap'),
(1098, 'casual'),
(1121, 'cleaner'),
(1038, 'cloth'),
(1037, 'clothes'),
(1039, 'clothing'),
(1099, 'computer'),
(1034, 'cosco'),
(1027, 'cricket'),
(1043, 'denim'),
(1016, 'drive'),
(1000, 'electronics'),
(1025, 'football'),
(1013, 'footwear'),
(1094, 'formal'),
(1097, 'gforce'),
(1022, 'grinder'),
(1023, 'inalsa'),
(1089, 'jack'),
(1087, 'jackandjone'),
(1088, 'jackandjones'),
(1042, 'jacket'),
(1113, 'jackets'),
(1041, 'jean'),
(1040, 'jeans'),
(1090, 'jones'),
(1019, 'keyboard'),
(1008, 'kingston'),
(1009, 'kitchen'),
(1116, 'klein'),
(1117, 'klien'),
(1093, 'lacoste'),
(1006, 'laptop'),
(1012, 'lawn'),
(1010, 'lawntennis'),
(1112, 'levis'),
(1005, 'lg'),
(1018, 'microsoft'),
(1020, 'microwave'),
(1021, 'mixer'),
(1017, 'mouse'),
(1033, 'mrf'),
(1110, 'nike'),
(1032, 'nivia'),
(1024, 'oven'),
(1015, 'pendrive'),
(1119, 'philips'),
(1003, 'phone'),
(1111, 'puma'),
(1109, 'racquet'),
(1004, 'samsung'),
(1086, 'sandal'),
(1085, 'sandals'),
(1044, 'shirt'),
(1118, 'shirts'),
(1091, 'shoe'),
(1092, 'shoes'),
(1048, 'short'),
(1049, 'shorts'),
(1050, 'sneakers'),
(1100, 'sport'),
(1001, 'sports'),
(1101, 'stud'),
(1026, 'studs'),
(1045, 'sweat'),
(1046, 'sweatshirt'),
(1011, 'tennis'),
(1047, 'timberland'),
(1095, 'titan'),
(1120, 'vacuum'),
(1122, 'vacuumcleaner'),
(1096, 'watch'),
(1014, 'watches'),
(1103, 'wearable'),
(1002, 'wearables'),
(1036, 'wilson'),
(1084, 'woodland');

-- --------------------------------------------------------

--
-- Table structure for table `tagProduct`
--

CREATE TABLE IF NOT EXISTS `tagProduct` (
  `PID` int(11) DEFAULT NULL,
  `TagID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagProduct`
--

INSERT INTO `tagProduct` (`PID`, `TagID`) VALUES
(1, 1000),
(1, 1003),
(1, 1004),
(2, 1000),
(2, 1006),
(2, 1007),
(2, 1099),
(3, 1000),
(3, 1008),
(3, 1015),
(3, 1016),
(4, 1000),
(4, 1017),
(4, 1018),
(5, 1000),
(5, 1018),
(5, 1019),
(6, 1000),
(6, 1005),
(6, 1020),
(6, 1024),
(7, 1000),
(7, 1021),
(7, 1022),
(7, 1023),
(8, 1001),
(8, 1025),
(8, 1030),
(8, 1031),
(8, 1034),
(8, 1100),
(9, 1001),
(9, 1002),
(9, 1025),
(9, 1026),
(9, 1032),
(9, 1091),
(9, 1092),
(9, 1100),
(9, 1101),
(9, 1103),
(10, 1001),
(10, 1027),
(10, 1028),
(10, 1029),
(10, 1033),
(10, 1100),
(11, 1001),
(11, 1027),
(11, 1030),
(11, 1031),
(11, 1034),
(11, 1100),
(12, 1001),
(12, 1010),
(12, 1011),
(12, 1012),
(12, 1036),
(12, 1100),
(12, 1109),
(13, 1001),
(13, 1002),
(13, 1010),
(13, 1011),
(13, 1012),
(13, 1035),
(13, 1036),
(13, 1037),
(13, 1038),
(13, 1039),
(13, 1100),
(13, 1103),
(14, 1002),
(14, 1037),
(14, 1038),
(14, 1039),
(14, 1040),
(14, 1041),
(14, 1043),
(14, 1103),
(14, 1112),
(15, 1002),
(15, 1037),
(15, 1038),
(15, 1039),
(15, 1042),
(15, 1043),
(15, 1103),
(15, 1112),
(15, 1113),
(16, 1002),
(16, 1037),
(16, 1038),
(16, 1039),
(16, 1044),
(16, 1045),
(16, 1046),
(16, 1103),
(16, 1114),
(16, 1115),
(16, 1116),
(16, 1118),
(17, 1002),
(17, 1037),
(17, 1038),
(17, 1039),
(17, 1047),
(17, 1048),
(17, 1049),
(17, 1103),
(18, 1002),
(18, 1050),
(18, 1084),
(18, 1091),
(18, 1092),
(18, 1103),
(19, 1002),
(19, 1085),
(19, 1086),
(19, 1088),
(19, 1089),
(19, 1090),
(19, 1091),
(19, 1092),
(19, 1103),
(20, 1002),
(20, 1091),
(20, 1092),
(20, 1093),
(20, 1094),
(20, 1103),
(21, 1002),
(21, 1014),
(21, 1095),
(21, 1096),
(21, 1103),
(22, 1002),
(22, 1014),
(22, 1096),
(22, 1097),
(22, 1103),
(23, 1001),
(23, 1002),
(23, 1026),
(23, 1091),
(23, 1092),
(23, 1100),
(23, 1101),
(23, 1103),
(23, 1110),
(25, 1001),
(25, 1002),
(25, 1091),
(25, 1092),
(25, 1100),
(25, 1103),
(25, 1111),
(27, 1000),
(27, 1119),
(27, 1120),
(27, 1121),
(27, 1122);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`AddID`), ADD KEY `CID` (`CID`);

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
 ADD PRIMARY KEY (`BID`), ADD KEY `CID` (`CID`);

--
-- Indexes for table `basketProds`
--
ALTER TABLE `basketProds`
 ADD KEY `BID` (`BID`), ADD KEY `PID` (`PID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
 ADD PRIMARY KEY (`CommID`), ADD KEY `CID` (`CID`), ADD KEY `PID` (`PID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
 ADD PRIMARY KEY (`CID`), ADD UNIQUE KEY `CEmail` (`CEmail`), ADD KEY `BillingAddID` (`BillingAddID`), ADD KEY `DeliveryAddID` (`DeliveryAddID`);

--
-- Indexes for table `orderedProduct`
--
ALTER TABLE `orderedProduct`
 ADD PRIMARY KEY (`OrderID`,`PID`), ADD KEY `PID` (`PID`);

--
-- Indexes for table `ordr`
--
ALTER TABLE `ordr`
 ADD PRIMARY KEY (`OrderID`), ADD KEY `CID` (`CID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
 ADD PRIMARY KEY (`CID`,`PID`), ADD KEY `PID` (`PID`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
 ADD PRIMARY KEY (`TagID`), ADD UNIQUE KEY `TagName` (`TagName`), ADD KEY `TagName_2` (`TagName`);

--
-- Indexes for table `tagProduct`
--
ALTER TABLE `tagProduct`
 ADD UNIQUE KEY `PID` (`PID`,`TagID`), ADD KEY `TagID` (`TagID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
MODIFY `AddID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=510;
--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
MODIFY `CommID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `ordr`
--
ALTER TABLE `ordr`
MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1123;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `basket`
--
ALTER TABLE `basket`
ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `basketProds`
--
ALTER TABLE `basketProds`
ADD CONSTRAINT `basketProds_ibfk_1` FOREIGN KEY (`BID`) REFERENCES `basket` (`BID`),
ADD CONSTRAINT `basketProds_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`BillingAddID`) REFERENCES `address` (`AddID`),
ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`DeliveryAddID`) REFERENCES `address` (`AddID`);

--
-- Constraints for table `orderedProduct`
--
ALTER TABLE `orderedProduct`
ADD CONSTRAINT `orderedProduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `ordr` (`OrderID`),
ADD CONSTRAINT `orderedProduct_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `ordr`
--
ALTER TABLE `ordr`
ADD CONSTRAINT `ordr_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`);

--
-- Constraints for table `tagProduct`
--
ALTER TABLE `tagProduct`
ADD CONSTRAINT `tagProduct_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `product` (`PID`),
ADD CONSTRAINT `tagProduct_ibfk_2` FOREIGN KEY (`TagID`) REFERENCES `tag` (`TagID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
