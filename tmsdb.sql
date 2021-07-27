-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 23, 2018 at 02:35 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `addstudent`
--

CREATE TABLE IF NOT EXISTS `addstudent` (
  `student_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_address` varchar(255) DEFAULT NULL,
  `student_batch_id` bigint(255) DEFAULT NULL,
  `student_class_name` varchar(255) DEFAULT NULL,
  `student_dob` datetime DEFAULT NULL,
  `student_emailid` varchar(255) DEFAULT NULL,
  `student_number` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `image` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `addstudent`
--

INSERT INTO `addstudent` (`student_id`, `student_address`, `student_batch_id`, `student_class_name`, `student_dob`, `student_emailid`, `student_number`, `student_name`, `image`) VALUES
(22, 'vijayapur', 2, '2', '2018-03-13 00:00:00', 'abc@xyz.com', '09874561234', 'MAroof', NULL),
(26, 'pune', 2, 'Java', '2018-04-17 00:00:00', 'abc@123.com', '123456789', 'Maroof', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `batch_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_number` varchar(255) DEFAULT NULL,
  `batch_timing` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `number_of_students` int(11) DEFAULT NULL,
  `assigned_faculty` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  UNIQUE KEY `batch_number` (`batch_number`),
  UNIQUE KEY `batch_number_2` (`batch_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`batch_id`, `batch_number`, `batch_timing`, `class_name`, `number_of_students`, `assigned_faculty`) VALUES
(3, 'B-1', '4:00PM-6:00PM', 'Java', 20, 'raj'),
(5, 'B-2', '2:00PM-4:00PM', 'DBMS', 10, 'wahab');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `classes_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classes_description` varchar(255) DEFAULT NULL,
  `classes_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`classes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`classes_id`, `classes_description`, `classes_name`) VALUES
(9, 'core java', 'Java'),
(10, 'C# .net', '.NET'),
(11, 'MySQL', 'DBMS'),
(12, 'python basics', 'Python');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `exam_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exam_coordinator` varchar(255) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `exam_time` varchar(255) DEFAULT NULL,
  `exam_total_marks` varchar(255) DEFAULT NULL,
  `exam_type` varchar(255) DEFAULT NULL,
  `class_name` varchar(50) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `exam_details` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_id`, `exam_coordinator`, `exam_date`, `exam_time`, `exam_total_marks`, `exam_type`, `class_name`, `batch`, `duration`, `exam_details`) VALUES
(18, 'raj', '2018-04-19', '15:58', '25', 'Class Test', 'Java', 'B-1', '1 hour', 'class room no 11');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `faculty_address` varchar(255) DEFAULT NULL,
  `faculty_contact` varchar(255) DEFAULT NULL,
  `faculty_dob` date DEFAULT NULL,
  `faculty_date_of_joning` date DEFAULT NULL,
  `faculty_email` varchar(255) DEFAULT NULL,
  `faculty_name` varchar(255) DEFAULT NULL,
  `faculty_photo` tinyint(4) DEFAULT NULL,
  `faulty_class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `faculty_address`, `faculty_contact`, `faculty_dob`, `faculty_date_of_joning`, `faculty_email`, `faculty_name`, `faculty_photo`, `faulty_class_name`) VALUES
(1, 'pune', 'Maths', '2018-12-31', '2017-11-30', 'ff', 'raj', NULL, 'klkljm');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
  `fees_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `batch_id` bigint(20) DEFAULT NULL,
  `classes_id` bigint(20) DEFAULT NULL,
  `date_of_fees` date DEFAULT NULL,
  `fees_paid_option` varchar(255) DEFAULT NULL,
  `paid_fees` varchar(255) DEFAULT NULL,
  `remaining_fees` varchar(255) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `total_fees` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fees_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`fees_id`, `batch_id`, `classes_id`, `date_of_fees`, `fees_paid_option`, `paid_fees`, `remaining_fees`, `student_id`, `student_name`, `total_fees`) VALUES
(27, 11, 2, '2018-04-20', NULL, '100', '1900.00', 200, 'Azh', '2000'),
(62, 223, 33, '2018-04-09', NULL, '1000', '9000.00', 22, 'Wahab', '10000'),
(63, 22, 333, '2018-04-17', NULL, '1000', '9000.00', 22, 'Maroof', '10000'),
(64, 444, 22, '2018-04-03', NULL, '1000', '9000.00', 22, 'Maroof', '10000'),
(65, 22, 22, '2018-04-17', NULL, '1000', '11222.00', 22, '22', '12222'),
(66, 22, 22, '2018-04-16', NULL, '1000', '11222.00', 22, 'pp', '12222'),
(67, 22, 1, '2018-04-17', NULL, '1000', '9000.00', 22, 'pp', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_name` varchar(100) DEFAULT NULL,
  `question` varchar(500) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `chapter_name`, `question`, `marks`) VALUES
(1, 'OOPS CONCEPTS', 'Explain OOPS', 5),
(2, 'COLLACTIONS API', 'Explain Collections API', 5),
(3, 'STRING HANDLING', 'Explain String handling', 8),
(4, 'OOPS CONCEPTS', 'Explain OOPS', 3),
(5, 'COLLACTIONS API', 'Explain Collections API', 5),
(6, 'STRING HANDLING', 'Explain String handling', 8),
(7, 'OOPS CONCEPTS', 'Explain OOPS', 3),
(8, 'COLLECTIONS API', 'Explain Collections API', 5),
(9, 'STRING HANDLING', 'Explain String handling', 8),
(10, 'Spring', 'What is Spring?', 3),
(11, 'Spring', 'Explain IoC', 10),
(12, 'Spring ', 'Explain DI', 10);

-- --------------------------------------------------------

--
-- Table structure for table `question_papers`
--

CREATE TABLE IF NOT EXISTS `question_papers` (
  `question_id_in_questionpaper` bigint(20) NOT NULL AUTO_INCREMENT,
  `exam_id` bigint(20) DEFAULT NULL,
  `chapter_name` varchar(100) DEFAULT NULL,
  `question` varchar(300) DEFAULT NULL,
  `marks` int(3) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`question_id_in_questionpaper`),
  KEY `exam_id` (`exam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `question_papers`
--

INSERT INTO `question_papers` (`question_id_in_questionpaper`, `exam_id`, `chapter_name`, `question`, `marks`, `question_id`) VALUES
(8, 18, 'Spring ', 'Explain DI', 10, 12),
(9, 18, 'OOPS CONCEPTS', 'Explain OOPS', 3, 4),
(10, 18, 'Spring', 'Explain IoC', 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tuition`
--

CREATE TABLE IF NOT EXISTS `tuition` (
  `tuition_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tuition_owner_name` varchar(255) DEFAULT NULL,
  `tuition_address` varchar(255) DEFAULT NULL,
  `tuition_contact_no` varchar(255) DEFAULT NULL,
  `tuition_email_address` varchar(255) DEFAULT NULL,
  `tuition_established_year` varchar(255) DEFAULT NULL,
  `tuition_gst_no` varchar(255) DEFAULT NULL,
  `tuition_name` varchar(255) DEFAULT NULL,
  `tuition_registration_date` date DEFAULT NULL,
  `tuition_website_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tuition_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tuition`
--

INSERT INTO `tuition` (`tuition_id`, `tuition_owner_name`, `tuition_address`, `tuition_contact_no`, `tuition_email_address`, `tuition_established_year`, `tuition_gst_no`, `tuition_name`, `tuition_registration_date`, `tuition_website_address`) VALUES
(3, 'Sandeepm', 'Pune 12', '7894561230', 'sandeep@raj.com', '2017', 'GST1110', 'Sandeep raj', '2018-03-17', 'sandeeprajinfotech.com'),
(5, 'Sandeep', 'Pune05', '121321', 'sandeep@gmail.com', '2012', '12114', 'Sandeep', '2018-03-13', 'www.Sandeep.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question_papers`
--
ALTER TABLE `question_papers`
  ADD CONSTRAINT `question_papers_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
