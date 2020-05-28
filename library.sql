-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 27 Maj 2020, 19:36
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `library`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autorzy`
--

CREATE TABLE `autorzy` (
  `id_autor` int(11) NOT NULL,
  `Imię` text NOT NULL,
  `Nazwisko` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `autorzy`
--

INSERT INTO `autorzy` (`id_autor`, `Imię`, `Nazwisko`) VALUES
(1, 'Agnieszka', 'Stelmaszyk'),
(2, 'J.K.', 'Rowling'),
(3, 'J.R.R.', 'Tolkien');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tytuły`
--

CREATE TABLE `tytuły` (
  `id_tytul` int(11) NOT NULL,
  `tytul` text NOT NULL,
  `ISBN` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `tytuły`
--

INSERT INTO `tytuły` (`id_tytul`, `tytul`, `ISBN`) VALUES
(1, 'The Hobbit', 9780007525508),
(2, 'Tajemnica klejnotu Nefertiti', 9788376238890),
(3, 'Harry Potter i Zakon Feniksa', 9788867155996);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `x`
--

CREATE TABLE `x` (
  `id_autor` int(11) NOT NULL,
  `id_tytul` int(11) NOT NULL,
  `id_x` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `x`
--

INSERT INTO `x` (`id_autor`, `id_tytul`, `id_x`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 1, 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indeksy dla tabeli `tytuły`
--
ALTER TABLE `tytuły`
  ADD PRIMARY KEY (`id_tytul`);

--
-- Indeksy dla tabeli `x`
--
ALTER TABLE `x`
  ADD PRIMARY KEY (`id_x`),
  ADD KEY `klucz_tytuly` (`id_tytul`) USING BTREE,
  ADD KEY `klucz_autorzy` (`id_autor`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `tytuły`
--
ALTER TABLE `tytuły`
  MODIFY `id_tytul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `x`
--
ALTER TABLE `x`
  MODIFY `id_x` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `x`
--
ALTER TABLE `x`
  ADD CONSTRAINT `autorzy` FOREIGN KEY (`id_autor`) REFERENCES `autorzy` (`id_autor`),
  ADD CONSTRAINT `tytuly` FOREIGN KEY (`id_tytul`) REFERENCES `tytuły` (`id_tytul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
