-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 17, 2022 at 10:05 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chure`
--

-- --------------------------------------------------------

--
-- Table structure for table `caring_result`
--

CREATE TABLE `caring_result` (
  `id` int(11) NOT NULL,
  `internet_id` varchar(20) NOT NULL,
  `obc_id` varchar(20) NOT NULL,
  `outcome` enum('Sukses Winback','Clearing Tagihan','Gagal Caring (Not Contacted)','Gagal Caring (Contacted)') NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chure_performance`
--

CREATE TABLE `chure_performance` (
  `id` int(20) NOT NULL,
  `month` varchar(20) NOT NULL,
  `churn_prob` varchar(20) NOT NULL,
  `current_lis` varchar(20) NOT NULL,
  `churn` varchar(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chure_performance`
--

INSERT INTO `chure_performance` (`id`, `month`, `churn_prob`, `current_lis`, `churn`, `created_time`) VALUES
(1, 'Jan', '10', '15', '12', '2022-03-10 00:49:21'),
(2, 'Feb', '30', '35', '32', '2022-03-10 00:49:21'),
(3, 'Mar', '55', '50', '60', '2022-03-10 00:49:21'),
(4, 'Apr', '20', '15', '12', '2022-03-10 00:49:21'),
(5, 'May', '22', '10', '6', '2022-03-10 00:49:21'),
(6, 'Jun', '7', '12', '5', '2022-03-10 00:49:21'),
(7, 'Jul', '22', '19', '10', '2022-03-10 00:49:21'),
(8, 'Aug', '2', '4', '3', '2022-03-10 00:49:21'),
(9, 'Sep', '10', '15', '12', '2022-03-10 00:49:21'),
(10, 'Oct', '15', '12', '10', '2022-03-10 00:49:21'),
(11, 'Nov', '20', '25', '30', '2022-03-10 00:49:21'),
(12, 'Des', '30', '25', '22', '2022-03-10 00:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `churn_analytics`
--

CREATE TABLE `churn_analytics` (
  `id` int(11) NOT NULL,
  `year` varchar(20) NOT NULL,
  `month` varchar(20) NOT NULL,
  `new_sales` int(20) NOT NULL,
  `churn` int(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `churn_analytics`
--

INSERT INTO `churn_analytics` (`id`, `year`, `month`, `new_sales`, `churn`, `created_time`) VALUES
(1, '2021', 'Jan', 200, 85, '2022-03-09 18:23:10'),
(2, '2021', 'Oct', 175, 100, '2022-03-09 18:23:10'),
(3, '2021', 'Apr', 115, 15, '2022-03-09 18:23:10'),
(4, '2021', 'Nov', 295, 50, '2022-03-09 18:23:10'),
(5, '2021', 'Des', 150, 100, '2022-03-09 18:23:10'),
(6, '2021', 'Jul', 115, 35, '2022-03-09 18:23:10'),
(7, '2021', 'Jun', 85, 100, '2022-03-09 18:23:10'),
(8, '2021', 'Sep', 215, 55, '2022-03-09 18:23:10'),
(9, '2021', 'Aug', 50, 50, '2022-03-09 18:23:10'),
(10, '2021', 'Feb', 285, 35, '2022-03-09 18:23:10'),
(11, '2021', 'May', 150, 15, '2022-03-09 18:23:10'),
(12, '2021', 'Mar', 125, 45, '2022-03-09 18:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `customers_high_churn`
--

CREATE TABLE `customers_high_churn` (
  `id` int(11) NOT NULL,
  `internet_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `main_problem` varchar(100) NOT NULL,
  `unit_pic` varchar(50) NOT NULL,
  `status` enum('OPEN','PENDING','CLOSED') NOT NULL DEFAULT 'OPEN',
  `churn_prob` varchar(50) NOT NULL,
  `action` enum('Caring Now','Re-Caring','Success') NOT NULL,
  `action_admin` enum('Assign Task Now','Assigned') NOT NULL DEFAULT 'Assign Task Now',
  `description1` varchar(100) NOT NULL,
  `description2` varchar(100) NOT NULL,
  `description3` varchar(100) NOT NULL,
  `description4` varchar(100) NOT NULL,
  `description5` varchar(100) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers_high_churn`
--

INSERT INTO `customers_high_churn` (`id`, `internet_id`, `name`, `main_problem`, `unit_pic`, `status`, `churn_prob`, `action`, `action_admin`, `description1`, `description2`, `description3`, `description4`, `description5`, `created_time`) VALUES
(1, '111217001837', 'Suryandi Kusuma', 'Paket Kemahalan', 'Customer Care', 'CLOSED', '75%', 'Success', 'Assigned', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(2, '111209090338', 'Ibu Evi', 'Gangguan Ulang', 'Customer Care', 'OPEN', '70%', 'Caring Now', 'Assigned', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(3, '111216100288', 'Eko April', 'Jaringan Buruk', 'Customer Care', 'OPEN', '56%', 'Caring Now', 'Assigned', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(4, '111214000345', 'Yuli', 'Tagihan Tidak Sesuai', 'Customer Care', 'OPEN', '70%', 'Caring Now', 'Assigned', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(5, '111209103440', 'Setiawan Gani', 'Penurunan Usage', 'Customer Care', 'OPEN', '50%', 'Caring Now', 'Assigned', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(6, '111221102871', 'H. Siregar', 'Tagihan Tidak Sesuai', 'Customer Care', 'OPEN', '70%', 'Caring Now', 'Assigned', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(7, '111209058527', 'Sharah Fadilah', 'Gangguan Teknis', 'Customer Care', 'OPEN', '40%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(8, '111212104992', 'Rissa Aliria', 'Tagihan Tidak Sesuao', 'Customer Care', 'OPEN', '74%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(9, '111221102871', 'Diana Hertiyas', 'Jaringan Buruk', 'Customer Care', 'OPEN', '73%', 'Caring Now', 'Assigned', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(10, '111212104992', 'Nurina Fildzah', 'Paket Kemahalan', 'Customer Care', 'OPEN', '60%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 07:58:25'),
(11, '111231105832', 'Julisman Batu Bara', 'Paket Kemahalan', 'Customer Care', 'OPEN', '46%%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(12, '111209065287', 'Matius Jusuf, MBA', 'Gangguan Ulang', 'Customer Care', 'OPEN', '54%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(13, '111209201388', 'Bu Suri', 'Gangguan Ulang', 'Customer Care', 'OPEN', '56%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(14, '111207072812', 'Yarianto SE', 'Gangguan Ulang', 'Customer Care', 'OPEN', '67%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(15, '111219102430', 'Tom Jerry', 'Gangguan Ulang', 'Customer Care', 'OPEN', '63%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(16, '111214100935', 'Andika', 'Gangguan Ulang', 'Customer Care', 'OPEN', '50%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(17, '111211020793', 'Pak Aziz', 'Paket Kemahalan', 'Customer Care', 'OPEN', '46%%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(18, '111207105787', 'Bp Marojahan', 'Gangguan Ulang', 'Customer Care', 'OPEN', '65%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(19, '111224105268', 'Mhd Arsyad', 'Gangguan Ulang', 'Customer Care', 'OPEN', '74%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(20, '111213207062', 'Bpk Lesmana', 'Gangguan Ulang', 'Customer Care', 'OPEN', '30%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(21, '111209000674', 'Lukas', 'Gangguan Ulang', 'Customer Care', 'OPEN', '55%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(22, '111209215894', 'Tong Han', 'Gangguan Ulang', 'Customer Care', 'OPEN', '67%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(23, '111209143437', 'Cipto Sunaryo', 'Gangguan Ulang', 'Customer Care', 'OPEN', '43%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(24, '111217102997', 'Ibu Bachtiar', 'Gangguan Ulang', 'Customer Care', 'OPEN', '56%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(25, '111209058527', 'Anthony', 'Gangguan Ulang', 'Customer Care', 'OPEN', '30%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(26, '111216110778', 'Bpk Maur Lubis', 'Gangguan Ulang', 'Customer Care', 'OPEN', '69%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(27, '111218107652', 'Ibu Ida', 'Gangguan Ulang', 'Customer Care', 'OPEN', '73%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(28, '111207102243', 'So Huan', 'Paket Kemahalan', 'Customer Care', 'OPEN', '45%%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(29, '111217091988', 'Ibu Yeni', 'Gangguan Ulang', 'Customer Care', 'OPEN', '46%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(30, '111212104992', 'Pak Tanjung', 'Gangguan Ulang', 'Customer Care', 'OPEN', '69%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(31, '111209112431', 'Jap Sio Giok', 'Gangguan Ulang', 'Customer Care', 'OPEN', '64%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(32, '111202104407', 'Tunteng', 'Gangguan Ulang', 'Customer Care', 'OPEN', '60%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(33, '111216100987', 'Wisman', 'Gangguan Ulang', 'Customer Care', 'OPEN', '44%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(34, '111209122385', 'Steven', 'Gangguan Ulang', 'Customer Care', 'OPEN', '71%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(35, '111212008899', 'Djoni', 'Gangguan Ulang', 'Customer Care', 'OPEN', '72%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(36, '111219104034', 'Bapak Dewanta', 'Gangguan Ulang', 'Customer Care', 'OPEN', '70%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(37, '111212008739', 'Wijaya', 'Gangguan Ulang', 'Customer Care', 'OPEN', '56%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(38, '111209212894', 'Irwan', 'Gangguan Ulang', 'Customer Care', 'OPEN', '73%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(39, '111217113767', 'Evi', 'Gangguan Ulang', 'Customer Care', 'OPEN', '74%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(40, '111209005906', 'Bp Richard', 'Gangguan Ulang', 'Customer Care', 'OPEN', '68%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(41, '111208100573', 'Rasmi', 'Paket Kemahalan', 'Customer Care', 'OPEN', '67%%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(42, '111207008459', 'Bp Mansyur', 'Gangguan Ulang', 'Customer Care', 'OPEN', '65%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(43, '111224101802', 'Eka', 'Gangguan Ulang', 'Customer Care', 'OPEN', '67%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(44, '111225100211', 'Lim', 'Gangguan Ulang', 'Customer Care', 'OPEN', '68%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(45, '111207004355', 'Bp Joesaragih', 'Gangguan Ulang', 'Customer Care', 'OPEN', '73%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(46, '111217084156', 'Mulyadi', 'Gangguan Ulang', 'Customer Care', 'OPEN', '72%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(47, '111216100280', 'Sadali Soetanto / Arbi', 'Gangguan Ulang', 'Customer Care', 'OPEN', '70%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(48, '111213108318', 'Septi', 'Gangguan Ulang', 'Customer Care', 'OPEN', '73%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(49, '111217091582', 'Bu Eva', 'Gangguan Ulang', 'Customer Care', 'OPEN', '63%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(50, '111213109067', 'Bu Mutia', 'Paket Kemahalan', 'Customer Care', 'OPEN', '46%%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(51, '111213000151', 'Balian', 'Gangguan Ulang', 'Customer Care', 'OPEN', '71%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/CTD)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(52, '111209060807', 'Ayin', 'Gangguan Ulang', 'Customer Care', 'OPEN', '56%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(53, '111217104441', 'Yuli', 'Gangguan Ulang', 'Customer Care', 'OPEN', '64%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(54, '111213208432', 'Setia Budi Kuncoro', 'Gangguan Ulang', 'Customer Care', 'OPEN', '67%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(55, '111217119046', 'Surya Rahmadiansyah', 'Gangguan Ulang', 'Customer Care', 'OPEN', '69%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(56, '111216100504', 'Akemi', 'Gangguan Ulang', 'Customer Care', 'OPEN', '64%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(57, '111221102344', 'Bernike', 'Gangguan Ulang', 'Customer Care', 'OPEN', '72%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(58, '111212105163', 'Bang Min', 'Gangguan Ulang', 'Customer Care', 'OPEN', '64%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(59, '111213007631', 'Lisa', 'Gangguan Ulang', 'Customer Care', 'OPEN', '60%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/TMU)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Tagihan Gimmick Tidak Sesuai)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38'),
(60, '111207071843', 'Ika Susianti', 'Gangguan Ulang', 'Customer Care', 'OPEN', '60%', 'Caring Now', 'Assign Task Now', 'MEDAN (MEDAN/STB)', '[PL][PRIORITY : SUPER EMERGENCY]', 'CATEGORY : ADMIN (Non Teknis - Penurunan Usage)', 'NON_HVC', 'CS CUSTOMER CARE WITEL SUMUT BARAT (MEDAN)', '2022-03-10 13:07:38');

-- --------------------------------------------------------

--
-- Table structure for table `obc_task`
--

CREATE TABLE `obc_task` (
  `id` int(100) NOT NULL,
  `obc_id` varchar(20) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `status` enum('Success','Re-Caring','Assigned') NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `obc_task`
--

INSERT INTO `obc_task` (`id`, `obc_id`, `customer_id`, `status`, `created_time`) VALUES
(5, 'OC003', '111217001837', 'Assigned', '2022-03-17 15:03:27'),
(6, 'OC003', '111209090338', 'Assigned', '2022-03-17 15:03:36'),
(7, 'OC003', '111216100288', 'Assigned', '2022-03-17 15:03:49'),
(8, 'OC003', '111214000345', 'Assigned', '2022-03-17 15:03:59'),
(9, 'OC003', '111209103440', 'Assigned', '2022-03-17 15:04:08'),
(10, 'OC003', '111221102871', 'Assigned', '2022-03-17 15:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `performance_diagram`
--

CREATE TABLE `performance_diagram` (
  `id` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `jumlah_caring` varchar(20) NOT NULL,
  `target_caring` varchar(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `performance_diagram`
--

INSERT INTO `performance_diagram` (`id`, `month`, `jumlah_caring`, `target_caring`, `created_time`) VALUES
(1, '01', '880', '900', '2022-03-10 13:09:17'),
(2, '02', '900', '800', '2022-03-10 13:09:17'),
(3, '10', '750', '950', '2022-03-10 13:09:17'),
(4, '11', '870', '900', '2022-03-10 13:09:17'),
(5, '12', '850', '900', '2022-03-10 13:09:17'),
(6, '04', '800', '1000', '2022-03-10 13:09:17'),
(7, '05', '650', '850', '2022-03-10 13:09:17'),
(8, '06', '680', '700', '2022-03-10 13:09:17'),
(9, '03', '700', '800', '2022-03-10 13:09:17'),
(10, '08', '450', '500', '2022-03-10 13:09:17'),
(11, '09', '750', '800', '2022-03-10 13:09:17'),
(12, '07', '770', '900', '2022-03-10 13:09:17');

-- --------------------------------------------------------

--
-- Table structure for table `recent_caring_activity`
--

CREATE TABLE `recent_caring_activity` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `last_time` varchar(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recent_caring_activity`
--

INSERT INTO `recent_caring_activity` (`id`, `name`, `last_time`, `created_time`) VALUES
(1, 'Henry Rashford', '5 minutes ago', '2022-03-09 18:28:43'),
(2, 'Jack Chidwell', '31 minutes ago', '2022-03-09 18:28:43'),
(3, 'Manuel Wilkons', '1 day ago', '2022-03-09 18:28:43'),
(4, 'Marie Jones', '2 hours ago', '2022-03-09 18:28:43'),
(5, 'Peter Crouch', '2 days ago', '2022-03-09 18:28:43'),
(6, 'Paul Smith', '3 days ago', '2022-03-09 18:28:43'),
(7, 'Han Lee', '4 days ago', '2022-03-09 18:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `regional_table`
--

CREATE TABLE `regional_table` (
  `id` int(11) NOT NULL,
  `regional` varchar(20) NOT NULL,
  `high_prob_churn` varchar(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regional_table`
--

INSERT INTO `regional_table` (`id`, `regional`, `high_prob_churn`, `created_time`) VALUES
(1, 'Regional 1', '100', '2022-03-09 19:43:43'),
(2, 'Regional 2', '250', '2022-03-09 19:43:43'),
(4, 'Regional 3', '140', '2022-03-09 19:43:43'),
(5, 'Regional 4', '160', '2022-03-09 19:43:43'),
(6, 'Regional 5', '302', '2022-03-09 19:43:43'),
(7, 'Regional 6', '65', '2022-03-09 19:43:43'),
(8, 'Regional 7', '60', '2022-03-09 19:43:43'),
(9, 'Regional 8', '70', '2022-03-09 19:43:43'),
(10, 'Regional 9', '110', '2022-03-09 19:43:43'),
(11, 'Regional 10', '90', '2022-03-09 19:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `reports_pencairan`
--

CREATE TABLE `reports_pencairan` (
  `id` int(11) NOT NULL,
  `uraian` varchar(20) NOT NULL,
  `ssl2` varchar(20) NOT NULL,
  `rupiah` varchar(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports_pencairan`
--

INSERT INTO `reports_pencairan` (`id`, `uraian`, `ssl2`, `rupiah`, `created_time`) VALUES
(1, 'Hari Ini', '13', '8,500,360', '2022-03-10 15:52:16'),
(2, 'Bulan Ini', '85', '50,374,320', '2022-03-10 15:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `reports_rekapitulasi_hasil_caring`
--

CREATE TABLE `reports_rekapitulasi_hasil_caring` (
  `id` int(11) NOT NULL,
  `uraian` varchar(50) NOT NULL,
  `hari_ini` varchar(20) NOT NULL,
  `bulan_ini` varchar(20) NOT NULL,
  `share` varchar(20) NOT NULL,
  `created_time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports_rekapitulasi_hasil_caring`
--

INSERT INTO `reports_rekapitulasi_hasil_caring` (`id`, `uraian`, `hari_ini`, `bulan_ini`, `share`, `created_time`) VALUES
(1, 'Data Prospek', '', '7,975', '', '2022-03-10 15:53:49'),
(2, 'Jumlah Caring', '306', '4,621', '', '2022-03-10 15:53:49'),
(3, 'Sukses Winback', '0', '83', '1.95%', '2022-03-10 15:53:49'),
(4, 'Clearing Tagihan', '0', '0', '0.00%', '2022-03-10 15:53:49'),
(5, 'Contacted', '62', '800', '18.77%', '2022-03-10 15:53:49'),
(6, 'Not Contacted', '244', '3,378', '79.28%', '2022-03-10 15:53:49'),
(7, 'Sisa Data Prospek', '', '3,714', '', '2022-03-10 15:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `reports_table1`
--

CREATE TABLE `reports_table1` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `hasil_caring` varchar(50) NOT NULL,
  `daily` varchar(50) NOT NULL,
  `bulan_ini` varchar(50) NOT NULL,
  `share_bulan_ini` varchar(50) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports_table1`
--

INSERT INTO `reports_table1` (`id`, `title`, `hasil_caring`, `daily`, `bulan_ini`, `share_bulan_ini`, `created_time`) VALUES
(50, 'SUKSES WINBACK', 'Paket Eksisting', '', '83', '100.00%', '2022-03-10 15:43:47'),
(51, 'SUKSES WINBACK', 'Paket Retensi', '', '', '0.00%', '2022-03-10 15:43:47'),
(52, 'SUKSES WINBACK', 'Paket Cicilan', '', '', '0.00%', '2022-03-10 15:43:47'),
(53, 'SUKSES WINBACK', 'Paket Prepaid', '', '', '0.00%', '2022-03-10 15:43:47'),
(54, 'SUKSES WINBACK', 'Sub Total', '0', '83', '100.00%', '2022-03-10 15:43:47'),
(55, 'CLEARING TAGIHAN', 'Clearing Deposit PSB', '', '', '0.00%', '2022-03-10 15:44:26'),
(56, 'CLEARING TAGIHAN', 'Clearing Uang Titipan CAPS', '', '', '0.00%', '2022-03-10 15:44:26'),
(57, 'CLEARING TAGIHAN', 'Sub Total', '', '', '0.00%', '2022-03-10 15:44:26'),
(76, 'GAGAL CARING (NOT CONTACTED)', 'Telepon Tulalit', '3', '38', '1.12%', '2022-03-10 15:46:54'),
(77, 'GAGAL CARING (NOT CONTACTED)', 'Telepon Tidak Diangkat - RNA', '91', '1,455', '43.07%', '2022-03-10 15:46:54'),
(78, 'GAGAL CARING (NOT CONTACTED)', 'Telepon Salah Sambung', '9', '74', '2.19%', '2022-03-10 15:46:54'),
(79, 'GAGAL CARING (NOT CONTACTED)', 'Mail Box - Memo', '1', '56', '1.66%', '2022-03-10 15:46:54'),
(80, 'GAGAL CARING (NOT CONTACTED)', 'Line Busy', '14', '181', '5.36%', '2022-03-10 15:46:54'),
(81, 'GAGAL CARING (NOT CONTACTED)', 'Invalid Phone Number', '51', '686', '20.31%', '2022-03-10 15:46:54'),
(82, 'GAGAL CARING (NOT CONTACTED)', 'Call Rejected', '18', '282', '8.35%', '2022-03-10 15:46:54'),
(83, 'GAGAL CARING (NOT CONTACTED)', 'ND_HP CP Tidak Aktif', '57', '606', '17.94%', '2022-03-10 15:46:54'),
(84, 'GAGAL CARING (NOT CONTACTED)', 'Sub Total', '244', '3,378', '100.00%', '2022-03-10 15:46:54'),
(85, 'GAGAL CARING (CONTACTED)', 'Janji Bayar', '9', '146', '18.25%', '2022-03-10 15:47:27'),
(86, 'GAGAL CARING (CONTACTED)', 'Minta Call Ulang', '15', '140', '17.50%', '2022-03-10 15:47:27'),
(87, 'GAGAL CARING (CONTACTED)', 'Layanan Belum Aktif', '', '', '0.00%', '2022-03-10 15:47:27'),
(88, 'GAGAL CARING (CONTACTED)', 'Tidak Merasa Pasang', '1', '6', '0.75%', '2022-03-10 15:47:27'),
(89, 'GAGAL CARING (CONTACTED)', 'Bukan Pelanggan Bersangkutan', '9', '119', '14.88%', '2022-03-10 15:47:27'),
(90, 'GAGAL CARING (CONTACTED)', 'Kecepatan Tidak Sesuai Yang Di Janjikan', '', '', '0.00%', '2022-03-10 15:47:27'),
(91, 'GAGAL CARING (CONTACTED)', 'Pindah Ke Kompetitor Non-Mobile', '', '1', '0.13%', '2022-03-10 15:47:27'),
(92, 'GAGAL CARING (CONTACTED)', 'Tidak Sempat Baya/ Sibuk/ Lupa', '', '', '0.00%', '2022-03-10 15:47:27'),
(93, 'GAGAL CARING (CONTACTED)', 'Pindah Rumah/ Selesai Kontrak', '13', '132', '16.50%', '2022-03-10 15:47:27'),
(94, 'GAGAL CARING (CONTACTED)', 'Kendala Keuangan/ Bangkrut', '6', '119', '14.88%', '2022-03-10 15:47:27'),
(95, 'GAGAL CARING (CONTACTED)', 'Tidak Tahu Tagihan/ Tidak Tahu Cara Bayar', '', '3', '0.38%', '2022-03-10 15:47:27'),
(96, 'GAGAL CARING (CONTACTED)', 'Jarang Dipakai', '8', '68', '8.50%', '2022-03-10 15:47:27'),
(97, 'GAGAL CARING (CONTACTED)', 'Pasang Tinggal/ Cabut Pasang', '', '12', '1.50%', '2022-03-10 15:47:27'),
(98, 'GAGAL CARING (CONTACTED)', 'Kemahalan', '', '3', '0.38%', '2022-03-10 15:47:27'),
(99, 'GAGAL CARING (CONTACTED)', 'Tarif Tidak Sesuai Janji', '', '', '0.00%', '2022-03-10 15:47:27'),
(100, 'GAGAL CARING (CONTACTED)', 'Sering Gangguan/ Gangguan Berulang', '', '8', '1.00%', '2022-03-10 15:47:27'),
(101, 'GAGAL CARING (CONTACTED)', 'Tidak Bisa Browsing', '', '', '0.00%', '2022-03-10 15:47:27'),
(102, 'GAGAL CARING (CONTACTED)', 'Tagihan Melonjak', '', '1', '0.13%', '2022-03-10 15:47:27'),
(103, 'GAGAL CARING (CONTACTED)', 'CAPS Muncul Tagihan', '1', '42', '5.25%', '2022-03-10 15:47:27'),
(104, 'GAGAL CARING (CONTACTED)', 'Sub Total', '62', '800', '100.00%', '2022-03-10 15:47:28');

-- --------------------------------------------------------

--
-- Table structure for table `rg_pic`
--

CREATE TABLE `rg_pic` (
  `id` int(11) NOT NULL,
  `regional` varchar(20) NOT NULL,
  `roc` int(20) NOT NULL,
  `cc` int(20) NOT NULL,
  `paycol` int(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rg_pic`
--

INSERT INTO `rg_pic` (`id`, `regional`, `roc`, `cc`, `paycol`, `created_time`) VALUES
(1, 'Regional 2', 100, 90, 60, '2022-03-09 19:43:43'),
(2, 'Regional 1', 25, 65, 10, '2022-03-09 19:43:43'),
(3, 'Regional 10', 53, 55, 10, '2022-03-09 19:43:43'),
(4, 'Regional 3', 50, 60, 30, '2022-03-09 19:43:43'),
(5, 'Regional 8', 15, 30, 37, '2022-03-09 19:43:43'),
(6, 'Regional 4', 80, 85, 75, '2022-03-09 19:43:43'),
(7, 'Regional 9', 33, 32, 5, '2022-03-09 19:43:43'),
(8, 'Regional 7', 13, 20, 27, '2022-03-09 19:43:43'),
(9, 'Regional 5', 92, 110, 100, '2022-03-09 19:43:43'),
(10, 'Regional 6', 35, 20, 10, '2022-03-09 19:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `rg_solving_status`
--

CREATE TABLE `rg_solving_status` (
  `id` int(20) NOT NULL,
  `regional` varchar(20) NOT NULL,
  `open` int(20) NOT NULL,
  `pending` int(20) NOT NULL,
  `closed` int(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rg_solving_status`
--

INSERT INTO `rg_solving_status` (`id`, `regional`, `open`, `pending`, `closed`, `created_time`) VALUES
(1, 'Regional 1', 30, 20, 50, '2022-03-09 19:43:43'),
(2, 'Regional 10', 50, 0, 35, '2022-03-09 19:43:43'),
(3, 'Regional 2', 80, 50, 120, '2022-03-09 19:43:43'),
(4, 'Regional 3', 30, 10, 100, '2022-03-09 19:43:43'),
(5, 'Regional 4', 30, 20, 50, '2022-03-09 19:43:43'),
(6, 'Regional 9', 5, 10, 25, '2022-03-09 19:43:43'),
(7, 'Regional 8', 20, 15, 55, '2022-03-09 19:43:43'),
(8, 'Regional 7', 10, 5, 45, '2022-03-09 19:43:43'),
(9, 'Regional 5', 95, 7, 200, '2022-03-09 19:43:43'),
(10, 'Regional 6', 25, 5, 35, '2022-03-09 19:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `role` enum('admin','obc') NOT NULL,
  `success_rate` varchar(20) DEFAULT NULL,
  `nik_portal` varchar(50) DEFAULT NULL,
  `id_tele` varchar(50) DEFAULT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `jabatan_kerja` varchar(50) DEFAULT NULL,
  `pic` varchar(20) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_id`, `fullname`, `email`, `password`, `role`, `success_rate`,`nik_portal`, `id_tele`, `lokasi`, `jabatan_kerja`, `pic`, `created_time`) VALUES
(1, 'adm001', 'admin', 'admin-chure@gmail.com', 'd8dde856c3e85c6ad2e08e9ce68abfe0559235acb2ae979701f25c83abbb75d1fc83b117859365c9366a57c5039ebc4026a9c8d9cb50e4c1fd6937eead7923350f69a6086fe732c383b37226f6bf232b3bcd44d81b52c260a97ec7f61c5e13e38777e1597c3d54da', 'admin', NULL, '1098888', 'adm777', null, null, null, '2022-03-06 18:24:28'),
(2, 'OC001', 'Albert Enstein', 'albert-chure@gmail.com', '898e9709eca22964d2abc8794f0f9dbd064f2167a10d2611e72296dd79b6302db61deebf1cc5a4561bc43a6d20f5ac10d17448cf6235cd147ee9a93492b61429fca46edb883c295a5aafe622da61091e17ee8935b8891128e0a0643a85dfbe499773f2433ec50235ae', 'obc', '95%', null, null, 'jakarta', 'pegawai', 'adm001', '2022-03-08 14:42:13'),
(3, 'OC002', 'Syifa Amalia', 'syifa-chure@gmail.com', 'f1de942e7ab0ed4e27cf587a150765c7dd7d03c5e80954f9dc48fc981f32f21ab97b66ac2e5c534705e822204f0c72c3c771c148c76cce19269a5a1c8b73d2ddb205f657a5cf5604625745256b54c781cf8b1be47fba2cf9a81644a884d7bd13f51e0ade65e5ae41', 'obc', '90%', null, null, 'jakarta', 'pegawai', 'adm001', '2022-03-08 14:44:15'),
(4, 'OC003', 'Pevita Pearce', 'pevita-chure@gmail.com', '4b6c0edb84a8bf73a16cb1eb3000169f0edcc5b062d88fb6653c0f7c4e244394d5fc6b5ff61c75a9a30e20c5f908d42ce3a5bc9baa26e85611ec646d046c095d79034d4ff8ec18863ad6166ea436a1e65d53b5bd4d71230629b32911819e83884e8c7d643b9be2cd85', 'obc', '80%', null, null, 'jakarta', 'pegawai', 'adm001', '2022-03-08 14:44:15'),
(5, 'OC004', 'Robert Downey', 'robert-chure@gmail.com', '8464c852327c9c731a71d47227f18ff5754001accde5d8f060dad1dc0c317ea0ef049a693a1303aeb1f434c37ba3d0a77af0485744909db7882d74cb237e4c8f65f59d305113646aaa233e474de8c01cd9349b6d69d10f26f7ff436eacb18807adb2efa54ae1e22cf3', 'obc', '80%', null, null, 'jakarta', 'pegawai', 'adm001', '2022-03-08 14:47:01'),
(6, 'OC005', 'Marion Jola', 'marion-chure@gmail.com', '48fea225e63694b1dc4fec6f089d49db327a2371e146af5cf210699f14543a1ced34c9cc6957ededcb52b977c390676ac2ab5417cf34aa9d4361c2a1d677f2b98cfffe9e8e0caa774f0c7f3907cb955975d6efa0ef7c47f0a35e1fad2b70424b15606a81c79bd57b70', 'obc', '95%', null, null, 'jakarta', 'pegawai', 'adm001', '2022-03-08 14:47:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caring_result`
--
ALTER TABLE `caring_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chure_performance`
--
ALTER TABLE `chure_performance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `churn_analytics`
--
ALTER TABLE `churn_analytics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_high_churn`
--
ALTER TABLE `customers_high_churn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obc_task`
--
ALTER TABLE `obc_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performance_diagram`
--
ALTER TABLE `performance_diagram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recent_caring_activity`
--
ALTER TABLE `recent_caring_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regional_table`
--
ALTER TABLE `regional_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports_pencairan`
--
ALTER TABLE `reports_pencairan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports_rekapitulasi_hasil_caring`
--
ALTER TABLE `reports_rekapitulasi_hasil_caring`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports_table1`
--
ALTER TABLE `reports_table1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rg_pic`
--
ALTER TABLE `rg_pic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rg_solving_status`
--
ALTER TABLE `rg_solving_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caring_result`
--
ALTER TABLE `caring_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chure_performance`
--
ALTER TABLE `chure_performance`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `churn_analytics`
--
ALTER TABLE `churn_analytics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers_high_churn`
--
ALTER TABLE `customers_high_churn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `obc_task`
--
ALTER TABLE `obc_task`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `performance_diagram`
--
ALTER TABLE `performance_diagram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `recent_caring_activity`
--
ALTER TABLE `recent_caring_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `regional_table`
--
ALTER TABLE `regional_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reports_pencairan`
--
ALTER TABLE `reports_pencairan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reports_rekapitulasi_hasil_caring`
--
ALTER TABLE `reports_rekapitulasi_hasil_caring`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reports_table1`
--
ALTER TABLE `reports_table1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `rg_pic`
--
ALTER TABLE `rg_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rg_solving_status`
--
ALTER TABLE `rg_solving_status`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
