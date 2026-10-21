-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2026 at 05:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` double NOT NULL COMMENT 'Latitude lokasi user saat absensi',
  `longitude` double NOT NULL COMMENT 'Longitude lokasi user saat absensi',
  `distance` double DEFAULT NULL COMMENT 'Jarak ke lokasi kantor (meter)',
  `face_confidence` double DEFAULT NULL COMMENT 'Confidence score face comparison (0-100)',
  `status` enum('Clock In','Clock Out','Di Luar Radius','Wajah Tidak Cocok','Gagal Verifikasi Wajah','Izin','pending') NOT NULL DEFAULT 'Clock In',
  `photo` varchar(255) DEFAULT NULL COMMENT 'Path relatif ke foto absensi',
  `notes` text DEFAULT NULL COMMENT 'Catatan admin untuk verifikasi atau alasan absensi',
  `location_id` int(11) DEFAULT NULL COMMENT 'Lokasi kantor/kampus yang digunakan saat absensi',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_logs`
--

INSERT INTO `attendance_logs` (`id`, `user_id`, `latitude`, `longitude`, `distance`, `face_confidence`, `status`, `photo`, `notes`, `location_id`, `created_at`) VALUES
(1, 6, 0, 0, 0, 100, 'Izin', NULL, NULL, NULL, '2026-09-30 10:19:17'),
(2, 6, 0, 0, 0, 100, 'Clock In', NULL, 'Manual approval oleh admin (Clock In)', NULL, '2026-09-30 10:19:18'),
(3, 7, -7.3250405, 112.7216884, 2.99, 100, 'Clock In', 'attendance/1790767846542-3c5ed532fe8917c3ca76a3e52b309f61.jpg', NULL, 1, '2026-09-30 11:30:47'),
(4, 7, -7.3250717, 112.7216933, 1.33, NULL, 'Clock Out', NULL, NULL, 1, '2026-09-30 11:31:01'),
(5, 7, 0, 0, 0, 100, 'Izin', NULL, NULL, NULL, '2026-09-30 11:34:04'),
(6, 3, -7.3251636, 112.7217146, 64693.5, NULL, 'Clock In', 'attendance/1790768564761-4d45e644ae738487bc0e51d931947641.jpg', 'Manual approval oleh admin (Clock In)', NULL, '2026-09-30 11:42:44'),
(7, 3, -7.3248621, 112.7218941, 32.6, 100, 'Clock In', 'attendance/1790768617611-c0ad130f1e5ae3cceff5bb3ea4d8e7b3.jpg', 'Manual approval oleh admin (Clock In)', 1, '2026-09-30 11:43:37'),
(8, 3, -7.325048, 112.721691, 2.29, 100, 'Clock In', 'attendance/1790921727528-f6972651caaf9809ed35ed2437123eed.jpg', NULL, 1, '2026-10-02 06:15:27'),
(9, 3, -7.3250482, 112.721691, 2.27, NULL, 'Clock Out', NULL, NULL, 1, '2026-10-02 06:19:47'),
(14, 5, -7.3250554, 112.7216879, 1.4, 100, 'Clock In', 'attendance/1790932981138-d62a2fb040e5931b6d67c724ebdc04fb.jpg', NULL, 1, '2026-10-02 09:23:01'),
(15, 5, -7.3250511, 112.7216979, 2.44, NULL, 'Clock Out', NULL, NULL, 1, '2026-10-02 09:23:17'),
(16, 5, 0, 0, 0, 100, 'Izin', NULL, NULL, NULL, '2026-10-02 09:26:34'),
(17, 3, -7.3250482, 112.721691, 2.27, 100, 'Clock In', 'attendance/1791193798717-e27ada8012feadd784d4bfed62dad92f.jpg', 'Manual approval oleh admin (Clock In)', 1, '2026-10-05 09:49:58'),
(18, 3, 0, 0, 0, 100, 'Clock In', NULL, 'Manual approval oleh admin (Clock In)', 1, '2026-10-05 16:59:00'),
(19, 3, 0, 0, 0, 100, 'Clock Out', NULL, NULL, NULL, '2026-09-30 16:59:00'),
(20, 3, 0, 0, 0, 100, 'Clock Out', NULL, NULL, 1, '2026-09-30 16:59:00'),
(21, 6, 0, 0, 0, 100, 'Clock Out', NULL, NULL, NULL, '2026-09-30 16:59:00'),
(22, 3, 0, 0, 0, 100, 'Clock Out', NULL, NULL, 1, '2026-10-05 16:59:00'),
(23, 3, 0, 0, 0, 100, 'Clock Out', NULL, NULL, 1, '2026-10-05 16:59:00'),
(24, 3, -7.3101667, 112.7251289, 1699.85, NULL, 'Di Luar Radius', 'attendance/1791385498383-8d1a8b42ae40cf94221407d0b9dd03b3.jpg', NULL, 1, '2026-10-07 15:04:58'),
(25, 3, -7.3101636, 112.7251326, 4.81, 94.8, 'Clock In', 'attendance/1791385550222-8c893926bb323489cd6ec7f80180e2b4.jpg', 'Manual approval oleh admin (Clock In)', 6, '2026-10-07 15:05:50'),
(26, 3, 0, 0, 0, 100, 'Clock Out', NULL, NULL, 6, '2026-10-07 16:59:00'),
(27, 8, -7.325048, 112.721691, 2.29, 58.75, 'Clock In', 'attendance/1791433071027-04986aed6dcc9d92870226323229cd93.jpg', NULL, 1, '2026-10-08 04:17:54'),
(29, 12, -7.3250437, 112.7217036, 3.47, 57.81, 'Clock In', 'attendance/1791433326345-f032918500271b262266e1d417740cdb.jpg', NULL, 1, '2026-10-08 04:22:07'),
(33, 10, 0, 0, 0, 100, 'Izin', NULL, NULL, NULL, '2026-10-08 06:48:05'),
(34, 13, 0, 0, 0, 100, 'Izin', NULL, NULL, NULL, '2026-10-08 07:56:12'),
(35, 3, -7.3250347, 112.7216859, 3.58, 49.39, 'Clock In', 'attendance/1791446802557-8bc42b5d3c8e65048d3301aaeee12119.jpg', NULL, 1, '2026-10-08 08:06:45'),
(36, 9, -7.3250284, 112.7216812, 4.26, 13.2, 'Wajah Tidak Cocok', 'attendance/1791450551548-34d4298195d5f7c004bdb5ebb3731a6c.jpg', 'Manual approval oleh admin (Wajah Tidak Cocok)', 1, '2026-10-08 09:09:13'),
(37, 8, 0, 0, 0, 100, 'Clock Out', NULL, NULL, 1, '2026-10-08 16:59:00'),
(38, 12, 0, 0, 0, 100, 'Clock Out', NULL, NULL, 1, '2026-10-08 16:59:00'),
(39, 3, 0, 0, 0, 100, 'Clock Out', NULL, NULL, 1, '2026-10-08 16:59:00'),
(40, 7, -7.3250228, 112.721678, 4.91, 10.91, 'Wajah Tidak Cocok', 'attendance/1791884920883-302d229b67f544123f4a916969728378.jpg', 'Manual approval oleh admin (Wajah Tidak Cocok)', 1, '2026-10-13 09:48:43');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image_url` varchar(500) NOT NULL,
  `category` enum('galeri','about') NOT NULL DEFAULT 'galeri',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `title`, `image_url`, `category`, `created_at`) VALUES
(12, 'Struktur Organisasi POCA EJBN', '/gallery/img_1792056996945-301015650.jpeg', 'about', '2026-10-15 16:36:37'),
(16, 'Hasil Miniatur Tower', '/gallery/img_1792058494206-810930450.jpeg', 'galeri', '2026-10-15 17:01:34'),
(17, 'Proses Pengecatan Miniatur Tower', '/gallery/img_1792058516659-753924284.jpeg', 'galeri', '2026-10-15 17:01:56'),
(18, 'Proses Pengecatan Miniatur Tower', '/gallery/img_1792058525100-804133149.jpeg', 'galeri', '2026-10-15 17:02:05'),
(19, 'Pembuatan Cat untuk mengecat Miniatur Tower', '/gallery/img_1792058582422-781404587.jpeg', 'galeri', '2026-10-15 17:03:02'),
(20, 'Proses Pembuatan Miniatur Tower', '/gallery/img_1792058633834-216922426.jpeg', 'galeri', '2026-10-15 17:03:53'),
(21, 'Proses Pembuatan Miniatur Tower', '/gallery/img_1792058654640-276973453.jpeg', 'galeri', '2026-10-15 17:04:14'),
(22, 'Proses Pembuatan Miniatur Tower', '/gallery/img_1792058661696-925251915.jpeg', 'galeri', '2026-10-15 17:04:21'),
(23, 'Proses Pembuatan Miniatur Tower', '/gallery/img_1792058669430-982028641.jpeg', 'galeri', '2026-10-15 17:04:29'),
(24, 'Proses Pembuatan Miniatur Tower', '/gallery/img_1792058688288-455147432.jpeg', 'galeri', '2026-10-15 17:04:48'),
(25, 'Proses Pembuatan Miniatur Tower', '/gallery/img_1792058696363-299174042.jpeg', 'galeri', '2026-10-15 17:04:56'),
(26, 'Mulai Pembuatan Miniatur Tower', '/gallery/img_1792058715113-132703197.jpeg', 'galeri', '2026-10-15 17:05:15'),
(27, 'Merancang Pembuatan Miniatur Tower', '/gallery/img_1792058734798-454057944.jpeg', 'galeri', '2026-10-15 17:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `reason`, `description`, `attachment`, `status`, `reviewed_by`, `reviewed_at`, `created_at`, `updated_at`) VALUES
(1, 6, 'bsbavs', 'avaban', 'uploads/leaves/leave_1790761614558-124384288.jpg', 'rejected', 2, '2026-09-30 17:19:20', '2026-09-30 16:46:54', '2026-09-30 17:19:20'),
(2, 6, 'faiq bakekok', 'sakit', 'uploads/leaves/leave_1790761676517-465058866.jpg', 'approved', 2, '2026-09-30 17:19:17', '2026-09-30 16:47:56', '2026-09-30 17:19:17'),
(3, 6, 'gghh', 'bbb', 'uploads/leaves/leave_1790762084031-672904807.jpg', 'rejected', 2, '2026-09-30 17:19:16', '2026-09-30 16:54:44', '2026-09-30 17:19:16'),
(4, 6, 'vxuecbu', 'vizeizbe', 'uploads/leaves/leave_1790763448453-517751195.jpg', 'rejected', 2, '2026-09-30 17:19:14', '2026-09-30 17:17:28', '2026-09-30 17:19:14'),
(5, 6, 'roy', 'sakit', 'uploads/leaves/leave_1790763525504-420982468.jpg', 'approved', 2, '2026-09-30 17:19:18', '2026-09-30 17:18:45', '2026-09-30 17:19:18'),
(6, 7, 'sakit', 'demam', 'uploads/leaves/leave_1790767895914-303208982.jpg', 'approved', 2, '2026-09-30 18:34:04', '2026-09-30 18:31:35', '2026-09-30 18:34:04'),
(7, 3, 'sakit', 'maag', 'uploads/leaves/leave_1790767988675-233691286.jpg', 'rejected', 2, '2026-09-30 18:34:12', '2026-09-30 18:33:08', '2026-09-30 18:34:12'),
(8, 3, 'sakit', 'meriang', 'uploads/leaves/leave_1790768827535-910563782.jpg', 'rejected', 2, '2026-10-02 16:26:41', '2026-09-30 18:47:07', '2026-10-02 16:26:41'),
(9, 5, 'Main valo sampe Radiant', 'mau pusrenk apa itu kerja', 'uploads/leaves/leave_1790933052770-675726000.jpg', 'approved', 2, '2026-10-02 16:26:34', '2026-10-02 16:24:12', '2026-10-02 16:26:34'),
(10, 5, 'dapa', 'sakit', 'uploads/leaves/leave_1790933097173-347380836.jpg', 'rejected', 2, '2026-10-02 16:26:28', '2026-10-02 16:24:57', '2026-10-02 16:26:28'),
(11, 5, 'balokl', 'visuan', 'uploads/leaves/leave_1791193872548-98631776.jpg', 'pending', NULL, NULL, '2026-10-05 16:51:12', '2026-10-05 16:52:31'),
(12, 5, 'sakit', 'sakit perut', 'uploads/leaves/leave_1791390962646-855709142.jpg', 'pending', NULL, NULL, '2026-10-07 23:36:02', '2026-10-07 23:36:20'),
(13, 6, 'sakit', 'mencret', 'uploads/leaves/leave_1791391102706-499078257.jpg', 'pending', NULL, NULL, '2026-10-07 23:37:55', '2026-10-07 23:38:22'),
(14, 10, 'sakit', NULL, NULL, 'pending', NULL, NULL, '2026-10-07 23:40:02', '2026-10-07 23:40:02'),
(15, 8, 'h', NULL, 'uploads/leaves/leave_1791391324464-122035710.jpg', 'pending', NULL, NULL, '2026-10-07 23:42:04', '2026-10-07 23:42:23'),
(16, 7, 'gss', NULL, NULL, 'pending', NULL, NULL, '2026-10-07 23:45:13', '2026-10-07 23:45:13'),
(17, 11, 'dbdb', NULL, NULL, 'pending', NULL, NULL, '2026-10-07 23:45:36', '2026-10-07 23:45:36'),
(18, 11, 'sbsbs', NULL, 'uploads/leaves/leave_1791397036635-89565961.jpg', 'pending', NULL, NULL, '2026-10-08 01:17:16', '2026-10-08 01:17:16'),
(21, 4, 'acara', 'sound horeg', 'uploads/leaves/leave_1791440590778-540032985.jpg', 'rejected', 2, '2026-10-08 13:23:36', '2026-10-08 13:23:10', '2026-10-08 13:23:36'),
(22, 10, 'qavba', 'avab', 'uploads/leaves/leave_1791442075924-757560951.jpg', 'approved', 2, '2026-10-08 13:48:05', '2026-10-08 13:47:55', '2026-10-08 13:48:05'),
(23, 13, 'izin', 'main coc', 'uploads/leaves/leave_1791442335587-485244062.jpg', 'approved', 2, '2026-10-08 14:56:12', '2026-10-08 13:52:15', '2026-10-08 14:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Nama lokasi (misal: Kantor Pusat, Kampus A)',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `radius` int(11) DEFAULT 100 COMMENT 'Radius geofencing dalam meter',
  `is_active` tinyint(1) DEFAULT 1 COMMENT '1 = aktif, 0 = nonaktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `latitude`, `longitude`, `radius`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Kantor Pusat', -7.325066726186988, 112.72168235271651, 50, 1, '2026-09-24 04:56:31', '2026-10-06 08:32:34'),
(3, 'antek', -7.213123123, 112.31231231, 112, 1, '2026-10-06 08:16:11', '2026-10-06 08:32:34'),
(4, 'catur', -7.777777, 111.11111111, 77, 1, '2026-10-06 08:17:40', '2026-10-06 08:17:40'),
(5, 'cangkem', -7.654321, 123.4567, 123, 1, '2026-10-06 08:34:29', '2026-10-06 08:34:29'),
(6, 'kost pens', -7.310159, 112.725176, 100, 1, '2026-10-07 15:05:38', '2026-10-07 15:05:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nip` varchar(50) NOT NULL COMMENT 'Nomor Induk Pegawai/Mahasiswa',
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `divisi` varchar(100) DEFAULT NULL,
  `face_photo` varchar(255) DEFAULT NULL COMMENT 'Path relatif ke foto master wajah',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `nip`, `password`, `role`, `divisi`, `face_photo`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@absensi.com', 'ADMIN001', '$2a$12$DxxwPtsPrLc85XHBxQiFWeBdq2b538RJM/Zp3KNy63ILV62SxSq9m', 'admin', NULL, NULL, '2026-09-24 04:56:31', '2026-09-24 08:09:21'),
(2, 'Nama Admin Baru', 'adminbaru@absensi.com', 'ADMIN002', '$2a$12$HKKq5VTESkW7/mcaTs7TMO5uoTX5l30cMiSQ2yjgqGCEf5/YcPhZW', 'admin', NULL, NULL, '2026-09-24 08:21:18', '2026-09-24 08:25:23'),
(3, 'catur', 'catur@gmail.com', '13213123', '$2a$12$jLSSBxbnGGFgXCfnFLUMJuRUfmNVD1iEZvMlXl5oVf.MUMOdTiofq', 'user', NULL, 'uploads/faces/1791795305706-7040b5e8feec9fb70c27380f0e561906.jpg', '2026-09-25 02:52:36', '2026-10-12 08:55:05'),
(4, 'hidup jokowi', 'owi', '23123', '$2a$12$EfQiiBXOk1Q1fsoEp7J8HOHfeJGxLqdanZNKdvIhrhOnwT8/C/5O6', 'user', NULL, 'faces/1790588975777-d62091053a142589507243e2b9fa94a6.jpg', '2026-09-28 09:49:36', '2026-09-28 09:49:36'),
(5, 'roy', 'roy', '123123', '$2a$12$JtKCrP0vlSeNykVFuzezw.4d2DlhHKztDMo4dY37BrfaftLasfuoa', 'user', NULL, 'faces/1790589102423-03acbd709cf7a20b535b6a89c79c4d0c.jpg', '2026-09-28 09:51:42', '2026-09-28 09:51:42'),
(6, 'sikin', 'zikin', '1321312312', '$2a$12$vc38esiLzJ3DF/SAx6zX3OvWOKDR57YONIrC2sNKQVjoQgSsqLodK', 'user', NULL, 'uploads/faces/1790761200210-14852cdf8303d2ec7cf32cc9b9c4aacb.jpg', '2026-09-30 09:40:00', '2026-09-30 09:40:00'),
(7, 'muhammad jevon', 'jevon', '12312312', '$2a$12$pF1d9b6maGhoV/No0p0ZruhhxbFlRiuEhazBcea1txTgHU4b0AVUG', 'user', NULL, 'uploads/faces/1790767780578-54eeae6fbe27bb4d7356a91e46f39165.jpg', '2026-09-30 11:29:41', '2026-09-30 11:29:41'),
(8, 'catur HR', 'caturhr', '2312312', '$2a$12$MWvPAZcpODheT0Kx3ZNfIe7o7s1LBmaA/WOWK5.ZhD7I3rt54pkeK', 'user', NULL, 'uploads/faces/1790768270761-42a2024ddc8b1bb4560cdc9f3a0d606d.jpg', '2026-09-30 11:37:51', '2026-09-30 11:37:51'),
(9, 'caturr', 'caturr', '231234', '$2a$12$cDFoQGDTkQjXqr3FMMARm.41yndraYCym9D5hNbZIxyDV9Ztg1lii', 'user', 'it', 'uploads/faces/1790933751565-2c7d61194753e87c605dd4869dbe0b6e.jpg', '2026-10-02 09:35:51', '2026-10-02 09:35:51'),
(10, 'cangkeman', 'cang', '132131235', '$2a$12$wRecIGOlc8.2w4YmH.Qglu1kJWkAaNi9WBH/HuDYHXz/uy2qBnQJm', 'user', NULL, 'uploads/faces/1791172013022-a0363c91320868c70b3167adc7e946fb.jpg', '2026-10-05 03:46:53', '2026-10-05 03:46:53'),
(11, 'saya akan lawan', 'saya', '231236', '$2a$12$dcpnhS0pIf1eep2qjcPmsO1WZ/j0bUgRElhVd9Orc84NndpDDrn7G', 'user', NULL, 'uploads/faces/1791172981262-f7cc9ddea1f697ab003144a287931c89.jpg', '2026-10-05 04:03:01', '2026-10-05 04:03:01'),
(12, 'antek', 'antek', '13213123123', '$2a$12$qHCDT88Uu.nmWFWL7nwzd.ztmeTHybZxFkwdwiOfNrWgMxYFl3FZ6', 'user', 'dokumen', 'uploads/faces/1791177225804-589d06c0ede84a84a8d1e43fcc682505.jpg', '2026-10-05 05:13:46', '2026-10-05 05:13:46'),
(13, 'faiq muntahsir', 'faiq', '2312323', '$2a$12$E8/KtmwamuplO45MLbXbpuNN0cM7yO4GmafIGq4QquycjhP0gtZHW', 'user', 'covant', 'uploads/faces/1791442232210-ec71565ab639c751911dc1f057886db2.jpg', '2026-10-08 06:50:32', '2026-10-08 06:50:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_user_date` (`user_id`,`created_at`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `reviewed_by` (`reviewed_by`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_active` (`is_active`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_nip` (`nip`),
  ADD KEY `idx_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_logs_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_requests_ibfk_2` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
