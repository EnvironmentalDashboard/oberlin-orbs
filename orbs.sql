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
  `building_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `elec_uuid` varchar(255) DEFAULT NULL,
  `water_uuid` varchar(255) DEFAULT NULL,
  `datahub_elec_id` bigint(20) DEFAULT NULL,
  `datahub_water_id` bigint(20) DEFAULT NULL,
  `elec_rvid` int(11) NOT NULL,
  `water_rvid` int(11) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `last_resp` varchar(8000) DEFAULT NULL,
  `diagnostic` varchar(8000) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `testing` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orbs`
--

INSERT INTO `orbs` (`id`, `building_id`, `name`, `ip`, `elec_uuid`, `water_uuid`, `datahub_elec_id`, `datahub_water_id`, `elec_rvid`, `water_rvid`, `disabled`, `last_resp`, `diagnostic`, `last_updated`, `testing`) VALUES
(1, 0, 'Admissions', 0x313638383836333134, 'oberlin_kahn_res_tot_e', 'oberlin_kahn_res_tot_h2o', 83038, 83043, 2743, 2744, 0, NULL, NULL, '2023-04-19 08:04:36', 0),
(2, 1, 'AJLC', 0x313638383836333135, 'oberlin_ajlc_siteegross', 'oberlin_ajlc_h2otot', 82578, 82614, 2745, 2746, 0, 'OK', NULL, '2023-04-19 08:10:53', 0),
(3, 0, 'AJLC_inactive_using_the_new_firmware', 0x32323235323235373739, 'oberlin_ajlc_siteegross', 'oberlin_h2ocitytot', NULL, NULL, 2747, 2748, 1, '', '', '2018-01-31 02:01:46', 0),
(4, 6, 'Allencroft', 0x313638383836333136, 'oberlin_allencroft_main_e', 'oberlin_allencroft_main_h2o', 82605, 82676, 2749, 2750, 0, 'OK', NULL, '2023-04-13 14:15:34', 0),
(5, 10, 'Asia_House', 0x313638383836333137, 'oberlin_asia_res_tot_e', NULL, 82637, NULL, 2751, 2752, 0, 'OK', NULL, '2023-04-13 14:16:21', 0),
(6, 13, 'Bailey', 0x313638383836333138, 'oberlin_bailey_main_e', 'oberlin_bailey_total_h2o', 82846, 82875, 2753, 2754, 0, NULL, NULL, '2023-04-19 13:36:46', 0),
(7, 15, 'Baldwin', 0x313638383836333139, 'oberlin_baldwin_res_e', 'oberlin_baldwin_total_h2o', 82883, 82843, 2755, 2756, 0, 'OK', NULL, '2023-04-13 14:17:51', 0),
(8, 17, 'Barnard', 0x313638383836333230, 'oberlin_barnard_main_e', 'oberlin_barnard_total_h2o', 82865, 82872, 2757, 2758, 0, 'OK', NULL, '2023-04-20 05:58:38', 0),
(9, 19, 'Barrows', 0x313638383836333231, 'oberlin_barrows_main_e', 'oberlin_barrows_total_h2o', 82840, 82839, 2759, 2760, 0, 'OK', NULL, '2023-04-13 14:18:48', 0),
(10, 21, 'Bosworth', 0x313638383836333232, 'oberlin_bosworth_and_chapel_e', NULL, 82870, NULL, 2761, 2762, 0, 'OK', 'OK', '2023-04-13 14:22:32', 0),
(11, 22, 'Burton_1W', 0x313638383836333234, 'oberlin_burton_1st_floor_west_e', 'oberlin_burton_total_h2o', 82906, 82970, 2763, 2764, 0, 'OK', NULL, '2023-04-13 14:22:32', 0),
(12, 22, 'Burton_2C', 0x313638383836333235, 'oberlin_burton_2nd_floor_center_e', 'oberlin_burton_total_h2o', 82899, 82970, 2765, 2766, 0, '', '', '2023-04-13 14:22:32', 0),
(13, 22, 'Burton_2E', 0x313638383836333236, 'oberlin_burton_2nd_floor_east_e', 'oberlin_burton_total_h2o', 82941, 82970, 2767, 2768, 0, 'OK', NULL, '2023-04-13 14:22:32', 0),
(14, 22, 'Burton_2W', 0x313638383836333237, 'oberlin_burton_2nd_floor_west_e', 'oberlin_burton_total_h2o', 82867, 82970, 2769, 2770, 0, 'OK', NULL, '2023-04-13 14:22:32', 0),
(15, 22, 'Burton_4C', 0x313638383836333238, 'oberlin_burton_4th_floor_e', 'oberlin_burton_total_h2o', 82893, 82970, 2771, 2772, 0, 'OK', NULL, '2023-04-13 14:22:32', 0),
(16, 22, 'Burton_Science_Center_Display_Case', 0x313638383836333233, 'oberlin_burton_1st_floor_east_e', 'oberlin_burton_total_h2o', 82957, 82970, 2773, 2774, 0, 'OK', NULL, '2023-04-13 14:50:25', 0),
(17, 28, 'Cox', 0x313638383836333239, 'oberlin_cox_main_e', NULL, NULL, NULL, 2775, 2776, 0, 'OK', NULL, '2023-04-13 14:36:03', 0),
(18, 29, 'Dascomb', 0x313638383836333330, 'oberlin_dascomb_res_no_mech_e', NULL, 83002, NULL, 2777, 2778, 0, 'OK', NULL, '2023-04-13 14:36:03', 0),
(19, 35, 'East', 0x313638383836333333, 'oberlin_east_main_e', 'oberlin_east_total_h2o', 83021, 83018, 2779, 2780, 0, NULL, NULL, '2023-04-19 13:36:50', 0),
(20, 39, 'Fairchild', 0x313638383836333334, 'oberlin_fairchild_res_tot_e', 'oberlin_fairchild_total_h2o', 83067, 83085, 2781, 2782, 0, 'OK', '================================================================================\r\nOrbWare v1.0\r\n--------------------------------------------------------------------------------\r\nUptime: 17 days, 21 hours, 0 minutes, 19646 ms.\r\n--------------------------------------------------------------------------------\r\n59.47% of SRAM in use. 830 out of 2048 bytes are free.\r\n--------------------------------------------------------------------------------\r\nCommunication:\r\nThe last color command - "/E0W2&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0" - was received  0 days, 0 hours, 0 minutes, 31779 ms ago.\r\nThe longest time without a color command was 0 days, 0 hours, 15 minutes, 36639 ms.\r\nThe longest time without contact was 0 days, 0 hours, 9 minutes, 38357 ms.\r\n\r\nAccepted color commands:      12855\r\nRejected color commands:        0\r\nAccepted auxil commands:   6\r\nRejected auxil commands:   0\r\nRejected wayward bytes:    12860\r\n--------------------------------------------------------------------------------\r\nWater Stats: \r\nbin#              hits            hit %           disp            % disp\r\n0             1611            12.53
5496            11.88\r\n1              5521            42.95           19256           41.61\r\n2              2490
19.37           9490            20.51\r\n3              3233            25.15           12035           26.01\r\n4
0               0.00            0               0.00\r\ntotal           12855                           46277\r\n\r\n
hit                             disp\r\nmean            1.57                            1.61\r\nstdDev          1.00
                1.00\r\n--------------------------------------------------------------------------------\r\nElectricity Stats: \r\nbin#         hits            hit %           disp            % disp\r\n0             12797           99.55
46069           99.55\r\n1              9               0.07            29              0.06\r\n2               4
0.03            12              0.03\r\n3               7               0.05            26              0.06\r\n4
38              0.30            141             0.30\r\ntotal           12855                           46277\r\n\r\n
hit                             disp\r\nmean            0.01                            0.02\r\nstdDev          0.23
                0.24\r\n================================================================================\r\n', '2023-04-13 14:37:47', 0),
(21, 39, 'Fairchild_1st_Floor', 0x313638383836333335, 'oberlin_fairchild_1st_floor_e', 'oberlin_fairchild_total_h2o', 83051, 83085, 2783, 2784, 0, 'OK', NULL, '2023-04-13 14:37:47', 0),
(22, 39, 'Fairchild_2nd_Floor', 0x313638383836333336, 'oberlin_fairchild_res_tot_e', 'oberlin_fairchild_total_h2o', 83067, 83085, 2785, 2786, 0, 'OK', NULL, '2023-04-13 14:37:47', 0),
(23, 39, 'Fairchild_3rd_Floor', 0x313638383836333337, 'oberlin_fairchild_3rd_floor_e', 'oberlin_fairchild_total_h2o', 83046, 83085, 2787, 2788, 0, NULL, NULL, '2023-04-13 14:37:47', 0),
(24, 45, 'Harkness', 0x313638383836333338, 'oberlin_harkness_res_tot_e', 'oberlin_harkness_total_h2o', 83101, 83087, 2789, 2790, 0, 'OK', NULL, '2023-04-13 14:38:41', 0),
(25, 48, 'Harvey', 0x313638383836333339, 'oberlin_harvey_res_e', NULL, 83081, NULL, 2791, 2792, 0, 'OK', NULL, '2023-04-13 14:38:41', 0),
(26, 51, 'Johnson', 0x313638383836333430, 'oberlin_jhouse_main_e', 'oberlin_jhouse_main_h2o', 83065, 83070, 2793, 2794, 0, NULL, NULL, '2023-04-13 14:40:08', 0),
(27, 52, 'Kade', 0x313638383836333431, 'oberlin_kade_res_e', NULL, 83066, NULL, 2795, 2796, 0, NULL, NULL, '2023-04-13 14:40:08', 0),
(28, 54, 'Kahn', 0x313638383836333432, 'oberlin_kahn_res_tot_e', 'oberlin_kahn_res_tot_h2o', 83038, 83043, 2797, 2798, 0, NULL, NULL, '2023-04-13 14:40:08', 0),
(29, 54, 'Kahn_1N', 0x313638383836333433, 'oberlin_kahn_panel_1a_e', 'oberlin_kahn_1n_h2o', 83078, 83097, 2799, 2800, 0, NULL, 'OK', '2023-04-13 14:41:46', 0),
(30, 54, 'Kahn_2N', 0x313638383836333434, 'oberlin_kahn_panel_2a_e', 'oberlin_kahn_2n_h2o', 83075, 83080, 2801, 2802, 0, NULL, 'OK', '2023-04-13 14:41:46', 0),
(31, 54, 'Kahn_2S', 0x313638383836333435, 'oberlin_kahn_panel_2b_e', 'oberlin_kahn_2s_h2o', 83138, 83146, 2803, 2804, 0, NULL, NULL, '2023-04-13 14:41:46', 0),
(32, 54, 'Kahn_3N', 0x313638383836333436, 'oberlin_kahn_panel_3a_e', 'oberlin_kahn_3n_h2o', 83033, 83036, 2805, 2806, 0, NULL, NULL, '2023-04-13 14:41:46', 0),
(33, 54, 'Kahn_3S', 0x313638383836333437, 'oberlin_kahn_panel_3b_e', 'oberlin_kahn_3s_h2o', 83123, 83040, 2807, 2808, 0, NULL, NULL, '2023-04-13 14:41:46', 0),
(34, 58, 'Keep', 0x313638383836333438, 'oberlin_keep_main_e', 'oberlin_keep_total_h2o', 83121, 83131, 2809, 2810, 0, NULL, NULL, '2023-04-13 14:43:24', 0),
(35, 54, 'Khan_Science_Center_Display_Case', 0x32323235323235383433, 'oberlin_kahn_res_tot_e', 'oberlin_kahn_res_tot_h2o', 83038, 83043, 2811, 2812, 0, NULL, NULL, '2023-04-06 07:28:30', 0),
(36, 71, 'Lord', 0x313638383836333439, 'oberlin_lord_saunders_res_tot_e', '539c328405a811e6b5bf525400391da3', 83132, 83125, 2813, 2814, 0, NULL, NULL, '2023-04-13 14:43:24', 0),
(37, 76, 'Noah', 0x313638383836333530, 'oberlin_noah_main_e', 'oberlin_noah_total_h2o', 83157, 83170, 2815, 2816, 0, NULL, NULL, '2023-04-13 14:43:24', 0),
(38, 78, 'North', 0x313638383836333531, 'oberlin_north_main_e', 'oberlin_north_total_h2o', 83182, 83184, 2817, 2818, 0, NULL, NULL, '2023-04-13 14:43:24', 0),
(39, 91, 'Price', 0x313638383836333532, 'oberlin_price_res_e', 'oberlin_price_water_whole_wateruse', 83196, 83846, 2819, 3010, 0, NULL, NULL, '2023-04-20 06:07:59', 0),
(40, 71, 'Saunders', 0x313638383836333533, 'oberlin_saunders_res_e', NULL, 83204, NULL, 2821, 2822, 0, NULL, NULL, '2023-04-13 14:48:09', 0),
(41, 0, 'SEED_East', 0x32323235323630353832, NULL, NULL, NULL, NULL, 2823, 2824, 1, '', '', '2018-03-19 22:45:15', 0),
(42, 0, 'SEED_West', 0x32323235323630353830, NULL, NULL, NULL, NULL, 2825, 2826, 1, '', '', '2018-03-19 22:45:15', 0),
(43, 101, 'South', 0x313638383836333534, 'oberlin_south_res_e', 'oberlin_south_total_h2o', 83237, 83245, 2827, 2828, 0, NULL, NULL, '2023-04-13 14:48:09', 0),
(44, 105, 'Talcott', 0x313638383836333535, 'oberlin_talcott_res_tot_e', 'oberlin_talcott_total_h2o', 83307, 83218, 2829, 2830, 0, 'OK', NULL, '2023-04-11 05:52:24', 0),
(45, 107, 'Tank', 0x313638383836333536, 'oberlin_tank_res_e', 'oberlin_tank_total_h2o', 83219, 83285, 2831, 2832, 0, NULL, NULL, '2023-04-13 14:48:09', 0),
(46, 0, 'UNUSED', 0x32323235323235373839, 'saunders_e', NULL, NULL, NULL, 2833, 2834, 1, '', '', '2018-03-19 22:45:15', 0),
(47, 128, 'Zechiel', 0x313638383836333537, 'a1dd059aa4ff11e5b8e7525400ac67dc', 'oberlin_zeke_total_h2o', 83330, 83345, 2835, 2836, 0, 'OK', NULL, '2023-04-13 14:48:09', 0),
(48, 0, 'test', 0x32313330373036343333, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, '2019-03-20 17:04:25', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orbs`
--
ALTER TABLE `orbs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orbs`
--
ALTER TABLE `orbs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;