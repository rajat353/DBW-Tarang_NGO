-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2018 at 07:21 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `assignmem` ()  Begin
Declare done int default 0;
Declare childid int;
Declare memid int;
Declare campid int;
Declare cur1 cursor for select id,campid from children where id not in (select childid from teaches);
Declare continue handler for not found set done=1;
Open cur1;
Repeat
Fetch cur1 into childid,campid;
Select memid into memid from campmembers inner join children on
Campmembers.campid=children.campid limit 1;
Insert into teaches values(memid,childid);
Until done
End repeat;
Close cur1;
End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CampMembersInCity` (IN `cityin` VARCHAR(20))  begin
select memid,name,email,contact from campmembers where campid in (select id from campdetails where city = cityin);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CampsInState` (IN `statein` VARCHAR(20))  begin
select id,location,city from campedetails where hqid in (select hqid from headquarters where state=statein);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HomeMembersInCity` (IN `cityin` VARCHAR(20))  begin
select memid,name,email,contact from oldagemembers where oldagehomeid in (select id from oldagehomes where city=cityin);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `HomesInState` (IN `statein` VARCHAR(20))  begin
select id,location,city from oldagehomes where hqid in (select hqid from headquarters where state=statein);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `campdetails`
--

CREATE TABLE `campdetails` (
  `id` int(11) NOT NULL,
  `hqid` int(11) NOT NULL,
  `location` varchar(40) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campdetails`
--

INSERT INTO `campdetails` (`id`, `hqid`, `location`, `city`) VALUES
(21, 1301, 'Shastri Nagar', 'Kanpur'),
(22, 1301, 'opp Ram Nagar Fort', 'Varanasi'),
(23, 1301, 'Delhi Road', 'Meerut'),
(24, 1301, 'P L Sharma Road', 'Jhansi'),
(25, 1301, 'near Vishram Ghat', 'Mathura'),
(26, 1301, 'Geeta Nagar', 'Rampur'),
(27, 1301, 'Nayi Mandi', 'Muzaffarnagar'),
(28, 1301, 'Azadpur', 'Agra'),
(31, 1302, 'Govindpuri', 'Allahabad'),
(32, 1302, 'Abdul Kalam Road', 'Lucknow'),
(33, 1302, 'near Fun City', 'Bareilly'),
(34, 1302, 'Hemant Nagar', 'Aligarh'),
(35, 1302, 'opp. Ghantaghar', 'Faizabad'),
(36, 1302, 'near Medical college', 'Gorakhpur'),
(37, 1302, 'Yamuna Bank', 'Chitrakut'),
(41, 1401, 'Gandhi Market', 'Ludhiana'),
(42, 1401, 'Veer Colony', 'Bathinda'),
(43, 1401, 'Janta Nagar', 'Faridkot'),
(44, 1401, 'Ranjit Avenue', 'Amritsar'),
(45, 1401, 'Govindpura', 'Kapurthala'),
(46, 1401, 'Bhupindra Nagar', 'Patiala'),
(51, 1001, 'near Maya Devi Temple', 'Haridwar'),
(52, 1001, 'near Kathgodam Railway Station', 'Nainital'),
(53, 1001, 'Civil Lines', 'Roorkee'),
(54, 1001, 'near Seeta Devi Temple', 'Pauri'),
(55, 1001, 'near Pinnacle Tower', 'Kashipur'),
(56, 1001, ' opp. G B Pant University', 'Rudrapur'),
(57, 1001, 'Mussorie Road', 'Dehradun'),
(71, 1201, 'Bhrama Sarovar', 'Kurukshetra'),
(72, 1201, 'Kachhi Basti', 'Chandigarh'),
(73, 1201, 'opp City Park', 'Ambala'),
(74, 1201, 'beside Ahir College', 'Rewari'),
(75, 1201, 'near ChhotuRam College', 'Rohtak'),
(76, 1201, 'opp Durga Bhawani Mandir', 'Karnal'),
(77, 1201, 'Gandhi Ashram', 'Palwal');

-- --------------------------------------------------------

--
-- Table structure for table `campmembers`
--

CREATE TABLE `campmembers` (
  `memid` int(11) NOT NULL,
  `campid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `datejoin` date NOT NULL,
  `gender` char(1) NOT NULL,
  `dob` date NOT NULL,
  `bloodgroup` varchar(4) DEFAULT NULL,
  `passwrd` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campmembers`
--

INSERT INTO `campmembers` (`memid`, `campid`, `name`, `emailid`, `contact`, `datejoin`, `gender`, `dob`, `bloodgroup`, `passwrd`) VALUES
(21001, 21, 'Ravinder Singh', 'singhravi23@gmail.com', '9938478628', '2016-01-03', 'M', '1995-10-24', 'B-', 'Ravi@333'),
(21002, 21, 'Gurprit Sodhi', 'gurprit.sodhi33@gmail.com', '7745821241', '2016-03-12', 'M', '1998-06-18', 'O+', 'Sodhi345'),
(21003, 21, 'Aditi Purohit', 'aditi.pur2013@gmail.com', '8547623144', '2016-05-02', 'F', '1997-04-26', 'A+', 'puroAdi54'),
(21004, 21, 'Ananya Bansal', 'bansalana364@gmail.com', '9554876215', '2016-05-10', 'F', '1995-01-09', 'B-', 'Anin645'),
(21005, 21, 'Hardik Gupta', 'hardik.hg34@gmail.com', '8845762213', '2016-08-22', 'M', '1999-11-14', 'B+', 'Hard777'),
(21006, 21, 'Vishwas Singh', 'Vishwas.vs99@gmail.com', '7745886637', '2016-09-16', 'M', '1998-05-24', 'A+', 'Vishu453'),
(22001, 22, 'Umar Khan', 'khanumar645@gmail.com', '7745223619', '2016-01-04', 'M', '1999-02-14', 'A-', 'KhanUmr233'),
(22002, 22, 'Vinita Garg', 'gargvinita56.@gmail.com', '8856332147', '2016-03-02', 'F', '1996-07-11', 'O-', 'Vinita@771'),
(22003, 22, 'Raksha Sharma', 'raksha.rs66@gmail.com', '9666584332', '2016-04-10', 'F', '1997-11-26', 'O+', 'rakshaPS998'),
(22004, 22, 'Anika Agarwal', 'anikaguota567@gmail.com', '7789356211', '2016-05-30', 'F', '1997-07-04', 'B+', 'AnikaAg616'),
(22005, 22, 'Parth Goel', 'parth.ra77@gmail.com', '7445883323', '2016-07-22', 'M', '1995-11-24', 'A+', 'RAparth77'),
(22006, 22, 'Vibhor Sharma', 'vibhor.vs97@gmail.com', '8989547855', '2016-08-15', 'M', '1998-03-04', 'AB+', 'Vibhu889'),
(22007, 22, 'Aditya Dave', 'daveadit434@gmail.com', '6898574452', '2016-08-26', 'M', '1999-09-02', 'A-', 'AditAD667'),
(22008, 22, 'Shruti Jain', 'shruti.jain311@gmail.com', '9932114552', '2016-09-06', 'F', '1998-06-01', 'B+', 'Shruti998'),
(23001, 23, 'Rajiv Sharma', 'rajivsharma1022@gmail.com', '9377463522', '2016-01-12', 'M', '1997-04-21', 'AB+', 'Rajivtarang2'),
(23002, 23, 'Aditya Tiwari', 'tiwariadi665@gmail.com', '9987263763', '2016-06-23', 'M', '1998-02-27', 'B+', 'Aditiwari886'),
(23003, 23, 'Aditi Kumari', 'aditi.kumari22@gmail.com', '8827937552', '2016-11-02', 'F', '1997-08-16', 'A+', 'kumariAdi676'),
(23004, 23, 'Vishwas Sen', 'senvishwas292@gmail.com', '7882737221', '2017-05-17', 'M', '1996-09-13', 'B-', 'senVishu778'),
(23005, 23, 'Hasan Ali', 'ali.hasan787@gmail.com', '9099836252', '2017-10-22', 'M', '1998-11-11', 'O+', 'hasanAli88'),
(24001, 24, 'Ayush Patel', 'patel.ayush66@gmail.com', '8872927366', '2016-01-13', 'M', '1996-02-17', 'B-', 'ayushTarang0'),
(24002, 24, 'Anvi Agarwal', 'agg.anvi067@gmail.com', '9982773611', '2016-10-04', 'F', '1997-08-06', 'O+', 'anviAgg887'),
(24003, 24, 'Tej Pratap', 'prataptez88@gmail.com', '7728739266', '2017-06-17', 'M', '1998-07-23', 'AB-', 'TezPratap111'),
(24004, 24, 'Ashi Verma', 'ashi.ashi76@gmail.com', '8811534112', '2017-12-22', 'F', '1999-01-10', 'A+', 'AshiTarng652'),
(25001, 25, 'Rohan Jain', 'jainrohu69@gmail.com', '7726834135', '2016-01-04', 'M', '1996-12-17', 'AB-', 'Rohu9908'),
(25002, 25, 'Kavita Agarwal', 'kavita.agrw97@gmail.com', '8897112215', '2016-08-10', 'F', '1999-05-06', 'O-', 'kaviAgrw413'),
(25003, 25, 'Tanvi Singh', 'singh.tan897@gmail.com', '9904771112', '2017-03-27', 'F', '1997-07-26', 'B-', 'Tannu767'),
(25004, 25, 'Janwi Gupta', 'janwi.gupta212@gmail.com', '9909866561', '2018-06-02', 'F', '1998-10-16', 'AB+', 'JanGupta231'),
(26001, 26, 'Utsav Kunwar', 'kunutsav223@gmail.com', '7728971195', '2016-01-14', 'M', '1999-06-15', 'B-', 'Utsav3647'),
(26002, 26, 'Kiran Agarwal', 'kiran.agrw97@gmail.com', '9878655215', '2016-07-19', 'F', '1998-03-16', 'AB+', 'kiranAgrw413'),
(26003, 26, 'Tanuj Singh', 'sin.tanuj897@gmail.com', '7716826343', '2017-09-22', 'M', '1997-09-20', 'O+', 'Tannuj763'),
(26004, 26, 'Vidhi Suman', 'vidhi.suman99@gmail.com', '6893714263', '2018-01-08', 'F', '1998-11-06', 'A+', 'SumanVid77'),
(27001, 27, 'Harshit Jain', 'jainhar969@gmail.com', '8972001292', '2016-01-18', 'M', '1996-08-13', 'AB-', 'harshitJain7'),
(27002, 27, 'Sumit Verma', 'sumittver807@gmail.com', '9182771872', '2016-04-10', 'M', '1999-09-26', 'O-', 'Sumitt776'),
(27003, 27, 'Umang Joshi', 'umangjoshh33@gmail.com', '9928176155', '2017-09-27', 'M', '1997-12-16', 'AB-', 'joshUmang32'),
(28001, 28, 'Ankit Tomar', 'tomarankit54@gmail.com', '8171760210', '2016-01-04', 'M', '1997-12-17', 'A-', 'Tomarkit443'),
(28002, 28, 'Simran Goyal', 'simaran9098@gmail.com', '9289983111', '2016-08-10', 'F', '1998-06-19', 'O+', 'simar4432'),
(28003, 28, 'Vidhya Ojha', 'vidh.ojha121@gmail.com', '8928988192', '2017-03-27', 'F', '1997-07-18', 'B-', 'Ojha8989'),
(31001, 31, 'Piyush Gupta', 'piyush.pg69@gmail.com', '9963541214', '2017-01-04', 'M', '1996-03-04', 'A-', 'Piyush69'),
(31002, 31, 'Arushi Bhardwaj', 'arushibhd77.@gmail.com', '8851793644', '2017-01-15', 'F', '1999-07-01', 'O-', 'Arushii771'),
(31003, 31, 'Kavita Joshi', 'joshi.kavita66@gmail.com', '8977482136', '2017-02-10', 'F', '1995-11-16', 'O+', 'PoemPj76'),
(31004, 31, 'Ankita Raghav', 'raghavani88@gmail.com', '6695847124', '2017-02-27', 'F', '1999-03-14', 'B+', 'AniAni56'),
(31005, 31, 'Tushar Verma', 'tush.agg67@gmail.com', '7986475584', '2017-03-11', 'M', '1995-12-24', 'A+', 'TushAgg78'),
(31006, 31, 'Hamid Ali', 'alihamid7767@gmail.com', '9965847211', '2017-03-19', 'M', '1998-05-17', 'AB+', 'HamidAli89'),
(31007, 31, 'Aditya Kumawat', 'kumawa.Aditya77@gmail.com', '7784552685', '2017-04-26', 'M', '1999-09-02', 'A-', 'AditKM867'),
(31008, 31, 'Anuja Rawat', 'anuja.raw22@gmail.com', '8895648651', '2017-05-17', 'F', '1997-05-09', 'B+', 'AnujRaw09'),
(31009, 31, 'Vandana Tomar', 'tomarvan998@gmail.com', '9986485558', '2017-05-06', 'F', '1996-06-21', 'B+', 'vanTomar88'),
(32001, 32, 'Amit Shukla', 'shuklamit443@gmail.com', '9987998461', '2017-01-05', 'M', '1998-11-03', 'A+', 'Amitt3344'),
(32002, 32, 'Kiran Dave', 'kirannda66@gmail.com', '8874599548', '2017-03-16', 'F', '1997-12-13', 'AB+', 'KiDave9292'),
(32003, 32, 'Ashutosh Goyal', 'ashugg888@gmail.com', '7745811362', '2017-04-13', 'M', '1998-01-23', 'A-', 'Ashu8889'),
(32004, 32, 'Tanmay Kumar', 'kumar.tan66@gmail.com', '6685448877', '2017-11-15', 'M', '1996-04-14', 'O+', 'Tannu1441'),
(32005, 32, 'Dipansha Gaur', 'deep.gaur22@gmail.com', '9001230054', '2018-01-25', 'F', '1997-03-16', 'O+', 'Deepan69'),
(33001, 33, 'Ayush Garg', 'gargayush545@gmail.com', '9971100320', '2017-01-10', 'M', '1997-09-06', 'AB-', 'ayushAG889'),
(33002, 33, 'Tannu Sharma', 'tannu.sharma88@gmail.com', '7789658461', '2017-05-12', 'F', '1999-07-17', 'A-', 'iamTannu66'),
(33003, 33, 'Aditya Jain', 'adiijain711@gmail.com', '9001254681', '2017-08-15', 'M', '1998-08-18', 'B+', 'AdiiJain89'),
(33004, 33, 'Pradeep Tiwari', 'tiwariPra11@gmail.com', '9923001457', '2018-02-25', 'M', '1998-11-27', 'A+', 'Pradeep009'),
(34001, 34, 'Anju Nagar', 'nagar.anju78@gmail.com', '7782331661', '2017-01-22', 'F', '1997-10-25', 'B+', 'Anjuu8812'),
(34002, 34, 'Seema Vijay', 'seemavijay1010@gmail.com', '7705618461', '2017-03-16', 'F', '1998-01-13', 'O+', 'jaySeema90'),
(34003, 34, 'Arvind Yadav', 'yadav.Avi878@gmail.com', '9980123360', '2017-12-14', 'M', '1997-07-03', 'AB+', 'ArviYad88'),
(34004, 34, 'utsav', 'utsavgupta2807@gmail.com', '9023111221', '2018-11-23', 'm', '2018-11-05', 'a+', 'acdER3'),
(35001, 35, 'Shriti Jain', 'shritijain1996@gmail.com', '7122244461', '2017-01-11', 'F', '1996-03-07', 'AB+', 'Shriti092'),
(35002, 35, 'Amit Verma', 'vermamit1243@gmail.com', '9663001245', '2017-04-19', 'M', '1998-11-23', 'A+', 'vermAmit011'),
(35003, 35, 'Siddharth Agarwal', 'sidd.agg212@gmail.com', '9040050061', '2017-12-30', 'M', '1999-06-08', 'O-', 'sidAgg812'),
(35004, 35, 'Poonam Sharma', 'poonamsh1029@gmail.com', '9001400201', '2018-04-28', 'F', '1999-10-09', 'B-', 'Pooma8787'),
(36001, 36, 'Kriti Joshi', 'kriti.joshi1001@gmail.com', '8887458411', '2017-01-13', 'F', '1997-10-12', 'B-', 'Kriti9101'),
(36002, 36, 'Aman Mishra', 'mishraman1082@gmail.com', '7785002161', '2017-01-24', 'M', '1998-09-15', 'B+', 'AMan1234'),
(36003, 36, 'Muskaan Gupta', 'muskaan9191@gmail.com', '9007754112', '2017-09-08', 'F', '1998-12-06', 'AB+', 'muskGupta66'),
(36004, 36, 'Atithi Bhandari', 'atithi.ash11@gmail.com', '9110211551', '2018-02-14', 'F', '1997-05-08', 'AB+', 'Atithiii09'),
(37001, 37, 'Hema Naiwal', 'hema.n8787@gmail.com', '7108800741', '2017-01-13', 'F', '1998-05-06', 'AB+', 'HemaaN907'),
(37002, 37, 'Parul Joshi', 'parul.pri333@gmail.com', '8045504752', '2017-02-07', 'F', '1997-12-03', 'O+', 'ParulPri22'),
(37003, 37, 'Kinjal Sharma', 'kin.sha1819@gmail.com', '7780040800', '2018-03-17', 'F', '1999-06-16', 'B+', 'kinnSh221'),
(41001, 41, 'Rubina Banu', 'banu.rubby626@gmail.com', '9966584110', '2018-01-05', 'F', '1996-06-19', 'B+', 'rubbyBanu11'),
(41002, 41, 'Tanay Gupta', 'tanay.gupta545@gmail.com', '9008733321', '2018-01-08', 'M', '1997-11-16', 'A-', 'tanayTG673'),
(41003, 41, 'Himanshu Chaudhary', 'himanchaudh11@gmail.com', '6885741161', '2018-04-15', 'M', '1996-10-08', 'AB+', 'himaHC29'),
(41004, 41, 'Sachin Jangid', 'jansach1092@gmail.com', '8665887007', '2018-08-13', 'M', '1998-07-01', 'AB-', 'SachSJ881'),
(42001, 42, 'Ishita Jain', 'jainishu896@gmail.com', '8873306311', '2018-01-05', 'F', '1996-01-19', 'B+', 'jainIsshu11'),
(42002, 42, 'Kartik Dhiman', 'kartikkdh112@gmail.com', '8823307745', '2018-01-08', 'M', '1997-12-16', 'A-', 'kartikKD22'),
(42003, 42, 'Hitesh Goyal', 'hituhg1200@gmail.com', '7455200031', '2018-04-15', 'M', '1996-02-08', 'AB+', 'Hitu102'),
(43001, 43, 'Shivanshi Arora', 'shivaror123@gmail.com', '7778477854', '2018-01-05', 'F', '1996-04-19', 'B+', 'Dream9191'),
(43002, 43, 'Abhinav Dhawan', 'abhi.dhawan11@gmail.com', '9980037121', '2018-01-18', 'M', '1997-01-16', 'A-', 'AbhiAD0101'),
(43003, 43, 'Varun Saxena', 'varun.vs1212@gmail.com', '8663214758', '2018-04-15', 'M', '1996-11-08', 'AB+', 'iamVarun12'),
(43004, 43, 'Shreya Kapoor', 'kapoor.shreya112@gmail.com', '8663012475', '2018-08-23', 'F', '1998-03-01', 'AB-', 'KapoorSh19'),
(43005, 43, 'Sachin Gaur', 'gaur.sahh21@gmail.com', '9320145707', '2018-10-13', 'M', '1998-07-02', 'AB-', 'SahhSg112'),
(44001, 44, 'Anika Goyal', 'goyal.Annu89@gmail.com', '7118171200', '2018-01-05', 'F', '1996-07-19', 'B+', 'AnuuAg8100'),
(44002, 44, 'Parinika Chopra', 'chopra.pari456@gmail.com', '6339002145', '2018-02-08', 'F', '1997-12-16', 'A-', 'PariCP736'),
(44003, 44, 'Amir Khan', 'khan.amir787@gmail.com', '8871231235', '2018-05-15', 'M', '1996-09-08', 'AB+', 'AmiKhan787'),
(45001, 45, 'Ankita Mishra', 'ankitmiss11@gmail.com', '7881452368', '2018-01-05', 'F', '1996-05-29', 'B+', 'Anki0975'),
(45002, 45, 'Rajdeep Hada', 'hada.raj172@gmail.com', '9550035321', '2018-01-08', 'M', '1997-11-16', 'A-', 'HadaRaj181'),
(45003, 45, 'Naman Jain', 'jainaman826@gmail.com', '8894475121', '2018-04-15', 'M', '1996-02-18', 'AB+', 'NamanJN211'),
(45004, 45, 'Manan Nandwana', 'man.nand123@gmail.com', '9987402510', '2018-09-13', 'M', '1998-07-21', 'AB-', 'NandMan100'),
(46001, 46, 'Nupur Sharma', 'nupursharma908@gmail.com', '9663399010', '2018-01-05', 'F', '1996-08-19', 'B+', 'nupurNS12'),
(46002, 46, 'Manish Jain', 'manishmj871@gmail.com', '9708040991', '2018-02-08', 'M', '1997-06-16', 'A-', 'MJmanish918'),
(46003, 46, 'Mansi Garg', 'mansi.agg12@gmail.com', '7996012331', '2018-08-13', 'F', '1998-04-01', 'AB-', 'mansiAgg123'),
(46004, 46, 'Rajat Agarwal', 'agarwalraj908@gmail.com', '9799412061', '2018-09-15', 'M', '1996-03-08', 'AB+', 'RajatRJ01'),
(46005, 46, 'Mitesh Bansal', 'mitesh.bansal354@gmail.com', '7947979450', '2018-11-03', 'M', '1998-02-18', 'AB-', 'miteshBM79'),
(51001, 51, 'Mansi Saiba', 'mansi.saiba626@gmail.com', '8874155254', '2010-01-05', 'F', '1991-06-19', 'B+', 'MSaiba11'),
(51002, 51, 'Prashant Guar', 'guar.pra545@gmail.com', '9633698522', '2010-01-08', 'M', '1992-11-16', 'A-', 'gaurPR673'),
(51003, 51, 'Kritik Mehra', 'mehrakrt11@gmail.com', '9079478552', '2012-04-15', 'M', '1992-10-08', 'AB+', 'Krish989'),
(51004, 51, 'Virat Sen', 'virat.sen92@gmail.com', '7988774554', '2014-08-13', 'M', '1994-07-01', 'A-', 'ViruVS29'),
(52001, 52, 'Dharmesh Rastogi', 'rasdharma013@gmail.com', '7484471100', '2010-01-05', 'M', '1992-11-03', 'A+', 'dharmRD11'),
(52002, 52, 'Apoorve Sinha', 'sinha.apoorve11@gmail.com', '8875214518', '2011-01-16', 'F', '1991-12-13', 'AB+', 'Apoorv1012'),
(52003, 52, 'Danish Khan', 'danish.dk281@gmail.com', '7849841362', '2012-04-13', 'M', '1993-01-23', 'A-', 'DKhan2112'),
(52004, 52, 'Utkarsh Singhal', 'singhal.ut383@gmail.com', '6866300177', '2014-11-15', 'M', '1993-04-14', 'O+', 'SinghalUS18'),
(52005, 52, 'Kanika Purohit', 'kanika.kpur29@gmail.com', '9001888955', '2015-10-25', 'F', '1994-03-16', 'A+', 'KPur8281'),
(53001, 53, 'Sargam Garg', 'garg.sar545@gmail.com', '9033690320', '2010-01-11', 'M', '1992-09-06', 'AB-', 'Sgarg0109'),
(53002, 53, 'Priyanka Shindey', 'shin.priya88@gmail.com', '8996748461', '2010-05-12', 'F', '1991-07-17', 'A-', 'shinPS18'),
(53003, 53, 'Kartik Yadav', 'kartik.cool39@gmail.com', '9011000321', '2013-03-16', 'M', '1993-08-18', 'B+', 'KartKC382'),
(53004, 53, 'Pranshu Dwivedi', 'pranshu.dw123@gmail.com', '9919001757', '2013-02-25', 'M', '1993-11-27', 'A+', 'Pranshu810'),
(53005, 53, 'Dipansha Khichi', 'deep.khichi34@gmail.com', '8552010054', '2015-01-05', 'F', '1994-04-30', 'O+', 'Kdeep321'),
(53006, 53, 'Akriti Verma', 'akritiverma545@gmail.com', '9744455614', '2016-06-30', 'F', '1996-07-17', 'AB+', 'AkritiAV25'),
(54001, 54, 'Somya Gupta', 'somyagupta78@gmail.com', '8883322827', '2010-01-22', 'F', '1991-10-25', 'B+', 'Somya1028'),
(54002, 54, 'Nikki Agarwal', 'nikki.agr156@gmail.com', '9302221846', '2011-03-16', 'F', '1992-08-10', 'O+', 'nikkiAN198'),
(54003, 54, 'Arvind Sodhi', 'sodhi.Avi878@gmail.com', '8663203160', '2012-06-14', 'M', '1991-07-13', 'AB+', 'SodhiAS880'),
(54004, 54, 'Jyoti Khanna', 'khanna.jyoti22@gmail.com', '9123213004', '2013-02-25', 'F', '1992-01-19', 'A+', 'JyotiJK23'),
(54005, 54, 'Prabhanshu Sharma', 'prabhu.shm32@gmail.com', '8774730884', '2014-07-25', 'M', '1994-06-16', 'O-', 'prabhuPS99'),
(55001, 55, 'Mitanshi Mittal', 'mittal.mita676@gmail.com', '7748844461', '2010-01-11', 'F', '1990-03-07', 'AB+', 'MitanshMM29'),
(55002, 55, 'Amit Verma', 'vermamit0089@gmail.com', '9986771423', '2011-04-19', 'M', '1992-11-23', 'A+', 'vermAmit767'),
(55003, 55, 'Suyash Nigam', 'nigamsuyash841@gmail.com', '8663330012', '2011-12-30', 'M', '1991-06-08', 'O-', 'suyshSN012'),
(55004, 55, 'Akshara Suman', 'akshara.aj121@gmail.com', '6995478801', '2012-04-28', 'F', '1995-10-09', 'B-', 'AkshSA138'),
(55005, 55, 'Mahi Tiwari', 'mahi.tiwari818@gmail.com', '7748669584', '2014-01-25', 'F', '1994-03-16', 'AB-', 'MahiWe112'),
(56001, 56, 'Bhumi Joshi', 'bhumi.joshi1001@gmail.com', '6695558475', '2010-01-13', 'F', '1990-10-12', 'B-', 'BHumi0101'),
(56002, 56, 'Anil Johar', 'anil.johar2182@gmail.com', '7789741552', '2011-01-24', 'M', '1992-09-15', 'B+', 'AnilAj94'),
(56003, 56, 'Gaurav Gupta', 'gaurav.gvu7891@gmail.com', '9774856951', '2011-09-08', 'M', '1991-12-06', 'AB+', 'GAurav866'),
(56004, 56, 'Richa Gautam', 'gautam.richa721@gmail.com', '8117211551', '2012-02-14', 'F', '1993-05-08', 'AB+', 'RichaRG90'),
(56005, 56, 'Naima Suthar', 'naima.snaima66@gmail.com', '9089637854', '2014-01-25', 'F', '1994-01-16', 'O+', 'SNaima464'),
(56006, 56, 'Varnit Goswami', 'varnit.gosw882@gmail.com', '7771240054', '2016-03-05', 'M', '1995-06-11', 'AB+', 'VGvarnit60'),
(57001, 57, 'Bhawna Sharma', 'sharmabhawana07@gmail.com', '9544546547', '2010-01-13', 'F', '1991-05-06', 'AB+', 'BhawSH97'),
(57002, 57, 'Shilpa Joshi', 'shilpa.joshii21@gmail.com', '8045507952', '2010-02-07', 'F', '1992-12-03', 'O+', 'Shilpii08'),
(57003, 57, 'Arpan Kumar', 'kumararpan909@gmail.com', '7787840510', '2013-03-17', 'M', '1994-06-16', 'B+', 'ArpuVC112'),
(57004, 57, 'Nikita Khandelwal', 'nikki.khadel12@gmail.com', '9001533944', '2014-01-25', 'F', '1994-03-06', 'O+', 'nikkuNK098'),
(57005, 57, 'Rahul Sinha', 'sinha.rahul010@gmail.com', '9793330454', '2015-01-25', 'M', '1995-04-16', 'B+', 'RahulCool09'),
(71001, 71, 'Ekta Parekh', 'ektaparekh554@gmail.com', '7791201040', '2014-01-05', 'F', '1996-06-19', 'B+', 'EktaPare192'),
(71002, 71, 'Neil Thakur', 'thakur.niel815@gmail.com', '8008698071', '2014-01-08', 'M', '1995-11-16', 'AB-', 'neelTN811'),
(71003, 71, 'Samar Naidu', 'samar.naidu292.com', '9077803210', '2015-04-15', 'M', '1996-10-08', 'B+', 'samarNAidu18'),
(71004, 71, 'Dhruv Pandey', 'dhruvpandey151@gmail.com', '8890124070', '2016-08-13', 'M', '1997-07-01', 'AB-', 'PandeyPD102'),
(72001, 72, 'Pranav Sachdev', 'sachpranav190@gmail.com', '9451126248', '2014-01-05', 'M', '1995-11-03', 'A+', 'PranavSD61'),
(72002, 72, 'Drishthi Rao', 'drishthirao9810@gmail.com', '8001245450', '2014-03-16', 'F', '1996-12-13', 'A+', 'DRao752'),
(72003, 72, 'Muaz Ul Khan', 'muazulkhan710@gmail.com', '7750012457', '2015-04-13', 'M', '1996-01-23', 'A-', 'muazUK098'),
(72004, 72, 'Suraj Mehta', 'mehta.suraj712@gmail.com', '9987400105', '2016-11-15', 'M', '1997-04-14', 'O+', 'surajMehta67'),
(72005, 72, 'Divya Batra', 'divyabatra324@gmail.com', '9828481275', '2017-01-25', 'F', '1997-03-16', 'A+', 'DivyaDB869'),
(73001, 73, 'Antika Chauhan', 'antika.chauhan772@gmail.com', '7858648112', '2014-01-10', 'F', '1995-09-06', 'B-', 'antikaCH888'),
(73002, 73, 'Uma Dixit', 'umadixit458@gmail.com', '9649425174', '2014-05-12', 'F', '1996-07-17', 'A-', 'UmaDU768'),
(73003, 73, 'Anil Kejariwal', 'anilkejri718@gmail.com', '8856162634', '2015-08-12', 'M', '1997-08-18', 'B+', 'AnilAKej191'),
(73004, 73, 'Aryan Kulkarni', 'aryankul1099@gmail.com', '9923001457', '2016-02-15', 'M', '1998-11-27', 'A+', 'AryanFe123'),
(74001, 74, 'Janvi Khurana', 'janvi.khur1620@gmail.com', '9454247614', '2014-01-22', 'F', '1996-10-25', 'B+', 'janviKJ009'),
(74002, 74, 'Harsha Kashyap', 'harsha.kash810@gmail.com', '7785120014', '2014-03-16', 'F', '1995-01-13', 'O+', 'harshaKH76'),
(74003, 74, 'Ayaan Kaur', 'ayaankaur106@gmail.com', '9911785400', '2015-11-14', 'M', '1997-07-03', 'AB-', 'AyanKaur43'),
(74004, 74, 'Garima Khanna', 'garimakhan048@gmail.com', '9796325147', '2016-02-04', 'F', '1996-07-03', 'O+', 'GarimaGk09'),
(74005, 74, 'Reyansh Jha', 'jhareyansh833@gmail.com', '8894521002', '2017-06-18', 'M', '1997-07-03', 'A+', 'ReyJha897'),
(75001, 75, 'Shriti Mangal', 'mangalshrit196@gmail.com', '7790012475', '2014-01-11', 'F', '1995-03-07', 'AB+', 'MangalSM00'),
(75002, 75, 'Arjun Dewan', 'arjundewan435@gmail.com', '7422108892', '2014-04-19', 'M', '1996-11-23', 'A+', 'ajunDA890'),
(75003, 75, 'Vihaan Datta', 'vihan.datt102@gmail.com', '8879120125', '2015-12-30', 'M', '1996-06-08', 'O-', 'vihanDatt53'),
(75004, 75, 'Dipti Apte', 'dipti.apte658@gmail.com', '8896574584', '2016-04-28', 'F', '1997-10-09', 'B-', 'DiptApte563'),
(76001, 76, 'Daksha Chawla', 'dakshachawla767@gmail.com', '7789744511', '2014-01-13', 'F', '1995-10-12', 'B-', 'Daksha028'),
(76002, 76, 'Anubhav Khatri', 'anubhavkhat182@gmail.com', '7900230044', '2014-01-24', 'M', '1996-09-15', 'B+', 'anubhav897'),
(76003, 76, 'Chitra Dalal', 'dalalchitra141@gmail.com', '8896001422', '2015-09-08', 'F', '1997-12-06', 'AB+', 'ChitraDal99'),
(76004, 76, 'Chhaya Bhatt', 'chhayabhatt454@gmail.com', '9494947851', '2017-02-14', 'F', '1997-05-08', 'AB+', 'Chhaya909'),
(76005, 76, 'parth', 'ritikmonu@gmil.com', '1234576654', '2018-11-26', 'M', '2017-12-02', 'O+', 'RAthegr8'),
(77001, 77, 'Vivaan Bakshi', 'vivaanbakshi67@gmail.com', '9694133824', '2014-01-13', 'M', '1996-05-06', 'AB+', 'VivanVB812'),
(77002, 77, 'Ayushi Tiwari', 'ayushitiwari089@gmail.com', '8413382276', '2014-04-07', 'F', '1996-12-03', 'O+', 'Ayushii908'),
(77003, 77, 'Arushi Godara', 'godararushii754@gmail.com', '9412258763', '2015-06-17', 'F', '1997-06-16', 'B+', 'AruAg878'),
(77004, 77, 'Chitrank Mishra', 'chitrankmishra22@gmail.com', '9877878451', '2016-11-13', 'M', '1998-05-06', 'AB+', 'Chittu7675'),
(77005, 77, 'Mitali Nama', 'mitalinama010@gmail.com', '9900143791', '2017-02-23', 'F', '1998-08-16', 'A-', 'MItaliN78');

--
-- Triggers `campmembers`
--
DELIMITER $$
CREATE TRIGGER `error1` BEFORE UPDATE ON `campmembers` FOR EACH ROW begin
if new.memid<>old.memid then
 signal sqlstate '45000' set message_text="Can not update User Id";
end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `id` int(11) NOT NULL,
  `campid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `guardianName` varchar(20) DEFAULT NULL,
  `guardiancontact` varchar(10) DEFAULT NULL,
  `datejoin` date NOT NULL,
  `gender` char(1) NOT NULL,
  `dob` date NOT NULL,
  `bloodgroup` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`id`, `campid`, `name`, `guardianName`, `guardiancontact`, `datejoin`, `gender`, `dob`, `bloodgroup`) VALUES
(2101, 21, 'Kajal Rajput', 'Ravi Rajput', '8077636933', '2017-09-21', 'F', '2002-02-16', 'O+'),
(2102, 21, 'Sonam Verma', 'Ravinder Verma', '8076836933', '2017-09-22', 'F', '2002-08-17', 'O-'),
(2103, 21, 'Tammanna Singh', 'Kishore Singh', '8087636933', '2017-09-22', 'F', '2001-06-26', 'AB+'),
(2104, 21, 'Rahul Gupta', 'Lalit Gupta', '7454899119', '2017-12-04', 'M', '2002-05-05', 'B+'),
(2105, 21, 'Sumit Kumar', 'Rabish Kumar', '8569745615', '2017-12-11', 'M', '2004-12-23', 'A+'),
(2106, 21, 'Rohit Garg', 'Akhilesh Garg', '9857461236', '2018-01-01', 'M', '2000-07-15', 'AB+'),
(2107, 21, 'Mukul Chauhan', 'Arvind Chauhan', '7894566847', '2018-01-21', 'M', '2001-07-07', 'O-'),
(2108, 21, 'Nazeema Haider', 'Mohammad Haider Khan', '7845986857', '2018-07-18', 'F', '2007-03-20', 'B-'),
(2109, 21, 'Farzana Ahmad', 'Ahmad Ansari', '7485964578', '2018-09-24', 'F', '2006-02-28', 'O-'),
(2110, 21, 'Yash Kumar', 'Rohit Kumar', '9875648975', '2018-09-27', 'M', '2008-09-19', 'O+'),
(2201, 22, 'Muskaan Tyagi', 'Ravindra Tyagi', '9077478933', '2016-08-01', 'F', '2007-03-14', 'B+'),
(2202, 22, 'Kavita Sharma', 'Aditya Sharma', '8072178965', '2016-09-21', 'F', '2008-02-16', 'O+'),
(2203, 22, 'Pooja Tiwari', 'Lakhan Tiwari', '9665849335', '2016-10-21', 'F', '2006-04-10', 'A+'),
(2204, 22, 'Utsav Patel', 'Hardik Patel', '7454636945', '2016-11-14', 'M', '2005-06-26', 'AB+'),
(2205, 22, 'Prithawi Singh', 'Arjun Singh', '9254636944', '2017-01-02', 'M', '2008-07-06', 'O+'),
(2206, 22, 'Suman Khichi', 'Raman Khichi', '8845577335', '2017-03-19', 'F', '2005-11-13', 'B-'),
(2207, 22, 'Mansi Patel', 'Hardik Patel', '7454636945', '2017-04-21', 'F', '2006-04-26', 'AB+'),
(2208, 22, 'Manoj Kumar', 'Robin Kumar', '8074781533', '2017-05-11', 'M', '2011-08-30', 'B+'),
(2209, 22, 'Rajat Verma', 'Shivam Verma', '9965877433', '2017-08-13', 'M', '2012-07-19', 'A+'),
(2210, 22, 'Ganesh Singh', 'Shiv Singh', '9775486933', '2017-09-28', 'M', '2009-12-15', 'A-'),
(2301, 23, 'Priyanka Rathi', 'Shilpy Rathi', '9045879862', '2016-01-25', 'F', '2010-08-25', 'A+'),
(2302, 23, 'Anandi Kumari', 'Shreya kumari', '9045875879', '2016-01-29', 'F', '2010-01-25', 'A-'),
(2303, 23, 'Lalita Verma', 'Ankita Verma', '8574979862', '2016-02-24', 'F', '2010-12-25', 'O+'),
(2304, 23, 'Aarav Rathi', 'Anand Rathi', '8945879862', '2016-03-28', 'M', '2009-08-12', 'O+'),
(2305, 23, 'Pravesh Kumar', 'Bhanu Kumar', '8574879862', '2016-05-17', 'M', '2008-08-27', 'B+'),
(2306, 23, 'Prakash Tiwari', 'Akhilesh Tiwari', '8945879862', '2016-08-25', 'M', '2004-01-27', 'A+'),
(2307, 23, 'Radhika Sharma', 'Mamta Sharma', '8597579862', '2017-01-25', 'F', '2012-07-25', 'AB+'),
(2308, 23, 'Ananya Gupta', 'Rekha Gupta', '9047899862', '2017-04-17', 'F', '2009-07-13', 'B+'),
(2309, 23, 'Avani Malik', 'Pooja Malik', '7845963214', '2017-08-27', 'F', '2007-12-27', 'A-'),
(2310, 23, 'Amnpreet Singh', 'Maninder Singh', '8578879862', '2017-08-31', 'F', '2010-08-25', 'A+'),
(2401, 24, 'Akhil Kumar', 'Rohan Kumar', '6789452134', '2016-01-23', 'M', '2008-12-22', 'O+'),
(2402, 24, 'Raman Kumar', 'Ajeet Kumar', '6767852134', '2016-04-23', 'M', '2007-11-24', 'O-'),
(2403, 24, 'Karun Prakash', 'Bhanu Pratap', '6789778894', '2017-09-21', 'M', '2008-01-18', 'O+'),
(2404, 24, 'Aman Kishore', 'Kishore Pratap', '6767652134', '2018-05-02', 'M', '2006-12-12', 'A-'),
(2405, 24, 'Anjali', 'Ramdas', '9898872134', '2018-08-11', 'M', '2006-09-11', 'AB-'),
(2501, 25, 'Animesh', 'Pratap', '8797876544', '2016-01-12', 'M', '2008-12-12', 'B+'),
(2502, 25, 'Parijaat', 'Lalmohan Tiwari', '9999376544', '2016-02-13', 'M', '2007-11-14', 'O-'),
(2503, 25, 'Preeti', 'Anamika', '8877876544', '2017-09-15', 'F', '2006-10-16', 'o+'),
(2504, 25, 'Avani', 'Anant', '6788776544', '2018-10-18', 'F', '2005-09-18', 'A-'),
(2601, 26, 'Parth', 'Anand', '9878547748', '2016-01-05', 'M', '2004-04-25', 'O+'),
(2602, 26, 'Vimal Kumar', 'Akhilesh Kumar', '9857462748', '2016-08-05', 'M', '2005-08-15', 'O-'),
(2603, 26, 'Aman Raj', 'Raj Kumar', '8585547748', '2016-11-08', 'M', '2008-11-25', 'AB+'),
(2604, 26, 'Kiran Singh', 'Ajeet Singh', '8889947748', '2017-11-26', 'M', '2008-09-11', 'A-'),
(2605, 26, 'Veenita Singh', 'Amrendra Singh', '7778847748', '2018-05-19', 'F', '2006-09-30', 'B+'),
(2701, 27, 'Amit Singh', 'Akhilesh Singh', '8585857748', '2016-02-05', 'M', '2005-04-25', 'O+'),
(2702, 27, 'Vyom Kumar', 'Vishesh Kumar', '9857857496', '2016-03-05', 'M', '2006-08-15', 'O-'),
(2703, 27, 'Anjali Verma', 'Raj Verma', '8558694748', '2016-04-08', 'F', '2007-11-25', 'AB+'),
(2704, 27, 'Kiran Kaur', 'Amarjeet Kaur', '8887412548', '2017-11-27', 'F', '2008-09-11', 'A-'),
(2705, 27, 'Veenita Singh', 'Amrendra Singh', '7895647748', '2017-12-19', 'F', '2009-09-30', 'B+'),
(2801, 28, 'Vidushi', 'Vandana', '6854947748', '2017-01-05', 'F', '2005-04-25', 'O+'),
(2802, 28, 'Anandi Kumari', 'Vinod Kumar', '6584962748', '2017-08-05', 'F', '2006-05-26', 'O-'),
(2803, 28, 'Aman Rajput', 'Rajveer Rajput', '7458947748', '2017-11-08', 'M', '2007-06-27', 'AB+'),
(2804, 28, 'Avinash', 'Bhanupratap', '8889974123', '2017-11-28', 'M', '2008-07-28', 'A-'),
(2805, 28, 'Tamanna', 'Avni', '7778856984', '2017-12-19', 'F', '2008-08-30', 'B+'),
(3101, 31, 'Kanika Joshi', 'Shilpa Joshi', '9041235488', '2017-01-05', 'F', '2011-08-15', 'A+'),
(3102, 31, 'Chameli Yadav', 'Rajiv Yadav', '9475644862', '2017-02-25', 'F', '2010-02-25', 'AB+'),
(3103, 31, 'Aarti Ojha', 'Kirti Verma', '9444575262', '2017-03-21', 'F', '2004-12-15', 'O+'),
(3104, 31, 'Rajkumar Yadav', 'Lakshman Yadav', '6554557528', '2017-04-11', 'M', '2007-03-05', 'A+'),
(3105, 31, 'Raju Sharma', 'Sawant Sharma', '9045879862', '2017-06-25', 'M', '2012-03-15', 'A-'),
(3106, 31, 'Prateek Kumar', 'Alok Kumar', '8856654862', '2017-08-14', 'M', '2007-08-29', 'O+'),
(3107, 31, 'Jyoti Khichi', 'Ankit Khichi', '9112549862', '2017-10-22', 'F', '2005-11-07', 'B-'),
(3108, 31, 'Sangeeta Tomar', 'Arun Tomar', '8799954862', '2017-11-28', 'F', '2006-12-17', 'B+'),
(3109, 31, 'Vishnu Kumar', 'Alok Kumar', '8856654862', '2018-01-02', 'M', '2012-10-24', 'AB+'),
(3110, 31, 'Amar Rawat', 'Deepak Rawat', '9011249877', '2018-01-20', 'M', '2011-06-04', 'O-'),
(3201, 32, 'Shivam Singh', 'Avlok Singh', '9234547748', '2017-01-05', 'M', '2009-04-25', 'O+'),
(3202, 32, 'Vidyut', 'Bhawna', '9999462748', '2017-02-06', 'M', '2010-08-15', 'O-'),
(3203, 32, 'Avni Kaur', 'Raj Kumar', '8456127748', '2017-03-07', 'F', '2010-11-25', 'AB+'),
(3204, 32, 'KiranPreet', 'Tajinder', '8963217748', '2017-04-08', 'F', '2011-09-11', 'A-'),
(3205, 32, 'Vinita Singh', 'Raghuveer Singh', '7412365748', '2017-05-09', 'F', '2009-09-30', 'B+'),
(3301, 33, 'Shivam Sirohi', 'Navneet Sirohi', '9245789748', '2017-06-05', 'M', '2010-04-25', 'O+'),
(3302, 33, 'Vishwas Kumar', 'Narindar Kumar', '9985252748', '2017-06-06', 'M', '2009-08-15', 'O-'),
(3303, 33, 'Avinash Singh', 'Garvit Singh', '7894127748', '2018-07-07', 'M', '2008-11-25', 'AB+'),
(3304, 33, 'KiranPreet Kaur', 'Rohanpreet Singh', '8974547748', '2018-08-08', 'F', '2007-09-11', 'A-'),
(3305, 33, 'Ananya Singh', 'Harshit Singh', '7445455748', '2018-09-09', 'F', '2006-09-30', 'B+'),
(3401, 34, 'Rahul Verma', 'Nitin Verma', '7658989748', '2017-06-15', 'M', '2010-06-28', 'O+'),
(3402, 34, 'Ankit Kishore', 'Kishore Kumar', '9985852147', '2017-07-16', 'M', '2009-07-28', 'O-'),
(3403, 34, 'Kumar Pratap', 'Kulwinder Kumar', '7888557748', '2017-08-17', 'M', '2008-08-29', 'AB+'),
(3404, 34, 'Fatima Bashir', 'Bashir Akbar', '8741227748', '2017-09-18', 'F', '2007-09-30', 'A-'),
(3405, 34, 'Vatika bootwala', 'Amit Bootwala', '7447418548', '2017-10-19', 'F', '2006-10-31', 'B+'),
(3501, 35, 'Umair Ali', 'Ali Mohammad', '7777889748', '2017-01-15', 'M', '2007-05-29', 'O+'),
(3502, 35, 'Kavanpreet Singh', 'Maninder Singh', '9632152147', '2017-02-16', 'M', '2008-06-30', 'O-'),
(3503, 35, 'Avantika ', 'Lokesh', '7852258748', '2017-03-17', 'F', '2008-08-08', 'AB+'),
(3504, 35, 'Rohit Palangwala', 'Anima Palangwala', '8747411478', '2017-04-18', 'M', '2007-09-30', 'A-'),
(3505, 35, 'Vatika Kintari', 'Amit Kintari', '8956238548', '2017-05-19', 'F', '2006-10-31', 'B+'),
(3601, 36, 'Nandi Dhimi', 'Neeti Dhimi', '7891479748', '2017-10-15', 'F', '2005-06-28', 'O+'),
(3602, 36, 'Noora Khan', 'Akshuj Khan', '9985852147', '2017-11-16', 'F', '2005-07-28', 'O-'),
(3603, 36, 'Simranpreet Kaur', 'Amarjeet Kaur', '7888557748', '2018-01-17', 'F', '2006-08-29', 'AB+'),
(3604, 36, 'Sumati Singh', 'Anand Singh', '9998727748', '2018-02-18', 'F', '2008-09-30', 'A-'),
(3605, 36, 'Surili', 'Nitender', '7663418548', '2018-03-19', 'F', '2006-10-31', 'B+'),
(3701, 37, 'Deeksha Kayal', 'Preeti Kayal', '7412579748', '2017-10-15', 'F', '2004-06-28', 'O+'),
(3702, 37, 'Nora Khan', 'Aadeen Khan', '7413352147', '2017-11-16', 'F', '2005-12-18', 'O-'),
(3703, 37, 'Kavinder Singh', 'Ameen Singh', '7887485948', '2018-11-17', 'M', '2006-08-17', 'AB+'),
(4101, 41, 'Keerti Dhami', 'Neeti Dhami', '7891479748', '2018-10-15', 'F', '2005-06-28', 'O+'),
(4102, 41, 'Gargi Goyal', 'Ishta Goyal', '9987485962', '2018-11-16', 'F', '2005-07-28', 'O-'),
(4103, 41, 'Alok Kumar', 'Vinod Kaur', '7779997748', '2018-11-17', 'M', '2006-08-29', 'AB+'),
(4104, 41, 'Kriti Gupta', 'Neena Gupta', '7888888748', '2018-11-25', 'F', '2005-06-28', 'O+'),
(4201, 42, 'Abhijeet Singh', 'Kartik Singh', '9999979748', '2018-10-15', 'M', '2009-06-28', 'O+'),
(4202, 42, 'Nishtha Singh', 'Avni Singh', '9888852147', '2018-10-16', 'F', '2010-07-28', 'O-'),
(4203, 42, 'Simranpreet Kaur', 'Rakulpreet Kaur', '7888555748', '2018-11-17', 'F', '2008-08-29', 'AB+'),
(4301, 43, 'Nakul Badhana', 'Ajeet Badhana', '7898479748', '2018-01-15', 'M', '2005-06-28', 'O+'),
(4302, 43, 'Animesh Kumar', 'Anant Kumar', '9987779947', '2018-02-16', 'M', '2006-07-28', 'O-'),
(4303, 43, 'Aman', 'Rajeev', '7888555518', '2018-03-17', 'M', '2007-08-29', 'AB+'),
(4304, 43, 'Ritika Kumari ', 'Anita Kumari', '9999579748', '2018-04-15', 'F', '2008-06-28', 'O+'),
(4305, 43, 'Lipika', 'Amod', '9994179748', '2018-05-18', 'F', '2009-06-24', 'O+'),
(4401, 44, 'Yukti Singh', 'Neeti Singh', '7891488778', '2018-10-15', 'F', '2005-06-28', 'O+'),
(4402, 44, 'Anand Kumar', 'Rohit Kumar', '9985857777', '2018-11-16', 'M', '2005-07-28', 'O-'),
(4403, 44, 'Shivansh Pal', 'Rohit Pal', '7888588778', '2018-11-17', 'M', '2006-08-29', 'AB+'),
(4501, 45, 'Meetali Nagpal', 'Ekta Nagpal', '9045824682', '2018-10-15', 'F', '2005-06-28', 'O+'),
(4502, 45, 'Deepansha Chabbra', 'Shivansh Chabbra', '9985522147', '2018-11-16', 'F', '2010-07-28', 'O-'),
(4503, 45, 'Shivanshi Arora', 'Shivankit Arora', '7885577948', '2018-11-17', 'F', '2006-08-29', 'AB+'),
(4504, 45, 'Anita Mahajan', 'Pankaj Mahajan', '7891488888', '2018-11-18', 'F', '2005-06-28', 'O+'),
(4601, 46, 'Akshita Maheshwari', 'Pranab Maheshwari', '9870684997', '2018-10-15', 'F', '2009-06-28', 'O+'),
(4602, 46, 'Cherry Rathi', 'Animesh Rathi', '9989996647', '2018-11-16', 'F', '2010-07-28', 'O-'),
(4603, 46, 'Arjav Jain', 'Rajeev Jain', '7888895648', '2018-11-17', 'M', '2006-08-29', 'AB+'),
(4604, 46, 'Arushi Kalra', 'Shivankit Kalra', '7891236578', '2018-11-18', 'F', '2008-06-28', 'O+'),
(5101, 51, 'Vishwas', 'Sujeet', '9761247741', '2010-03-15', 'M', '2003-01-21', 'A+'),
(5102, 51, 'Rakesh Dhingra', 'Akhil Kumar', '9857465112', '2010-03-15', 'M', '2005-08-15', 'A-'),
(5103, 51, 'Shubh Deep', 'Rajdeep', '8184347148', '2010-04-18', 'M', '2007-11-25', 'A+'),
(5104, 51, 'Kirti Garg', 'Vimal Garg', '918147568', '2011-11-26', 'F', '2008-09-11', 'A+'),
(5105, 51, 'Yukta Mani', 'Malay Mani', '8178849818', '2012-05-19', 'F', '2006-07-20', 'B+'),
(5106, 51, 'Deepak', 'Dharmesh', '9767612321', '2012-07-11', 'M', '2004-01-21', 'A+'),
(5107, 51, 'Jagjeet', 'Naresh Kumar', '9857465112', '2012-09-15', 'M', '2002-08-15', 'A-'),
(5108, 51, 'Aditya Tayal', 'Nalin Tayal', '8184347148', '2013-01-22', 'M', '2006-12-15', 'A+'),
(5109, 51, 'Ananya Tayal', 'Nalin Tayal', '8184347148', '2014-11-16', 'F', '2008-11-01', 'A+'),
(5110, 51, 'Phalguni', 'Gaurav Kardam', '8178849818', '2015-12-09', 'F', '2010-11-10', 'B+'),
(5201, 52, 'Lovi', 'Brij Nandan', '9761271190', '2010-03-11', 'M', '2003-11-21', 'B+'),
(5202, 52, 'Prerak Garg', 'Praveen Garg', '9857498762', '2010-01-25', 'M', '2006-01-15', 'B-'),
(5203, 52, 'Vartika Garg', 'Praveen Garg', '9857498762', '2011-04-18', 'M', '2008-11-25', 'A+'),
(5204, 52, 'Stuti Jain', 'Shobhi Jain', '918147568', '2012-11-26', 'F', '2008-09-11', 'A+'),
(5205, 52, 'Amar Singh', 'Kamran Singh', '9999121313', '2013-10-15', 'M', '2009-06-28', 'O+'),
(5206, 52, 'Niti Singh', 'Ashish Singh', '9888809128', '2014-11-16', 'F', '2010-07-28', 'A-'),
(5207, 52, 'Japneet Kaur', 'Harpreet Kaur', '7888519811', '2014-12-17', 'F', '2008-08-29', 'AB+'),
(5208, 52, 'Neelam', 'Sudeepam', '7891276098', '2016-11-18', 'F', '2009-01-22', 'O+'),
(5209, 52, 'Suparna', 'Ashutosh Rathi', '9989009871', '2010-04-12', 'F', '2006-01-11', 'O-'),
(5301, 53, 'Tamanna Bootwala', 'Ajeet Bootwala', '8647382976', '2010-12-23', 'F', '2001-11-24', 'O-'),
(5302, 53, 'Asifa Khaleed', 'Mohammad Khaleed', '9876456789', '2011-02-21', 'F', '2004-10-12', 'O+'),
(5303, 53, 'Tabrez Khan', 'Imran Ali Khan', '6789453212', '2011-08-23', 'M', '2007-10-14', 'B+'),
(5304, 53, 'Sumit Kumar', 'Rakesh Kumar', '8646582976', '2012-02-23', 'F', '2004-09-16', 'A+'),
(5305, 53, 'Tauheen Saifi', 'Javed Saifi', '9123382976', '2014-12-23', 'F', '2004-06-04', 'O+'),
(5306, 53, 'Rahul Kishore', 'Kishore Kumar', '8634562976', '2014-12-23', 'M', '2002-11-24', 'A+'),
(5307, 53, 'Aman Singh', 'Ajeet Singh', '8647384529', '2015-08-22', 'M', '2003-05-17', 'O+'),
(5308, 53, 'Nafeesa', 'Haider', '9899382976', '2015-08-22', 'F', '2002-11-11', 'AB-'),
(5309, 53, 'Akhil Lalak', 'Lalak Kumar', '6543382976', '2016-09-02', 'M', '2004-02-02', 'A+'),
(5310, 53, 'Abhijeet Kumar', 'Kamal Kumar', '8647767676', '2017-09-12', 'M', '2009-01-24', 'O-'),
(5401, 54, 'Shivsagar', 'Anna', '7898479326', '2010-01-15', 'M', '2005-06-28', 'O+'),
(5402, 54, 'Animesh Kumar', 'Anant Kumar', '9987779947', '2010-02-16', 'M', '2006-07-28', 'B-'),
(5403, 54, 'Bobby', 'Beena', '7888551137', '2018-03-17', 'M', '2011-08-29', 'AB+'),
(5404, 54, 'Sakshi Kumari ', 'Deepa Kumari', '9999576877', '2015-03-15', 'F', '2008-06-28', 'AB+'),
(5405, 54, 'Tulika', 'Aman', '9994170912', '2016-01-18', 'F', '2008-06-24', 'O+'),
(5501, 55, 'Megha Mittal', 'Ekta Mittal', '9045821190', '2010-10-15', 'F', '2002-06-28', 'A+'),
(5502, 55, 'Ria Chabbra', 'Kuldeep Chabbra', '9985522444', '2010-11-16', 'F', '2003-07-28', 'A-'),
(5503, 55, 'Neha', 'Shivansh Arora', '7885577849', '2011-11-17', 'F', '2004-08-29', 'AB+'),
(5504, 55, 'Neetu', 'Yugal', '7891409132', '2011-11-18', 'F', '2006-06-28', 'A+'),
(5505, 55, 'Vineet', 'Patwari', '9870699174', '2015-10-15', 'M', '2002-02-28', 'O+'),
(5506, 55, 'Shrishti', 'Rohan Rathi', '9855231281', '2015-11-16', 'F', '2009-06-28', 'O-'),
(5601, 56, 'Sushila', 'Rajveer', '9870682410', '2010-10-15', 'F', '2000-06-28', 'AB-'),
(5602, 56, 'Poonam', 'Aneel Rathi', '9989023447', '2011-11-16', 'F', '2003-07-28', 'B-'),
(5603, 56, 'Kartikay Jain', 'Sneh Jain', '788987620', '2012-11-17', 'M', '2006-08-29', 'AB+'),
(5604, 56, 'Swati Kalra', 'Shiv Kalra', '7891216098', '2012-11-18', 'F', '2006-06-28', 'A+'),
(5605, 56, 'Lalita', 'Shiv Kalra', '9870610912', '2014-10-15', 'F', '2001-06-28', 'B+'),
(5701, 57, 'Neelam', 'Sudeepam', '7891276761', '2010-11-18', 'F', '2001-06-28', 'O+'),
(5702, 57, 'Suparna', 'Ashutosh Rathi', '9989009128', '2010-11-16', 'F', '2006-07-28', 'O-'),
(5703, 57, 'Lalit', 'Rajat Jain', '9018890012', '2012-11-17', 'M', '2006-08-29', 'AB+'),
(5704, 57, 'Archie', 'Mansi Dixit', '8109980121', '2015-11-18', 'F', '2012-07-28', 'O+'),
(5705, 57, 'Tanya', 'Mansi Dixit', '8109980121', '2015-11-18', 'F', '2012-07-28', 'O-'),
(5706, 57, 'Khushi', ' Jatin', '9045207109', '2018-11-17', 'M', '2011-01-12', 'AB+'),
(7101, 71, 'Kriti Dhami', 'Neeti Dhami', '7891459748', '2014-10-15', 'F', '2006-06-28', 'O+'),
(7102, 71, 'Gargi Goyal', 'Ishta Goyal', '9989685962', '2015-11-16', 'F', '2007-07-28', 'O-'),
(7103, 71, 'Alok Kumar', 'Vinod Kumar', '7779717741', '2016-11-17', 'M', '2008-08-29', 'AB+'),
(7104, 71, 'Kriti Singh', 'Neena Singh', '7888788741', '2017-11-25', 'F', '2009-06-28', 'O+'),
(7201, 72, 'Kritika Gupta', 'Neena Gupta', '7118888748', '2014-11-25', 'F', '2006-06-28', 'O+'),
(7202, 72, 'Abhijeet Singh', 'Karthik Singh', '9911979748', '2015-10-15', 'M', '2008-06-28', 'O+'),
(7203, 72, 'Nishtha Singh', 'Avnee Singh', '9888811147', '2016-10-16', 'F', '2010-07-28', 'O-'),
(7204, 72, 'Simranpreet Singh', 'Rakulpreet Singh', '7888111748', '2017-11-17', 'M', '2009-08-29', 'AB+'),
(7205, 72, 'Yukti Singhal', 'Neeti Singhal', '7891418778', '2018-10-15', 'F', '2010-06-28', 'O+'),
(7301, 73, 'Nakul Behl', 'Ajeet Behl', '7812479748', '2014-01-15', 'M', '2005-06-15', 'O+'),
(7302, 73, 'Animesh Kumar', 'Anant Kumar', '9987779947', '2015-02-16', 'M', '2006-07-16', 'O-'),
(7303, 73, 'Aman', 'Rajeev', '7118555518', '2016-03-17', 'M', '2007-08-17', 'AB+'),
(7304, 73, 'Ritik Kumar ', 'Anitaa Kumari', '9189579748', '2017-04-15', 'M', '2008-06-18', 'O+'),
(7401, 74, 'Yukti Singh', 'Neeti Singh', '7891488668', '2014-10-15', 'F', '2005-06-23', 'O+'),
(7402, 74, 'Anand Kumar', 'Rohit Kumar', '9985857117', '2015-11-16', 'M', '2005-07-24', 'O-'),
(7403, 74, 'Shivansh Pal', 'Rohit Pal', '7888555578', '2016-11-17', 'M', '2006-08-25', 'AB+'),
(7404, 74, 'Meetali Nagpal', 'Ekta Nagpal', '9074754682', '2017-10-15', 'F', '2005-06-26', 'O+'),
(7405, 74, 'Deepansha Chabbra', 'Shivansh Chabbra', '9185522147', '2018-11-16', 'F', '2010-07-27', 'O-'),
(7501, 75, 'Shivanshi Arora', 'Shivankit Arora', '7886477948', '2014-11-17', 'F', '2011-08-09', 'AB+'),
(7502, 75, 'Anita Mahajan', 'Pankaj Mahajan', '7889148989', '2015-11-18', 'F', '2004-06-10', 'O+'),
(7503, 75, 'Akshita Maheshwari', 'Pranab Maheshwari', '9750684997', '2016-10-15', 'F', '2005-06-11', 'O+'),
(7504, 75, 'Cherry Rathi', 'Animesh Rathi', '9989996648', '2017-11-16', 'F', '2006-07-12', 'O-'),
(7601, 76, 'Arjav Jain', 'Rajeev Jain', '7888885648', '2014-11-17', 'M', '2006-08-05', 'AB+'),
(7602, 76, 'Arushi Kalra', 'Shivankit Kalra', '7791236578', '2015-11-18', 'F', '2008-06-06', 'O+'),
(7603, 76, 'Akshita Maheshwari', 'Pranab Maheshwari', '9770684997', '2016-10-15', 'F', '2009-06-07', 'O+'),
(7604, 76, 'Cherry Rathi', 'Animesh Rathi', '9988996647', '2017-11-16', 'F', '2010-07-08', 'O-'),
(7701, 77, 'Nakul Badhana', 'Ajeet Badhana', '7888479648', '2014-01-15', 'M', '2005-06-28', 'O+'),
(7702, 77, 'Gargi Goyal', 'Ishta Goyal', '9989684961', '2015-11-16', 'F', '2010-07-28', 'O-'),
(7703, 77, 'Yukti Singh', 'Neeti Singh', '7891487777', '2016-10-15', 'F', '2008-06-28', 'O+'),
(7704, 77, 'Akshita Maheshwari', 'Pranab Maheshwari', '9878684997', '2017-10-15', 'F', '2009-06-28', 'O+');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `headquarterid` int(11) NOT NULL,
  `donorid` int(11) NOT NULL,
  `donationid` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` date NOT NULL,
  `modeofpayment` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`headquarterid`, `donorid`, `donationid`, `amount`, `date`, `modeofpayment`) VALUES
(1001, 1, 2012110401, 15000, '2012-11-04', 'Net Banking'),
(1301, 2, 2013121001, 5000, '2013-12-10', 'Visa'),
(1302, 2, 2013121002, 5000, '2013-12-10', 'Visa'),
(1201, 3, 2014110401, 10000, '2014-11-04', 'Cash'),
(1301, 4, 2015111001, 7000, '2015-11-10', 'Visa'),
(1201, 2, 2016111001, 1000, '2016-11-10', 'Tez'),
(1401, 1, 2017011401, 12000, '2017-01-14', 'Net Banking'),
(1201, 3, 2017112401, 15000, '2017-11-24', 'Mobikwik Wallet'),
(1401, 4, 2018071401, 15000, '2018-07-14', 'Google Pay');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `id` int(11) NOT NULL,
  `passwrd` varchar(12) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`id`, `passwrd`, `name`, `email`, `contact`, `gender`) VALUES
(1, 'Hardik@33', 'Hardik', 'hardiksharma@gmail.com', '8532865090', 'M'),
(2, 'priyaM2', 'Priya Malhotra', 'priya23@gmail.com', '8765772231', 'F'),
(3, 'ayushi12A', 'Ayushi Agarawal', 'ayushi23@gmail.com', '7765890121', 'F'),
(4, 'richaA1', 'richa', 'richasharma@gmail.com', '8762341232', 'F');

--
-- Triggers `donors`
--
DELIMITER $$
CREATE TRIGGER `error3` BEFORE UPDATE ON `donors` FOR EACH ROW begin
if new.id<>old.id then
 signal sqlstate '45000' set message_text="Can not update User Id";
end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `headquarters`
--

CREATE TABLE `headquarters` (
  `hqid` int(11) NOT NULL,
  `estd` int(11) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `headquarters`
--

INSERT INTO `headquarters` (`hqid`, `estd`, `street`, `city`, `state`, `email`) VALUES
(1001, 2010, 'H98 IndiraNagar', 'Dehradun', 'Uttarakhand', 'dehradunhq@tarang.com'),
(1201, 2014, '12G Azad Singh Nagar', 'Kurukshetra', 'Haryana', 'kurukshetrahq@tarang.com'),
(1301, 2016, '113-HA Swaroop Nagar', 'Kanpur', 'Uttar Pradesh', 'kanpurhq@tarang.com'),
(1302, 2017, '52 The Mall', 'Allahabad', 'Uttar Pradesh', 'allahabadhq@tarang.com'),
(1401, 2018, 'Nehru St. Nayi Basti', 'Bathinda', 'Punjab', 'bathindahq@tarang.com');

-- --------------------------------------------------------

--
-- Table structure for table `helps`
--

CREATE TABLE `helps` (
  `memid` int(11) NOT NULL,
  `oldpeopleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `helps`
--

INSERT INTO `helps` (`memid`, `oldpeopleid`) VALUES
(11101, 111001),
(11101, 111005),
(11102, 111002),
(11102, 111006),
(11103, 111003),
(11103, 111007),
(11104, 111004),
(11104, 111008),
(11201, 112001),
(11201, 112006),
(11202, 112002),
(11202, 112007),
(11203, 112003),
(11203, 112008),
(11204, 112004),
(11204, 112009),
(11205, 112005),
(11301, 113001),
(11301, 113007),
(11302, 113002),
(11302, 113008),
(11303, 113003),
(11303, 113009),
(11304, 113004),
(11305, 113005),
(11306, 113006),
(11401, 114001),
(11401, 114006),
(11402, 114002),
(11402, 114007),
(11403, 114003),
(11404, 114004),
(11405, 114005),
(11501, 115001),
(11502, 115002),
(11502, 115006),
(11503, 115003),
(11503, 115007),
(11504, 115004),
(11504, 115008),
(11505, 115005),
(11601, 116001),
(11602, 116002),
(11603, 116004),
(11604, 116003),
(11605, 116005),
(11606, 116006),
(11701, 117001),
(11701, 117006),
(11702, 117002),
(11702, 117007),
(11703, 117003),
(11704, 117004),
(11705, 117005),
(15101, 151001),
(15101, 151005),
(15102, 151002),
(15102, 151006),
(15103, 151003),
(15104, 151004),
(15201, 152001),
(15202, 152002),
(15203, 152003),
(15204, 152004),
(15205, 152005),
(15301, 153001),
(15301, 153005),
(15302, 153002),
(15302, 153006),
(15303, 153003),
(15304, 153004),
(15401, 154001),
(15401, 154006),
(15402, 154002),
(15403, 154003),
(15404, 154004),
(15405, 154005),
(15501, 155001),
(15501, 155005),
(15502, 155002),
(15503, 155003),
(15504, 155004),
(15601, 156001),
(15601, 156005),
(15602, 156002),
(15603, 156003),
(15604, 156004),
(16101, 161001),
(16102, 161002),
(16103, 161003),
(16104, 161004),
(16201, 162001),
(16202, 162002),
(16203, 162003),
(16204, 162004),
(16205, 162005),
(16301, 163001),
(16302, 163002),
(16303, 163003),
(16401, 164001),
(16402, 164002),
(16403, 164003),
(16404, 164004),
(16405, 164005),
(16501, 165001),
(16502, 165002),
(16503, 165003),
(16504, 165004),
(16601, 166001),
(16602, 166002),
(16603, 166003),
(16604, 166004),
(16605, 166005),
(16701, 167001),
(16702, 167002),
(16703, 167003),
(16704, 167004),
(16705, 167005),
(18101, 181001),
(18102, 181002),
(18103, 181003),
(18104, 181004),
(18105, 181005),
(18201, 182001),
(18202, 182002),
(18203, 182003),
(18204, 182004),
(18301, 183001),
(18302, 183002),
(18303, 183003),
(18401, 184001),
(18402, 184002),
(18403, 184003),
(18404, 184004),
(18501, 185001),
(18502, 185002),
(18503, 185003),
(18504, 185004),
(18601, 186001),
(18602, 186002),
(18603, 186003),
(19101, 191001),
(19102, 191002),
(19103, 191003),
(19104, 191004),
(19201, 192001),
(19202, 192002),
(19203, 192003),
(19301, 193001),
(19302, 193002),
(19303, 193003),
(19401, 194001),
(19402, 194002),
(19402, 194003),
(19501, 195001),
(19502, 195002),
(19503, 195003),
(19601, 196001),
(19602, 196002),
(19603, 196003),
(19604, 196004);

-- --------------------------------------------------------

--
-- Table structure for table `hqcontacts`
--

CREATE TABLE `hqcontacts` (
  `hqid` int(11) NOT NULL,
  `contact` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hqcontacts`
--

INSERT INTO `hqcontacts` (`hqid`, `contact`) VALUES
(1001, '7412589637'),
(1001, '7412589656'),
(1201, '8885741236'),
(1201, '8885741687'),
(1301, '9812651273'),
(1301, '9812653481'),
(1302, '9865741231'),
(1302, '9865741236'),
(1401, '9856853477'),
(1401, '9856865412');

-- --------------------------------------------------------

--
-- Table structure for table `oldagehomes`
--

CREATE TABLE `oldagehomes` (
  `id` int(11) NOT NULL,
  `hqid` int(11) NOT NULL,
  `location` varchar(40) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldagehomes`
--

INSERT INTO `oldagehomes` (`id`, `hqid`, `location`, `city`) VALUES
(111, 1001, 'Ashok Nagar', 'Dehradun'),
(112, 1001, 'Nai sota', 'Haridwar'),
(113, 1001, 'Bharat Nagar', 'Nainital'),
(114, 1001, 'Dayal Bag Colony', 'Roorkee'),
(115, 1001, 'Kot village', 'Pauri'),
(116, 1001, 'Near Moteshwar Temple', 'Kashipur'),
(117, 1001, 'Near Kothari', 'Rudrapur'),
(151, 1201, 'Near Urban Estate', 'kurukshetra'),
(152, 1201, 'Dugri', 'Chandigarh'),
(153, 1201, 'Mandli', 'Ambala'),
(154, 1201, 'Shakti Nagar', 'Rewari'),
(155, 1201, 'SundarPur', 'Rohtak'),
(156, 1201, 'Pundrak', 'Karnal'),
(161, 1301, 'Yashoda Nagar', 'Kanpur'),
(162, 1301, 'Near Durga Mata Temple', 'Varanasi'),
(163, 1301, 'Lal kurti', 'Meerut'),
(164, 1301, 'Near Hathi Ground', 'Jhasi'),
(165, 1301, 'Holi gate', 'Mathura'),
(166, 1301, 'Elahi Bagh', 'Rampur'),
(167, 1301, 'Sadar Bazar', 'Agra'),
(181, 1302, 'Khusro Bagh', 'Allahabad'),
(182, 1302, 'Near Somnath Dwar', 'Lucknow'),
(183, 1302, 'Opp. Rampur Garden', 'Bareilly'),
(184, 1302, 'Near Saheb Bagh', 'Aligarh'),
(185, 1302, 'Beside Hanuman Temple', 'Goarakhpur'),
(186, 1302, 'Shastri Nagar', 'Chitrakut'),
(191, 1401, 'Ghumar Mandi', 'Ludhiana'),
(192, 1401, 'Opp. Rose Garden', 'Bathinda'),
(193, 1401, 'Bhucho Mandi', 'Faridkot'),
(194, 1401, 'Near Raja Sansi', 'Amritsar'),
(195, 1401, 'Talwandi', 'Kapurthala'),
(196, 1401, 'Beside Fatehpur Rajputana', 'Patiala');

-- --------------------------------------------------------

--
-- Table structure for table `oldagemembers`
--

CREATE TABLE `oldagemembers` (
  `memid` int(11) NOT NULL,
  `oldagehomeid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `datejoin` date NOT NULL,
  `gender` char(1) NOT NULL,
  `dob` date NOT NULL,
  `bloodgroup` varchar(4) NOT NULL,
  `passwrd` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldagemembers`
--

INSERT INTO `oldagemembers` (`memid`, `oldagehomeid`, `name`, `emailid`, `contact`, `datejoin`, `gender`, `dob`, `bloodgroup`, `passwrd`) VALUES
(11101, 111, 'Mansi Saiba', 'mansi.saiba626@yahoo.com', '8684196864', '2010-01-05', 'F', '1991-06-19', 'B+', 'MSai@ba11'),
(11102, 111, 'Prashant Guar', 'guar.pra545@yahoo.com', '9672558522', '2010-01-08', 'M', '1992-11-16', 'A-', 'gaur@PR673'),
(11103, 111, 'Kritik Mehra', 'mehrakrt11@yahoo.com', '9079431752', '2012-04-15', 'M', '1992-10-08', 'AB+', 'Krish@989'),
(11104, 111, 'Virat Sen', 'virat.sen92@yahoo.com', '7987877814', '2014-08-13', 'M', '1994-07-01', 'A-', 'Viru@VS29'),
(11201, 112, 'Dharmesh Rastogi', 'rasdharma013@yahoo.com', '8861471100', '2010-01-05', 'M', '1992-11-03', 'A+', 'dhar@RD11'),
(11202, 112, 'Apoorve Sinha', 'sinha.apoorve11@yahoo.com', '8875212348', '2011-01-16', 'F', '1991-12-13', 'AB+', 'Apoorv@112'),
(11203, 112, 'Danish Khan', 'danish.dk281@yahoo.com', '7877951362', '2012-04-13', 'M', '1993-01-23', 'A-', 'DKhan@112'),
(11204, 112, 'Utkarsh Singhal', 'singhal.ut383@yahoo.com', '9966300177', '2014-11-15', 'M', '1993-04-14', 'O+', 'Singh@US18'),
(11205, 112, 'Kanika Purohit', 'kanika.kpur29@yahoo.com', '9001870055', '2015-10-25', 'F', '1994-03-16', 'A+', 'KPur@281'),
(11301, 113, 'Sargam Garg', 'garg.sar545@yahoo.com', '947871211', '2010-01-11', 'M', '1992-09-06', 'AB-', 'Sgarg@109'),
(11302, 113, 'Priyanka Shindey', 'shin.priya88@yahoo.com', '8991308461', '2010-05-12', 'F', '1991-07-17', 'A-', 'shinP@18'),
(11303, 113, 'Kartik Yadav', 'kartik.cool39@yahoo.com', '9019247521', '2013-03-16', 'M', '1993-08-18', 'B+', 'KartKC@82'),
(11304, 113, 'Pranshu Dwivedi', 'pranshu.dw123@yahoo.com', '8299001757', '2013-02-25', 'M', '1993-11-27', 'A+', 'Pranshu@10'),
(11305, 113, 'Dipansha Khichi', 'deep.khichi34@yahoo.com', '8579600054', '2015-01-05', 'F', '1994-04-30', 'O+', 'Kdeep@21'),
(11306, 113, 'Akriti Verma', 'akritiverma545@yahoo.com', '7703112014', '2016-06-30', 'F', '1996-07-17', 'AB+', 'AkritiAV@5'),
(11401, 114, 'Somya Gupta', 'somyagupta78@yahoo.com', '8887952827', '2010-01-22', 'F', '1991-10-25', 'B+', 'Somya@028'),
(11402, 114, 'Nikki Agarwal', 'nikki.agr156@yahoo.com', '9302222316', '2011-03-16', 'F', '1992-08-10', 'O+', 'nikkiAN@98'),
(11403, 114, 'Arvind Sodhi', 'sodhi.Avi878@yahoo.com', '8661114520', '2012-06-14', 'M', '1991-07-13', 'AB+', 'SodhiAS@80'),
(11404, 114, 'Jyoti Khanna', 'khanna.jyoti22@yahoo.com', '9123217804', '2013-02-25', 'F', '1992-01-19', 'A+', 'JyotiJK@23'),
(11405, 114, 'Prabhanshu Sharma', 'prabhu.shm32@yahoo.com', '8796730884', '2014-07-25', 'M', '0000-00-00', 'O-', 'prabhuP@99'),
(11501, 115, 'Mitanshi Mittal', 'mittal.mita676@yahoo.com', '7749611461', '2010-01-11', 'F', '1990-03-07', 'AB+', 'MitanshM@29'),
(11502, 115, 'Amit Verma', 'vermamit0089@yahoo.com', '9986771333', '2011-04-19', 'M', '1992-11-23', 'A+', 'vermAmit@67'),
(11503, 115, 'Suyash Nigam', 'nigamsuyash841@yahoo.com', '9776330012', '2011-12-30', 'M', '1991-06-08', 'O-', 'suyshSN@12'),
(11504, 115, 'Akshara Suman', 'akshara.aj121@yahoo.com', '6995431501', '2012-04-28', 'F', '1995-10-09', 'B-', 'AkshSA@38'),
(11505, 115, 'Mahi Tiwari', 'mahi.tiwari818@yahoo.com', '7132969584', '2014-01-25', 'F', '1994-03-16', 'AB-', 'MahiWe@12'),
(11601, 116, 'Bhumi Joshi', 'bhumi.joshi1001@yahoo.com', '6672558475', '2010-01-13', 'F', '1990-10-12', 'B-', 'BHumi@101'),
(11602, 116, 'Anil Johar', 'anil.johar2182@yahoo.com', '7789769452', '2011-01-24', 'M', '1992-09-15', 'B+', 'AnilAj@94'),
(11603, 116, 'Gaurav Gupta', 'gaurav.gvu7891@yahoo.com', '9318116951', '2011-09-08', 'M', '1991-12-06', 'AB+', 'GAurav@66'),
(11604, 116, 'Richa Gautam', 'gautam.richa721@yahoo.com', '8791211551', '2012-02-14', 'F', '1993-05-08', 'AB+', 'RichaR@90'),
(11605, 116, 'Naima Suthar', 'naima.snaima66@yahoo.com', '9096137854', '2014-01-25', 'F', '1994-01-16', 'O+', 'SNaima@464'),
(11606, 116, 'Varnit Goswami', 'varnit.gosw882@yahoo.com', '7317240054', '2016-03-05', 'M', '1995-06-11', 'AB+', 'VGvarnit@60'),
(11701, 117, 'Bhawna Sharma', 'sharmabhawana07@yahoo.com', '9544546797', '2010-01-13', 'F', '1991-05-06', 'AB+', 'BhawSH@97'),
(11702, 117, 'Shilpa Joshi', 'shilpa.joshii21@yahoo.com', '8049647952', '2010-02-07', 'F', '1992-12-03', 'O+', 'Shilpii@08'),
(11703, 117, 'Arpan Kumar', 'kumararpan909@yahoo.com', '7896840111', '2013-03-17', 'M', '1994-06-16', 'B+', 'ArpuVC@12'),
(11704, 117, 'Nikita Khandelwal', 'nikki.khadel12@yahoo.com', '9018933944', '2014-01-25', 'F', '1994-03-06', 'O+', 'nikkuNK@98'),
(11705, 117, 'Rahul Sinha', 'sinha.rahul010@yahoo.com', '9793330123', '2015-01-25', 'M', '1995-04-16', 'B+', 'RahulCoo@09'),
(15101, 151, 'Ekta Parekh', 'ektaparekh554@yahoo.com', '7711237040', '2014-01-05', 'F', '1996-06-19', 'B+', 'EktaPare@92'),
(15102, 151, 'Neil Thakur', 'thakur.niel815@yahoo.com', '8008674231', '2014-01-08', 'M', '1995-11-16', 'AB-', 'neelTN@11'),
(15103, 151, 'Samar Naidu', 'samar.naidu292@yahoo.com', '9013603210', '2015-04-15', 'M', '1996-10-08', 'B+', 'samarNAid@18'),
(15104, 151, 'Dhruv Pandey', 'dhruvpandey151@yahoo.com', '7466824070', '2016-08-13', 'M', '1997-07-01', 'AB-', 'PandeyPD@02'),
(15201, 152, 'Pranav Sachdev', 'sachpranav190@yahoo.com', '9451247248', '2014-01-05', 'M', '1995-11-03', 'A+', 'Pranav@61'),
(15202, 152, 'Drishthi Rao', 'drishthirao9810@yahoo.com', '8001124760', '2014-03-16', 'F', '1996-12-13', 'A+', 'DRao@752'),
(15203, 152, 'Muaz Ul Khan', 'muazulkhan710@yahoo.com', '7775812457', '2015-04-13', 'M', '1996-01-23', 'A-', 'muazUK@98'),
(15204, 152, 'Suraj Mehta', 'mehta.suraj712@yahoo.com', '9627478105', '2016-11-15', 'M', '1997-04-14', 'O+', 'surajMeht@67'),
(15205, 152, 'Divya Batra', 'divyabatra324@yahoo.com', '9961414750', '2017-01-25', 'F', '1997-03-16', 'A+', 'DivyaD@869'),
(15301, 153, 'Antika Chauhan', 'antika.chauhan772@yahoo.com', '7857966312', '2014-01-10', 'F', '1995-09-06', 'B-', 'antik@CH888'),
(15302, 153, 'Uma Dixit', 'umadixit458@yahoo.com', '986525174', '2014-05-12', 'F', '1996-07-17', 'A-', 'UmaDU@68'),
(15303, 153, 'Anil Kejariwal', 'anilkejri718@yahoo.com', '8856774234', '2015-08-12', 'M', '1997-08-18', 'B+', 'AnilAKej@91'),
(15304, 153, 'Aryan Kulkarni', 'aryankul1099@yahoo.com', '7762001457', '2016-02-15', 'M', '1998-11-27', 'A+', 'AryanFe@23'),
(15401, 154, 'Janvi Khurana', 'janvi.khur1620@yahoo.com', '9454298714', '2014-01-22', 'F', '1996-10-25', 'B+', 'janviKJ@09'),
(15402, 154, 'Harsha Kashyap', 'harsha.kash810@yahoo.com', '7756720014', '2014-03-16', 'F', '1995-01-13', 'O+', 'harshaKH@6'),
(15403, 154, 'Ayaan Kaur', 'ayaankaur106@yahoo.com', '9911731200', '2015-11-14', 'M', '1997-07-03', 'AB-', 'AyanKaur@3'),
(15404, 154, 'Garima Khanna', 'garimakhan048@yahoo.com', '7766325147', '2016-02-04', 'F', '1996-07-03', 'O+', 'GarimaGk@9'),
(15405, 154, 'Reyansh Jha', 'jhareyansh833@yahoo.com', '8879021002', '2017-06-18', 'M', '1997-07-03', 'A+', 'ReyJha@897'),
(15501, 155, 'Shriti Mangal', 'mangalshrit196@yahoo.com', '7762324155', '2014-01-11', 'F', '1995-03-07', 'AB+', 'MangalSM@0'),
(15502, 155, 'Arjun Dewan', 'arjundewan435@yahoo.com', '7911018892', '2014-04-19', 'M', '1996-11-23', 'A+', 'ajunDA@90'),
(15503, 155, 'Vihaan Datta', 'vihan.datt102@yahoo.com', '8879127796', '2015-12-30', 'M', '1996-06-08', 'O-', 'vihanDatt@3'),
(15504, 155, 'Dipti Apte', 'dipti.apte658@yahoo.com', '8123474584', '2016-04-28', 'F', '1997-10-09', 'B-', 'DiptApte@63'),
(15601, 156, 'Daksha Chawla', 'dakshachawla177@yahoo.com', '7781246511', '2014-01-13', 'F', '1995-10-12', 'B-', 'Daksha@28'),
(15602, 156, 'Anubhav Khatri', 'anubhavkhat182@yahoo.com', '7965130044', '2014-01-24', 'M', '1996-09-15', 'B+', 'anubhav@97'),
(15603, 156, 'Chitra Dalal', 'dalalchitra141@yahoo.com', '8897449422', '2015-09-08', 'F', '1997-12-06', 'AB+', 'ChitraDa@99'),
(15604, 156, 'Chhaya Bhatt', 'chhayabhatt454@yahoo.com', '9123547851', '2017-02-14', 'F', '1997-05-08', 'AB+', 'Chhaya@09'),
(16101, 161, 'Mansi Saiba', 'mansi.saiba146@yahoo.com', '8631472814', '2016-01-05', 'F', '1996-06-19', 'B+', 'MSaiba@91'),
(16102, 161, 'Prashant Guar', 'guar.pra871@yahoo.com', '9930731722', '2016-01-08', 'M', '1994-11-16', 'A-', 'gaurPR@73'),
(16103, 161, 'Kritik Mehra', 'mehrakrt61@yahoo.com', '9076308552', '2017-04-15', 'M', '1993-10-08', 'AB+', 'Krish@89'),
(16104, 161, 'Virat Sen', 'virat.sen03@yahoo.com', '7912047814', '2018-08-13', 'M', '1994-07-01', 'A-', 'ViruVS@29'),
(16201, 162, 'Pranav Sachdev', 'sachpranav450@yahoo.com', '9450079318', '2016-01-05', 'M', '1995-11-03', 'A+', 'PranavSD@1'),
(16202, 162, 'Drishthi Rao', 'drishthirao1250@yahoo.com', '8001795820', '2016-03-16', 'F', '1996-12-13', 'A+', 'DRao@52'),
(16203, 162, 'Muaz Ul Khan', 'muazulkhan730@yahoo.com', '7711245657', '2017-04-13', 'M', '1995-01-23', 'A-', 'muazUK@98'),
(16204, 162, 'Suraj Mehta', 'mehta.suraj707@yahoo.com', '9611201105', '2017-11-15', 'M', '1993-04-14', 'O+', 'surajMe@67'),
(16205, 162, 'Divya Batra', 'divyabatra134@yahoo.com', '9961013790', '2018-01-25', 'F', '1994-03-16', 'A+', 'DivyaDB@69'),
(16301, 163, 'Anju Nagar', 'nagar.anju12@yahoo.com', '7761331661', '2016-01-22', 'F', '1995-10-25', 'B+', 'Anjuu@812'),
(16302, 163, 'Seema Vijay', 'seemavijay030@yahoo.com', '7123578461', '2016-03-16', 'F', '1994-01-13', 'O+', 'jaySeem@90'),
(16303, 163, 'Arvind Yadav', 'yadav.Avi912@yahoo.com', '9963631570', '2017-02-14', 'M', '1997-07-03', 'AB+', 'ArviYad@8'),
(16401, 164, 'Somya Gupta', 'somyagupta12@yahoo.com', '9931072827', '2016-01-22', 'F', '1995-10-25', 'B+', 'Somya@028'),
(16402, 164, 'Nikki Agarwal', 'nikki.agr036@yahoo.com', '9303071616', '2016-03-16', 'F', '1994-08-10', 'O+', 'nikkiAN1@8'),
(16403, 164, 'Arvind Sodhi', 'sodhi.Avi844@yahoo.com', '8661131028', '2016-06-14', 'M', '1995-07-13', 'AB+', 'SodhiAS@80'),
(16404, 164, 'Jyoti Khanna', 'khanna.jyoti77@yahoo.com', '9037716804', '2017-02-25', 'F', '1996-01-19', 'A+', 'JyotiJK@3'),
(16405, 164, 'Prabhanshu Sharma', 'prabhu.shm13@yahoo.com', '8829704684', '2017-07-25', 'M', '0000-00-00', 'O-', 'prabhuP@99'),
(16501, 165, 'Kriti Joshi', 'kriti.joshi1221@yahoo.com', '8871231391', '2016-01-13', 'F', '1996-10-12', 'B-', 'Krit@101'),
(16502, 165, 'Aman Mishra', 'mishraman9632@yahoo.com', '7787117161', '2016-01-24', 'M', '1995-09-15', 'B+', 'AMan@234'),
(16503, 165, 'Muskaan Gupta', 'muskaan9201@yahoo.com', '9011664112', '2017-09-08', 'F', '1996-12-06', 'AB+', 'muskGupt@66'),
(16504, 165, 'Atithi Bhandari', 'atithi.ash79@yahoo.com', '9379391571', '2017-12-14', 'F', '1997-05-08', 'AB+', 'Atith@209'),
(16601, 166, 'Nupur Sharma', 'nupursharma778@yahoo.com', '9631620610', '2016-01-05', 'F', '1994-08-19', 'B+', 'nupurN@12'),
(16602, 166, 'Manish Jain', 'manishmj921@yahoo.com', '7789620991', '2016-02-08', 'M', '1997-06-16', 'A-', 'MJmanish@18'),
(16603, 166, 'Mansi Garg', 'mansi.agg79@yahoo.com', '7991372521', '2016-08-13', 'F', '1995-04-01', 'AB-', 'mansiA@23'),
(16604, 166, 'Rajat Agarwal', 'agarwalraj158@yahoo.com', '9852138061', '2017-09-15', 'M', '1996-03-08', 'AB+', 'RajatR@01'),
(16605, 166, 'Mitesh Bansal', 'mitesh.bansa294@yahoo.com', '7949962150', '2017-11-03', 'M', '1996-02-18', 'AB-', 'miteshB@79'),
(16701, 167, 'Vivaan Bakshi', 'vivaanbakshi88@yahoo.com', '9112473824', '2016-01-13', 'M', '1996-05-06', 'AB+', 'VivanV@812'),
(16702, 167, 'Ayushi Tiwari', 'ayushitiwari092@yahoo.com', '8820732276', '2016-04-07', 'F', '1996-12-03', 'O+', 'Ayush@908'),
(16703, 167, 'Arushi Godara', 'godararushii104@yahoo.com', '9852018763', '2017-06-17', 'F', '1997-06-16', 'B+', 'AruA@878'),
(16704, 167, 'Chitrank Mishra', 'chitrankmishra14@yahoo.com', '9877812759', '2017-11-13', 'M', '1995-05-06', 'AB+', 'Chitt@675'),
(16705, 167, 'Mitali Nama', 'mitalinama035@yahoo.com', '8752151791', '2018-02-23', 'F', '1994-08-16', 'A-', 'MItalN@78'),
(18101, 181, 'Amit Shukla', 'shuklamit443@yahoo.com', '9912368461', '2017-01-05', 'M', '1998-11-03', 'A+', 'Amitt@44'),
(18102, 181, 'Kiran Dave', 'kirannda66@yahoo.com', '7954599548', '2017-03-16', 'F', '1997-12-13', 'AB+', 'KiDave@292'),
(18103, 181, 'Ashutosh Goyal', 'ashugg888@yahoo.com', '7745814692', '2017-04-13', 'M', '1998-01-23', 'A-', 'Ashu@889'),
(18104, 181, 'Tanmay Kumar', 'kumar.tan66@yahoo.com', '6685496477', '2017-11-15', 'M', '1996-04-14', 'O+', 'Tannu@441'),
(18105, 181, 'Dipansha Gaur', 'deep.gaur22@yahoo.com', '9001299054', '2018-01-25', 'F', '1997-03-16', 'O+', 'Deepan@69'),
(18201, 182, 'Ayush Garg', 'gargayush545@yahoo.com', '9861700111', '2017-01-10', 'M', '1997-09-06', 'AB-', 'ayushAG@89'),
(18202, 182, 'Tannu Sharma', 'tannu.sharma88@yahoo.com', '7776198461', '2017-05-12', 'F', '1999-07-17', 'A-', 'iamTanu@66'),
(18203, 182, 'Aditya Jain', 'adiijain711@yahoo.com', '9001794881', '2017-08-15', 'M', '1998-08-18', 'B+', 'AdiiJain@9'),
(18204, 182, 'Pradeep Tiwari', 'tiwariPra11@yahoo.com', '9137901457', '2018-02-25', 'M', '1998-11-27', 'A+', 'Pradeep@09'),
(18301, 183, 'Anju Nagar', 'nagar.anju78@yahoo.com', '7761331661', '2017-01-22', 'F', '1997-10-25', 'B+', 'Anjuu@812'),
(18302, 183, 'Seema Vijay', 'seemavijay1010@yahoo.com', '7793678461', '2017-03-16', 'F', '1998-01-13', 'O+', 'jaySeema@90'),
(18303, 183, 'Arvind Yadav', 'yadav.Avi878@yahoo.com', '9751463360', '2017-12-14', 'M', '1997-07-03', 'AB+', 'ArviYad@88'),
(18401, 184, 'Shriti Jain', 'shritijain1996@yahoo.com', '7122244461', '2017-01-11', 'F', '1996-03-07', 'AB+', 'Shriti@92'),
(18402, 184, 'Amit Verma', 'vermamit1243@yahoo.com', '9663001245', '2017-04-19', 'M', '1998-11-23', 'A+', 'vermAmit@11'),
(18403, 184, 'Siddharth Agarwal', 'sidd.agg212@yahoo.com', '9040050061', '2017-12-30', 'M', '1999-06-08', 'O-', 'sidAgg@12'),
(18404, 184, 'Poonam Sharma', 'poonamsh1029@yahoo.com', '9001400201', '2018-04-28', 'F', '1999-10-09', 'B-', 'Pooma8@87'),
(18501, 185, 'Kriti Joshi', 'kriti.joshi1001@yahoo.com', '8871238411', '2017-01-13', 'F', '1997-10-12', 'B-', 'Kriti@101'),
(18502, 185, 'Aman Mishra', 'mishraman1082@yahoo.com', '7789964161', '2017-01-24', 'M', '1998-09-15', 'B+', 'AMan@234'),
(18503, 185, 'Muskaan Gupta', 'muskaan9191@yahoo.com', '9012974112', '2017-09-08', 'F', '1998-12-06', 'AB+', 'muskGupt@66'),
(18504, 185, 'Atithi Bhandari', 'atithi.ash11@yahoo.com', '9119611571', '2018-02-14', 'F', '1997-05-08', 'AB+', 'Atith@09'),
(18601, 186, 'Hema Naiwal', 'hema.n8787@yahoo.com', '7130790741', '2017-01-13', 'F', '1998-05-06', 'AB+', 'HemaaN@07'),
(18602, 186, 'Parul Joshi', 'parul.pri333@yahoo.com', '8045507202', '2017-02-07', 'F', '1997-12-03', 'O+', 'ParulPri@2'),
(18603, 186, 'Kinjal Sharma', 'kin.sha1819@yahoo.com', '7780139340', '2018-03-17', 'F', '1999-06-16', 'B+', 'kinnSh@21'),
(19101, 191, 'Rubina Banu', 'banu.rubby626@yahoo.com', '9961139110', '2018-01-05', 'F', '1996-06-19', 'B+', 'rubbyBan@11'),
(19102, 191, 'Tanay Gupta', 'tanay.gupta545@yahoo.com', '9791243321', '2018-01-08', 'M', '1997-11-16', 'A-', 'tanayTG@73'),
(19103, 191, 'Himanshu Chaudhary', 'himanchaudh11@yahoo.com', '9964741161', '2018-04-15', 'M', '1996-10-08', 'AB+', 'himaHC@9'),
(19104, 191, 'Sachin Jangid', 'jansach1092@yahoo.com', '7794687007', '2018-08-13', 'M', '1998-07-01', 'AB-', 'SachSJ@81'),
(19201, 192, 'Ishita Jain', 'jainishu896@yahoo.com', '8871134311', '2018-01-05', 'F', '1996-01-19', 'B+', 'jainIssh@21'),
(19202, 192, 'Kartik Dhiman', 'kartikkdh112@yahoo.com', '8879607745', '2018-01-08', 'M', '1997-12-16', 'A-', 'kartikK@22'),
(19203, 192, 'Hitesh Goyal', 'hituhg1200@yahoo.com', '7451967331', '2018-04-15', 'M', '1996-02-08', 'AB+', 'Hitu1@02'),
(19301, 193, 'Shivanshi Arora', 'shivaror123@yahoo.com', '7887669854', '2018-01-05', 'F', '1996-04-19', 'B+', 'Dream@191'),
(19302, 193, 'Abhinav Dhawan', 'abhi.dhawan11@yahoo.com', '9137937121', '2018-01-18', 'M', '1997-01-16', 'A-', 'AbhiAD@01'),
(19303, 193, 'Varun Saxena', 'varun.vs1212@yahoo.com', '8965014758', '2018-04-15', 'M', '1996-11-08', 'AB+', 'iamVarun@2'),
(19304, 193, 'Shreya Kapoor', 'kapoor.shreya112@yahoo.com', '8617632475', '2018-08-23', 'F', '1998-03-01', 'AB-', 'KapoorSh@19'),
(19305, 193, 'Sachin Gaur', 'gaur.sahh21@yahoo.com', '9177655707', '2018-10-13', 'M', '1998-07-02', 'AB-', 'SahhSg@12'),
(19401, 194, 'Anika Goyal', 'goyal.Annu89@yahoo.com', '7177189200', '2018-01-05', 'F', '1996-07-19', 'B+', 'AnuuAg@100'),
(19402, 194, 'Parinika Chopra', 'chopra.pari456@yahoo.com', '9812002145', '2018-02-08', 'F', '1997-12-16', 'A-', 'PariCP@36'),
(19403, 194, 'Amir Khan', 'khan.amir787@yahoo.com', '8818371235', '2018-05-15', 'M', '1996-09-08', 'AB+', 'AmiKhan@87'),
(19501, 195, 'Ankita Mishra', 'ankitmiss11@yahoo.com', '7827912368', '2018-01-05', 'F', '1996-05-29', 'B+', 'Anki@75'),
(19502, 195, 'Rajdeep Hada', 'hada.raj172@yahoo.com', '9557903321', '2018-01-08', 'M', '1997-11-16', 'A-', 'HadaRaj@81'),
(19503, 195, 'Naman Jain', 'jainaman826@yahoo.com', '8891763511', '2018-04-15', 'M', '1996-02-18', 'AB+', 'NamanJN@11'),
(19504, 195, 'Manan Nandwana', 'man.nand123@yahoo.com', '9713602111', '2018-09-13', 'M', '1998-07-21', 'AB-', 'NandMan@00'),
(19601, 196, 'Nupur Sharma', 'nupursharma908@yahoo.com', '9663793610', '2018-01-05', 'F', '1996-08-19', 'B+', 'nupurNS@2'),
(19602, 196, 'Manish Jain', 'manishmj871@yahoo.com', '9711370991', '2018-02-08', 'M', '1997-06-16', 'A-', 'MJmanish@18'),
(19603, 196, 'Mansi Garg', 'mansi.agg12@yahoo.com', '7996978031', '2018-08-13', 'F', '1998-04-01', 'AB-', 'mansiAgg@23'),
(19604, 196, 'Rajat Agarwal', 'agarwalraj908@yahoo.com', '9197302061', '2018-09-15', 'M', '1996-03-08', 'AB+', 'RajatRJ@1'),
(19605, 196, 'Mitesh Bansal', 'mitesh.bansal354@yahoo.com', '7947901710', '2018-11-03', 'M', '1998-02-18', 'AB-', 'miteshB@29');

--
-- Triggers `oldagemembers`
--
DELIMITER $$
CREATE TRIGGER `error2` BEFORE UPDATE ON `oldagemembers` FOR EACH ROW begin
if new.memid<>old.memid then
 signal sqlstate '45000' set message_text="Can not update User ID";
end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `oldpeople`
--

CREATE TABLE `oldpeople` (
  `id` int(11) NOT NULL,
  `homeid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `datejoin` date NOT NULL,
  `gender` char(1) NOT NULL,
  `dob` date NOT NULL,
  `bloodgroup` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oldpeople`
--

INSERT INTO `oldpeople` (`id`, `homeid`, `name`, `contact`, `datejoin`, `gender`, `dob`, `bloodgroup`) VALUES
(111001, 111, 'Laxmi Bai', '9964125841', '2010-01-05', 'F', '1961-06-19', 'B+'),
(111002, 111, 'Ram Kumar', '7784121078', '2010-01-08', 'M', '1960-11-16', 'A-'),
(111003, 111, 'Vijay Singh', '7312511841', '2012-04-15', 'M', '1956-10-08', 'AB+'),
(111004, 111, 'Lakhan Kunwar', '9965325841', '2014-08-13', 'M', '1954-07-01', 'A-'),
(111005, 111, 'Kunti Kumari', '9965412012', '2015-01-05', 'F', '1961-06-19', 'B+'),
(111006, 111, 'Kapil Dev', '7663124841', '2015-08-08', 'M', '1952-11-16', 'A-'),
(111007, 111, 'Chidiya Ghada', '9828641841', '2016-04-15', 'F', '1962-10-08', 'AB+'),
(111008, 111, 'Bhola Ram', '9658742101', '2017-08-13', 'M', '1954-07-01', 'A-'),
(112001, 112, 'Babu Lal', '8821647841', '2010-01-05', 'M', '1960-11-03', 'A+'),
(112002, 112, 'Uma Kumari', '7783012479', '2011-01-16', 'F', '1961-12-13', 'AB+'),
(112003, 112, 'Shiva Kant', '9970310200', '2012-04-13', 'M', '1953-01-23', 'A-'),
(112004, 112, 'Uday Bheel', '7726225841', '2012-11-15', 'M', '1953-04-14', 'O+'),
(112005, 112, 'Kamla Devi', '8784100231', '2013-10-25', 'F', '1954-03-16', 'A+'),
(112006, 112, 'Shikha Kumari', '8854225841', '2014-01-16', 'F', '1958-12-13', 'AB+'),
(112007, 112, 'Dharmendra Singh', '9962005841', '2015-04-13', 'M', '1959-01-23', 'A-'),
(112008, 112, 'Jay Pratap', '9971182034', '2016-11-15', 'M', '1960-04-14', 'O+'),
(112009, 112, 'Shanti Bai', '9785525841', '2017-10-25', 'F', '1963-03-16', 'A+'),
(113001, 113, 'Jagdish Garg', '8888612842', '2010-01-11', 'M', '1962-09-06', 'AB-'),
(113002, 113, 'Anguri Khattar', '9964125691', '2010-05-12', 'F', '1957-07-17', 'A-'),
(113003, 113, 'Dilip Chattri', '8334120023', '2012-03-16', 'M', '1949-08-18', 'B+'),
(113004, 113, 'Raj Kumar', '7124555773', '2013-02-25', 'M', '1953-11-27', 'A+'),
(113005, 113, 'Munni Devi', '9964127923', '2014-01-05', 'F', '1955-04-30', 'O+'),
(113006, 113, 'Parwati Devi', '8854123214', '2015-06-30', 'F', '1948-07-17', 'AB+'),
(113007, 113, 'Kishan Ram', '888411240', '2015-09-25', 'M', '1950-11-27', 'A+'),
(113008, 113, 'Chameli Tiwari', '7784110241', '2016-01-05', 'F', '1954-04-30', 'O+'),
(113009, 113, 'Phoolan Kumari', '9982300107', '2017-06-30', 'F', '1961-07-17', 'AB+'),
(114001, 114, 'Ganga Devi', '8999528217', '2010-01-22', 'F', '1961-10-25', 'B+'),
(114002, 114, 'Jamuna Kumari', '9332122716', '2011-03-16', 'F', '1952-08-10', 'O+'),
(114003, 114, 'Sanjay Seth', '7792154680', '2012-06-14', 'M', '1957-07-13', 'AB+'),
(114004, 114, 'Sunita Singh', '8850917804', '2012-09-25', 'F', '1948-01-19', 'A+'),
(114005, 114, 'Shiv Naresh', '8796710200', '2014-07-25', 'M', '0000-00-00', 'O-'),
(114006, 114, 'Arti Kumar', '8982102316', '2015-03-16', 'F', '1955-08-10', 'O+'),
(114007, 114, 'Ganesh Kumar', '9661996014', '2016-06-14', 'M', '1951-07-13', 'AB+'),
(115001, 115, 'Archana Yadav', '7749121401', '2010-01-11', 'F', '1960-03-07', 'AB+'),
(115002, 115, 'Manoj Rana', '9622511333', '2011-04-19', 'M', '1952-11-23', 'A+'),
(115003, 115, 'Pavan Raj', '9776336178', '2011-12-30', 'M', '1951-06-08', 'O-'),
(115004, 115, 'Shanta Devi', '6695231501', '2012-04-28', 'F', '1955-10-09', 'B-'),
(115005, 115, 'Saraswati Verma', '7128746584', '2014-01-25', 'F', '1958-03-16', 'AB-'),
(115006, 115, 'Saroj Singh', '9576330012', '2011-12-30', 'M', '1961-06-08', 'O-'),
(115007, 115, 'Sugandha Meena', '6991125004', '2012-04-28', 'F', '1947-10-09', 'B-'),
(115008, 115, 'Bhawna Kumar', '6695269584', '2014-01-25', 'F', '1949-03-16', 'AB-'),
(116001, 116, 'Gulabo Sharma', '6889524475', '2010-01-13', 'F', '1950-10-12', 'B-'),
(116002, 116, 'Dilip Kumar', '7789110232', '2011-01-24', 'M', '1952-09-15', 'B+'),
(116003, 116, 'Govind Gupta', '7784121511', '2011-09-08', 'M', '1951-12-06', 'AB+'),
(116004, 116, 'Morni Gautam', '9961411551', '2012-02-14', 'F', '1953-05-08', 'AB+'),
(116005, 116, 'Naina Suthar', '9096121102', '2014-01-25', 'F', '1960-01-16', 'O+'),
(116006, 116, 'Vaidhya Goswami', '7215224054', '2016-03-05', 'M', '1955-06-11', 'AB+'),
(117001, 117, 'Naina Sharma', '9544546797', '2010-01-13', 'F', '1961-05-06', 'AB+'),
(117002, 117, 'Kunti Joshi', '8049647952', '2010-02-07', 'F', '1952-12-03', 'O+'),
(117003, 117, 'Vijay Kumar', '7896840111', '2013-03-17', 'M', '1958-06-16', 'B+'),
(117004, 117, 'Pooja Khandelwal', '9018933944', '2014-01-25', 'F', '1954-03-06', 'O+'),
(117005, 117, 'Karan Sinha', '9793330123', '2015-01-25', 'M', '1945-04-16', 'B'),
(117006, 117, 'Pooja Khandelwal', '9018911264', '2016-01-25', 'F', '1954-03-06', 'O+'),
(117007, 117, 'Karan Sinha', '8862330112', '2017-01-25', 'M', '1955-04-16', 'B+'),
(151001, 151, 'Ekta Parekh', '7711110460', '2014-01-05', 'F', '1946-06-19', 'B+'),
(151002, 151, 'Neil Thakur', '8099671231', '2014-01-08', 'M', '1955-11-16', 'AB-'),
(151003, 151, 'Samar Naidu', '8813043210', '2015-04-15', 'M', '1956-10-08', 'B+'),
(151004, 151, 'Harish Pandey', '7469964412', '2016-03-13', 'M', '1957-07-01', 'AB-'),
(151005, 151, 'Samira Naidu', '8788741210', '2016-08-15', 'F', '1946-10-08', 'B+'),
(151006, 151, 'Raveena Devi', '9964841215', '2017-08-13', 'F', '1957-07-01', 'AB-'),
(152001, 152, 'Hariom Dave', '9451887248', '2014-01-05', 'M', '1955-11-03', 'A+'),
(152002, 152, 'Kavita Kumari', '8001124799', '2014-03-16', 'F', '1956-12-13', 'A+'),
(152003, 152, 'Muaz Khan', '7775812557', '2015-04-13', 'M', '1956-01-23', 'A-'),
(152004, 152, 'Suraj Mehta', '9627499105', '2016-11-15', 'M', '1957-04-14', 'O+'),
(152005, 152, 'Divya Batra', '9934494750', '2017-01-25', 'F', '1947-03-16', 'A+'),
(153001, 153, 'Antika Chauhan', '7895266312', '2014-01-10', 'F', '1955-09-06', 'B-'),
(153002, 153, 'Uma Dixit', '9865254554', '2014-05-12', 'F', '1956-07-17', 'A-'),
(153003, 153, 'Anil Tiwari', '8856763234', '2015-08-12', 'M', '1947-08-18', 'B+'),
(153004, 153, 'Kishan Kulkarni', '7892001457', '2015-10-15', 'M', '1948-11-27', 'A+'),
(153005, 153, 'Vidya Kulkarni', '8874774234', '2016-03-12', 'F', '1957-08-18', 'B+'),
(153006, 153, 'Pratap Verma', '7769901457', '2016-12-15', 'M', '1958-11-27', 'A+'),
(154001, 154, 'Janvi Khurana', '9454298714', '2014-01-22', 'F', '1956-10-25', 'B+'),
(154002, 154, 'Harsha Kashyap', '7756720014', '2014-03-16', 'F', '1945-01-13', 'O+'),
(154003, 154, 'Sanjeev Kaur', '9911731200', '2015-11-14', 'M', '1957-07-03', 'AB-'),
(154004, 154, 'Garima Khanna', '7766325147', '2016-02-04', 'F', '1946-07-13', 'O+'),
(154005, 154, 'Shivaji Jha', '8879021002', '2017-06-18', 'M', '1957-07-05', 'A+'),
(154006, 154, 'Ashok Kumar', '8863221782', '2017-06-18', 'M', '1947-08-09', 'A+'),
(155001, 155, 'Shivani Mangal', '7762324155', '2014-01-11', 'F', '1955-03-07', 'AB+'),
(155002, 155, 'Arjun Dewan', '7911018892', '2014-04-19', 'M', '1956-11-23', 'A+'),
(155003, 155, 'Vibhor Datta', '8879127796', '2015-10-30', 'M', '1946-06-08', 'O-'),
(155004, 155, 'Pushpa Apte', '8123474584', '2015-12-28', 'F', '1957-10-09', 'B-'),
(155005, 155, 'Meena Sharma', '8123412584', '2017-04-28', 'F', '1961-10-09', 'B-'),
(156001, 156, 'Vimla Chawla', '7781246511', '2014-01-13', 'F', '1955-10-12', 'B-'),
(156002, 156, 'Nagesh Khatri', '7965130044', '2014-01-24', 'M', '1966-09-15', 'B+'),
(156003, 156, 'Chitra Dalal', '8897449422', '2015-09-08', 'F', '1957-12-06', 'AB+'),
(156004, 156, 'Chhaya Bhatt', '9123547851', '2017-02-14', 'F', '1947-05-08', 'AB+'),
(156005, 156, 'Raj Singh', '9129647851', '2018-03-04', 'M', '1957-03-08', 'AB+'),
(161001, 161, 'Khushbu Singh', '8631472814', '2016-01-05', 'F', '1946-06-19', 'B+'),
(161002, 161, 'Prashant Guar', '9930731722', '2016-01-08', 'M', '1954-11-16', 'A-'),
(161003, 161, 'Rampal Mehra', '9076308552', '2017-04-15', 'M', '1943-10-08', 'AB+'),
(161004, 161, 'Vimal Sen', '7912047814', '2018-08-13', 'M', '1950-07-01', 'A-'),
(162001, 162, 'Mohan Shukla', '9450079318', '2016-01-05', 'M', '1955-11-03', 'A+'),
(162002, 162, 'Monika Gupta', '8001795820', '2016-03-16', 'F', '1946-12-13', 'A+'),
(162003, 162, 'Kamal Kishan', '7711245657', '2017-04-13', 'M', '1955-01-23', 'A-'),
(162004, 162, 'Suraj Mehta', '9611201105', '2017-11-15', 'M', '1943-04-14', 'O+'),
(162005, 162, 'Samira Naidu', '9961013790', '2018-01-25', 'F', '1956-03-16', 'A+'),
(163001, 163, 'Anju Nagar', '7761331661', '2016-01-22', 'F', '1955-10-25', 'B+'),
(163002, 163, 'Seema Vijay', '7123578461', '2016-03-16', 'F', '1946-01-13', 'O+'),
(163003, 163, 'Radha Yadav', '9963631570', '2017-02-14', 'M', '1949-07-03', 'AB+'),
(164001, 164, 'Rohini Gupta', '9931072827', '2016-01-22', 'F', '1945-10-25', 'B+'),
(164002, 164, 'Naina Farida', '9303071616', '2016-03-16', 'F', '1944-08-10', 'O+'),
(164003, 164, 'Ankur Sodhi', '8661131028', '2016-06-14', 'M', '1955-07-13', 'AB+'),
(164004, 164, 'Jyoti Nama', '9037716804', '2017-02-25', 'F', '1960-01-19', 'A+'),
(164005, 164, 'Hariom Dave', '8829704684', '2017-07-25', 'M', '0000-00-00', 'O-'),
(165001, 165, 'Shivani Mangal', '7762324155', '2016-01-11', 'F', '1955-03-07', 'AB+'),
(165002, 165, 'Arjun Dewan', '7911018892', '2016-04-19', 'M', '1956-11-23', 'A+'),
(165003, 165, 'Vibhor Datta', '8879127796', '2017-10-30', 'M', '1946-06-08', 'O-'),
(165004, 165, 'Pushpa Apte', '8123474584', '2017-12-28', 'F', '1957-10-09', 'B-'),
(166001, 166, 'Vimla Chawla', '7781246511', '2016-01-13', 'F', '1955-10-12', 'B-'),
(166002, 166, 'Nagesh Khatri', '7965130044', '2016-01-24', 'M', '1966-09-15', 'B+'),
(166003, 166, 'Chitra Dalal', '8897449422', '2017-09-08', 'F', '1957-12-06', 'AB+'),
(166004, 166, 'Chhaya Bhatt', '9123547851', '2017-02-14', 'F', '1947-05-08', 'AB+'),
(166005, 166, 'Raj Singh', '9129647851', '2018-03-04', 'M', '1957-03-08', 'AB+'),
(167001, 167, 'Naina Sharma', '9544546797', '2016-01-13', 'F', '1961-05-06', 'AB+'),
(167002, 167, 'Kunti Joshi', '8049647952', '2016-02-07', 'F', '1952-12-03', 'O+'),
(167003, 167, 'Vijay Kumar', '7896840111', '2017-03-17', 'M', '1958-06-16', 'B+'),
(167004, 167, 'Pooja Khandelwal', '9018933944', '2017-11-25', 'F', '1954-03-06', 'O+'),
(167005, 167, 'Karan Sinha', '9793330123', '2018-01-25', 'M', '1945-04-16', 'B'),
(181001, 181, 'Mohan Shukla', '9912368461', '2017-01-05', 'M', '1958-11-03', 'A+'),
(181002, 181, 'Radha Dave', '7954599548', '2017-03-16', 'F', '1960-12-13', 'AB+'),
(181003, 181, 'Shashi Goyal', '7745814692', '2017-04-13', 'F', '1948-01-23', 'A-'),
(181004, 181, 'Balraj Kumar', '6685496477', '2017-11-15', 'M', '1956-04-14', 'O+'),
(181005, 181, 'Vinod Anand', '9001299054', '2018-01-25', 'M', '1957-03-16', 'O+'),
(182001, 182, 'Dev Anand', '9861700111', '2017-01-10', 'M', '1957-09-06', 'AB-'),
(182002, 182, 'Tannu Sharma', '7776198461', '2017-05-12', 'F', '1949-07-17', 'A-'),
(182003, 182, 'Amrish Dutt', '9001794881', '2017-08-15', 'M', '1948-08-18', 'B+'),
(182004, 182, 'Amjad Khan', '9137901457', '2018-02-25', 'M', '1958-11-27', 'A+'),
(183001, 183, 'Anju Nagar', '7761331661', '2017-01-22', 'F', '1957-10-25', 'B+'),
(183002, 183, 'Seema Vijay', '7793678461', '2017-03-16', 'F', '1948-01-13', 'O+'),
(183003, 183, 'Prakash Yadav', '9751463360', '2018-02-14', 'M', '1947-07-03', 'AB+'),
(184001, 184, 'Annu Devi', '7122244461', '2017-01-11', 'F', '1946-03-07', 'AB+'),
(184002, 184, 'Kishor Dutt', '9663001245', '2017-04-19', 'M', '1956-11-23', 'A+'),
(184003, 184, 'Prem Nazir', '9040050061', '2017-12-30', 'M', '1949-06-08', 'O-'),
(184004, 184, 'Poonam Sharma', '9001400201', '2018-04-28', 'F', '1950-10-09', 'B-'),
(185001, 185, 'Shilpa Joshi', '8871238411', '2017-01-13', 'F', '1957-10-12', 'B-'),
(185002, 185, 'Hari Ram', '7789964161', '2017-01-24', 'M', '1958-09-15', 'B+'),
(185003, 185, 'Monika Gupta', '9012974112', '2017-09-08', 'F', '1948-12-06', 'AB+'),
(185004, 185, 'Reshma Bhandari', '9119611571', '2018-02-14', 'F', '1950-05-08', 'AB+'),
(186001, 186, 'Hema Naiwal', '7130790741', '2017-01-13', 'F', '1948-05-06', 'AB+'),
(186002, 186, 'Jagdish Joshi', '8045507202', '2017-02-07', 'M', '1947-12-03', 'O+'),
(186003, 186, 'Rekha Sharma', '7780139340', '2018-03-17', 'F', '1950-06-16', 'B+'),
(191001, 191, 'Rubina Banu', '9961139110', '2018-01-05', 'F', '1956-06-19', 'B+'),
(191002, 191, 'Adil Hussain', '9791243321', '2018-01-08', 'M', '1947-11-16', 'A-'),
(191003, 191, 'Bharat Singh', '9964741161', '2018-04-15', 'M', '1956-10-08', 'AB+'),
(191004, 191, 'Suraj Vijay', '7794687007', '2018-08-13', 'M', '1948-07-01', 'AB-'),
(192001, 192, 'Imli Jain', '8871134311', '2018-01-05', 'F', '1996-01-19', 'B+'),
(192002, 192, 'Kamal Kishan', '8879607745', '2018-01-08', 'M', '1997-12-16', 'A-'),
(192003, 192, 'Hemant Goyal', '7451967331', '2018-04-15', 'M', '1996-02-08', 'AB+'),
(193001, 193, 'Vidhi Goel', '7887669854', '2018-01-05', 'F', '1946-04-19', 'B+'),
(193002, 193, 'Anupam Singh', '9137937121', '2018-01-18', 'M', '1957-01-16', 'A-'),
(193003, 193, 'Vimal Saxena', '8965014758', '2018-04-15', 'M', '1956-11-08', 'AB+'),
(194001, 194, 'Anju Jain', '7177189200', '2018-01-05', 'F', '1956-07-19', 'B+'),
(194002, 194, 'Rani Devi', '9812002145', '2018-02-08', 'F', '1947-12-16', 'A-'),
(194003, 194, 'Ahmad Amaar', '8818371235', '2018-05-15', 'M', '1956-09-08', 'AB+'),
(195001, 195, 'Farida Jalal', '7827912368', '2018-01-05', 'F', '1956-05-29', 'B+'),
(195002, 195, 'Guru Gutt', '9557903321', '2018-01-08', 'M', '1957-11-16', 'A-'),
(195003, 195, 'Gulshan Joshi', '8891763511', '2018-04-15', 'M', '1946-02-18', 'AB+'),
(196001, 196, 'Kangan Devi', '9663793610', '2018-01-05', 'F', '1946-08-19', 'B+'),
(196002, 196, 'Mukesh Rana', '9711370991', '2018-02-08', 'M', '1953-06-16', 'A-'),
(196003, 196, 'Munni Rana', '7996978031', '2018-08-13', 'F', '1958-04-01', 'AB-'),
(196004, 196, 'Girish Karnad', '9197302061', '2018-09-15', 'M', '1943-03-08', 'AB+');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `email` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`email`, `name`, `comment`, `date`) VALUES
('deepak28@gmail.com', 'deepak singhania', 'The NGO works in a vey fine manner !\r\nI have been to the camp multiple times and i observed that the members work very efficiently.\r\nI am sure that the ngo willl serve its purpose of child empowerment and elderly care with utmost success.', '2018-07-20'),
('singravi23@gmail.com', 'Ravi Singh', 'Being a part of Parindey helped me realise that we complete ourselves when we help others in reaching their maximum potential.\r\nWorking with Parindey made me realise that there are numerous childen in slums who are eager to learn but due to their family circumstances are unable to go to school and get education.\r\nIt is an honour to be a part of this NGO, Parindey is helping some children by facilitating their education.', '2018-08-24'),
('tahir28@gmail.com', 'Tahir mirza', 'A privileged to be a volunteer at Parindey, Tarang in Kanpur, India. \r\nParindey a non-governmental organisation is dedicated towards educational and medical support of Slum Children all over India. \r\nIt is also initiated a campaign like She for She providing girls in Slum with free sanitary pads and encouraging them for maintaining their personal hygiene .\r\nIt was an honour to have Mr. Hardik Bhardwaj as a supervisor during my volunteering.\r\nI wish all the success to Parindey, India and appeal others to make some difference in society by donating and helping the mankind.', '2018-07-24'),
('utsav28@gmail.com', 'UTSAV GUPTA', 'I\'ve been working with Kutumb as a Student for the past one year and it has been a great journey.\r\nDuring this one year I have learned about life, humanity and how Parindey is working towards such a social cause.\r\nThanks Parindey for giving me this oppurtunity to work for these people and making a small difference in their lives.\r\n', '2018-07-21');

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `memid` int(11) NOT NULL,
  `childid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`memid`, `childid`) VALUES
(21001, 2101),
(21001, 2102),
(21002, 2107),
(21003, 2103),
(21004, 2104),
(21004, 2108),
(21005, 2105),
(21005, 2109),
(21006, 2106),
(21006, 2110),
(22001, 2201),
(22002, 2202),
(22003, 2203),
(22004, 2204),
(22005, 2205),
(22006, 2206),
(22007, 2207),
(22008, 2208),
(23001, 2301),
(23001, 2306),
(23002, 2302),
(23002, 2307),
(23003, 2303),
(23003, 2310),
(23004, 2304),
(23004, 2308),
(23005, 2305),
(23005, 2309),
(26001, 2601),
(26001, 2602),
(26002, 2603),
(26003, 2604),
(26004, 2605),
(28001, 2605),
(28001, 2801),
(28002, 2602),
(28002, 2604),
(28003, 2603),
(32001, 3205),
(32002, 3204),
(32003, 3202),
(32004, 3203),
(32005, 3201),
(33001, 3301),
(33001, 3305),
(33002, 3302),
(33003, 3303),
(33004, 3304),
(34001, 3401),
(34001, 3405),
(34002, 3402),
(34003, 3403),
(34004, 3404),
(35001, 3501),
(35001, 3505),
(35002, 3502),
(35003, 3503),
(35004, 3504),
(36001, 3601),
(36001, 3605),
(36002, 3602),
(36003, 3603),
(36004, 3604),
(37001, 3701),
(37002, 3702),
(37003, 3703),
(41001, 4101),
(41002, 4102),
(41003, 4103),
(41004, 4104),
(42001, 4201),
(42002, 4202),
(42003, 4203),
(43001, 4301),
(43001, 4304),
(43002, 4302),
(43002, 4305),
(43003, 4303),
(44001, 4401),
(44002, 4402),
(44003, 4403),
(45001, 4501),
(45002, 4502),
(45003, 4503),
(45004, 4504),
(46001, 4601),
(46002, 4602),
(46003, 4603),
(46004, 4604),
(51001, 5101),
(51001, 5105),
(51001, 5109),
(51002, 5102),
(51002, 5106),
(51002, 5110),
(51003, 5103),
(51003, 5107),
(51004, 5104),
(51004, 5108),
(52001, 5201),
(52001, 5209),
(52002, 5202),
(52002, 5206),
(52003, 5203),
(52003, 5207),
(52004, 5204),
(52004, 5208),
(52005, 5205),
(53001, 5301),
(53001, 5309),
(53002, 5302),
(53002, 5310),
(53003, 5303),
(53003, 5307),
(53004, 5304),
(53004, 5308),
(53005, 5305),
(53006, 5306),
(54001, 5401),
(54002, 5402),
(54003, 5403),
(54004, 5404),
(54005, 5405),
(55001, 5501),
(55002, 5502),
(55003, 5503),
(55004, 5504),
(55005, 5505),
(55005, 5506),
(56001, 5601),
(56002, 5602),
(56003, 5603),
(56004, 5604),
(56005, 5605),
(57001, 5701),
(57002, 5702),
(57003, 5703),
(57004, 5704),
(57005, 5705),
(57005, 5706),
(71001, 7101),
(71002, 7102),
(71003, 7103),
(71004, 7104),
(72001, 7201),
(72002, 7202),
(72003, 7203),
(72004, 7204),
(72005, 7205),
(73001, 7301),
(73002, 7302),
(73003, 7303),
(73004, 7304),
(74001, 7401),
(74002, 7402),
(74003, 7403),
(74004, 7404),
(74005, 7405),
(75001, 7501),
(75002, 7502),
(75003, 7503),
(75004, 7504),
(76001, 7601),
(76002, 7602),
(76003, 7603),
(76004, 7604),
(77001, 7701),
(77002, 7702),
(77003, 7703),
(77004, 7704);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campdetails`
--
ALTER TABLE `campdetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location` (`location`),
  ADD KEY `campdetail_fk` (`hqid`);

--
-- Indexes for table `campmembers`
--
ALTER TABLE `campmembers`
  ADD PRIMARY KEY (`memid`),
  ADD UNIQUE KEY `emailid` (`emailid`),
  ADD KEY `campmember_fk` (`campid`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`id`),
  ADD KEY `children_fk` (`campid`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`donationid`),
  ADD KEY `donor_fk` (`donorid`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `headquarters`
--
ALTER TABLE `headquarters`
  ADD PRIMARY KEY (`hqid`),
  ADD UNIQUE KEY `city` (`city`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `contactno1_2` (`email`);

--
-- Indexes for table `helps`
--
ALTER TABLE `helps`
  ADD PRIMARY KEY (`memid`,`oldpeopleid`),
  ADD KEY `oldpeopleid` (`oldpeopleid`);

--
-- Indexes for table `hqcontacts`
--
ALTER TABLE `hqcontacts`
  ADD PRIMARY KEY (`hqid`,`contact`);

--
-- Indexes for table `oldagehomes`
--
ALTER TABLE `oldagehomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `olhome_fk` (`hqid`);

--
-- Indexes for table `oldagemembers`
--
ALTER TABLE `oldagemembers`
  ADD PRIMARY KEY (`memid`),
  ADD KEY `olmember_fk` (`oldagehomeid`);

--
-- Indexes for table `oldpeople`
--
ALTER TABLE `oldpeople`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oldpeople_fk` (`homeid`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`memid`,`childid`),
  ADD KEY `childid` (`childid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `campdetails`
--
ALTER TABLE `campdetails`
  ADD CONSTRAINT `campdetail_fk` FOREIGN KEY (`hqid`) REFERENCES `headquarters` (`hqid`);

--
-- Constraints for table `campmembers`
--
ALTER TABLE `campmembers`
  ADD CONSTRAINT `campmember_fk` FOREIGN KEY (`campid`) REFERENCES `campdetails` (`id`);

--
-- Constraints for table `children`
--
ALTER TABLE `children`
  ADD CONSTRAINT `children_fk` FOREIGN KEY (`campid`) REFERENCES `campdetails` (`id`);

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donor_fk` FOREIGN KEY (`donorid`) REFERENCES `donors` (`id`);

--
-- Constraints for table `helps`
--
ALTER TABLE `helps`
  ADD CONSTRAINT `helps_ibfk_1` FOREIGN KEY (`memid`) REFERENCES `oldagemembers` (`memid`),
  ADD CONSTRAINT `helps_ibfk_2` FOREIGN KEY (`oldpeopleid`) REFERENCES `oldpeople` (`id`);

--
-- Constraints for table `hqcontacts`
--
ALTER TABLE `hqcontacts`
  ADD CONSTRAINT `hqcontacts_fk` FOREIGN KEY (`hqid`) REFERENCES `headquarters` (`hqid`);

--
-- Constraints for table `oldagehomes`
--
ALTER TABLE `oldagehomes`
  ADD CONSTRAINT `olhome_fk` FOREIGN KEY (`hqid`) REFERENCES `headquarters` (`hqid`);

--
-- Constraints for table `oldagemembers`
--
ALTER TABLE `oldagemembers`
  ADD CONSTRAINT `olmember_fk` FOREIGN KEY (`oldagehomeid`) REFERENCES `oldagehomes` (`id`);

--
-- Constraints for table `oldpeople`
--
ALTER TABLE `oldpeople`
  ADD CONSTRAINT `oldpeople_fk` FOREIGN KEY (`homeid`) REFERENCES `oldagehomes` (`id`);

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`memid`) REFERENCES `campmembers` (`memid`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`childid`) REFERENCES `children` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
