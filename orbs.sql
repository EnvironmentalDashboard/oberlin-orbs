-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2016 at 12:54 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oberlin_environmentaldashboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `orbs`
--

CREATE TABLE `orbs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `elecpoint` varchar(50) NOT NULL DEFAULT 'x',
  `waterpoint` varchar(50) NOT NULL DEFAULT 'x',
  `elec_id` int(11) DEFAULT NULL,
  `water_id` int(11) DEFAULT NULL,
  `avgtype` varchar(10) NOT NULL,
  `disabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orbs`
--

INSERT INTO `orbs` (`id`, `name`, `ip`, `elecpoint`, `waterpoint`, `elec_id`, `water_id`, `avgtype`, `disabled`) VALUES
(1, 'Admissions', '132.162.64.57', 'oberlin_kahn_res_tot_e', 'oberlin_kahn_res_tot_h2o', 490, 491, 'sevenday', 0),
(2, 'AJLC', '132.162.64.77', 'oberlin_ajlc_siteegross', 'oberlin_ajlc_h2otot', 189, 77, 'sevenday', 0),
(3, 'AJLC_inactive_using_the_new_firmware', '132.162.64.51', 'oberlin_ajlc_siteegross', 'oberlin_h2ocitytot', 189, NULL, 'sevenday', 1),
(4, 'Allencroft', '132.162.64.103', 'oberlin_allencroft_main_e', 'oberlin_allencroft_main_h2o', 226, NULL, 'sevenday', 0),
(5, 'Asia_House', '132.162.64.89', 'oberlin_asia_res_tot_e', 'x', 239, NULL, 'sevenday', 0),
(6, 'Bailey', '132.162.64.113', 'oberlin_bailey_main_e', 'oberlin_bailey_total_h2o', 244, 249, 'sevenday', 0),
(7, 'Baldwin', '132.162.64.94', 'oberlin_baldwin_res_e', 'oberlin_baldwin_total_h2o', 257, 258, 'sevenday', 0),
(8, 'Barnard', '132.162.64.108', 'oberlin_barnard_main_e', 'oberlin_barnard_total_h2o', 262, 266, 'sevenday', 0),
(9, 'Barrows', '132.162.64.90', 'oberlin_barrows_main_e', 'oberlin_barrows_total_h2o', 270, 274, 'sevenday', 0),
(10, 'Bosworth', '132.162.64.79', 'oberlin_bosworth_and_chapel_e', 'x', 278, NULL, 'onemonth', 0),
(11, 'Burton_1W', '132.162.64.84', 'oberlin_burton_1st_floor_west_e', 'oberlin_burton_total_h2o', 284, 301, 'sevenday', 0),
(12, 'Burton_2C', '132.162.64.86', 'oberlin_burton_2nd_floor_center_e', 'oberlin_burton_total_h2o', 288, 301, 'sevenday', 0),
(13, 'Burton_2E', '132.162.64.83', 'oberlin_burton_2nd_floor_east_e', 'oberlin_burton_total_h2o', 289, 301, 'sevenday', 0),
(14, 'Burton_2W', '132.162.64.59', 'oberlin_burton_2nd_floor_west_e', 'oberlin_burton_total_h2o', 290, 301, 'sevenday', 0),
(15, 'Burton_4C', '132.162.64.74', 'oberlin_burton_4th_floor_e', 'oberlin_burton_total_h2o', 296, 301, 'sevenday', 0),
(16, 'Burton_Science_Center_Display_Case', '132.162.64.101', 'oberlin_burton_1st_floor_east_e', 'oberlin_burton_total_h2o', 283, 301, 'sevenday', 0),
(17, 'Cox', '132.162.64.73', 'oberlin_cox_main_e', 'x', 325, NULL, 'onemonth', 0),
(18, 'Dascomb', '132.162.64.82', 'oberlin_dascomb_res_no_mech_e', 'x', 336, NULL, 'sevenday', 0),
(19, 'East', '132.162.64.107', 'oberlin_east_main_e', 'oberlin_east_total_h2o', 405, 409, 'sevenday', 0),
(20, 'Fairchild', '132.162.64.75', 'oberlin_fairchild_res_tot_e', 'oberlin_fairchild_total_h2o', 423, 424, 'sevenday', 0),
(21, 'Fairchild_1st_Floor', '132.162.64.58', 'oberlin_fairchild_1st_floor_e', 'oberlin_fairchild_total_h2o', 417, 424, 'sevenday', 0),
(22, 'Fairchild_2nd_Floor', '132.162.64.71', 'oberlin_fairchild_2nd_floor_e_new', 'oberlin_fairchild_total_h2o', NULL, 424, 'sevenday', 0),
(23, 'Fairchild_3rd_Floor', '132.162.64.78', 'oberlin_fairchild_3rd_floor_e', 'oberlin_fairchild_total_h2o', 419, 424, 'sevenday', 0),
(24, 'Harkness', '132.162.64.95', 'oberlin_harkness_res_tot_e', 'oberlin_harkness_total_h2o', 438, 439, 'sevenday', 0),
(25, 'Harvey', '132.162.64.55', 'oberlin_harvey_res_e', 'x', 451, NULL, 'sevenday', 0),
(26, 'Johnson', '132.162.64.105', 'oberlin_jhouse_main_e', 'oberlin_jhouse_main_h2o', 454, 455, 'sevenday', 0),
(27, 'Kade', '132.162.64.52', 'oberlin_kade_res_e', 'x', 457, NULL, 'sevenday', 0),
(28, 'Kahn', '132.162.64.91', 'oberlin_kahn_res_tot_e', 'oberlin_kahn_res_tot_h2o', 490, 491, 'sevenday', 0),
(29, 'Kahn_1N', '132.162.64.76', 'oberlin_kahn_panel_1a_e', 'oberlin_kahn_1n_h2o', 479, 460, 'sevenday', 0),
(30, 'Kahn_2N', '132.162.64.70', 'oberlin_kahn_panel_2a_e', 'oberlin_kahn_2n_h2o', 483, 463, 'sevenday', 0),
(31, 'Kahn_2S', '132.162.64.80', 'oberlin_kahn_panel_2b_e', 'oberlin_kahn_2s_h2o', 484, 466, 'sevenday', 0),
(32, 'Kahn_3N', '132.162.64.53', 'oberlin_kahn_panel_3a_e', 'oberlin_kahn_3n_h2o', 486, 469, 'sevenday', 0),
(33, 'Kahn_3S', '132.162.64.56', 'oberlin_kahn_panel_3b_e', 'oberlin_kahn_3s_h2o', 487, 472, 'sevenday', 1),
(34, 'Keep', '132.162.64.92', 'oberlin_keep_main_e', 'oberlin_keep_total_h2o', 502, 505, 'sevenday', 0),
(35, 'Khan_Science_Center_Display_Case', '132.162.64.115', 'oberlin_kahn_res_tot_e', 'oberlin_kahn_res_tot_h2o', 490, 491, 'sevenday', 0),
(36, 'Lord', '132.162.64.96', 'oberlin_lord_saunders_res_tot_e', 'oberlin_lord_saunders_total_h20', 562, NULL, 'sevenday', 0),
(37, 'Noah', '132.162.64.106', 'oberlin_noah_main_e', 'oberlin_noah_total_h2o', 589, 595, 'sevenday', 0),
(38, 'North', '132.162.64.81', 'oberlin_north_main_e', 'oberlin_north_total_h2o', 599, 603, 'sevenday', 0),
(39, 'Price', '132.162.64.97', 'oberlin_price_res_e', 'x', 799, NULL, 'sevenday', 0),
(40, 'Saunders', '132.162.64.98', 'oberlin_saunders_res_e', 'x', 813, NULL, 'sevenday', 0),
(41, 'SEED_East', '132.162.200.38', 'x', 'x', NULL, NULL, 'sevenday', 1),
(42, 'SEED_West', '132.162.200.36', 'x', 'x', NULL, NULL, 'sevenday', 1),
(43, 'South', '132.162.64.99', 'oberlin_south_res_e', 'oberlin_south_total_h2o', 828, 832, 'sevenday', 0),
(44, 'Talcott', '132.162.64.114', 'oberlin_talcott_res_tot_e', 'oberlin_talcott_total_h2o', 845, 846, 'sevenday', 0),
(45, 'Tank', '132.162.64.100', 'oberlin_tank_res_e', 'oberlin_tank_total_h2o', 851, 852, 'sevenday', 0),
(46, 'UNUSED', '132.162.64.61', 'saunders_e', 'x', NULL, NULL, 'sevenday', 1),
(47, 'Zechiel', '132.162.64.93', 'oberlin_zeke_main_e', 'oberlin_zeke_total_h2o', NULL, NULL, 'sevenday', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orbs`
--
ALTER TABLE `orbs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orbs`
--
ALTER TABLE `orbs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
