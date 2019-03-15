-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2019 at 05:38 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `isbn` varchar(8) NOT NULL,
  `title` varchar(50) NOT NULL,
  `writer` varchar(40) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`isbn`, `title`, `writer`, `description`) VALUES
('20170920', 'Keluarga Tak Kasat Mata UPDATE', 'Genta', 'sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text.\\r\\n\\r\\nsample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text'),
('20170921', 'Spiderman naik haji', 'Nuris Akbar', 'sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text.\r\n\r\nsample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text sample text.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'TEKNIK INFORMATIKA'),
(2, 'REKAMEDIS');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `id_jurusan`, `alamat`) VALUES
('f13323224', 'Jution dedy', 12, ''),
('s333', 'bambang', 33, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `master`
--
CREATE TABLE `master` (
`nama` varchar(50)
,`nim` varchar(10)
,`alamat` text
,`nama_jurusan` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(225) NOT NULL,
  `lv_user` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `lv_user`) VALUES
(1, 'erwan', 'erwan@polinela.ac.id', '21232f297a57a5a743894a0e4a801fc3', 3),
(2, 'Aurilia vica', 'aurilia@polinela.ac.id', '21232f297a57a5a743894a0e4a801fc3', 1),
(3, 'Dedy Indra', 'dedy@polinela.ac.id', '21232f297a57a5a743894a0e4a801fc3', 1),
(50, 'erwan', 'erwa1n@polinela.ac.id', 'admin', 2),
(54, 'daffaaffa', 'daffa@gmail.com', '2293d3abd6eeae8e42ba0418e4ef49e2', 2),
(55, 'dddd', 'anjaqq1617s@gmail.com', 'a6b06424c99be5083c96047db618c576', 2),
(56, 'dddddhd', 'anjat7s@gmail.com', 'b98d349884383a7fffd98072a39abf69', 2),
(57, 'fgjhkjakd', 'eko@polinela.ac.id', 'aa5a00855982d328b1309c246bb9b6e7', 2);

-- --------------------------------------------------------

--
-- Structure for view `master`
--
DROP TABLE IF EXISTS `master`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `master`  AS  select `a`.`nama` AS `nama`,`a`.`nim` AS `nim`,`a`.`alamat` AS `alamat`,`b`.`nama_jurusan` AS `nama_jurusan` from (`mahasiswa` `a` join `jurusan` `b`) where (`a`.`id_jurusan` = `b`.`id_jurusan`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`isbn`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
