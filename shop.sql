-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 06 Mar 2022, 17:22
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `basket`
--

CREATE TABLE `basket` (
  `id_basket` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `basket`
--

INSERT INTO `basket` (`id_basket`, `id_user`, `id_product`, `date_add`) VALUES
(1, 1, 1, '2022-02-27 11:25:01'),
(2, 5, 5, '2022-02-27 15:17:31'),
(3, 4, 3, '2022-02-27 15:17:31'),
(4, 5, 4, '2022-02-27 15:43:45'),
(5, 3, 5, '2022-02-27 15:43:45');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id_pruduct` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL,
  `descriptions` varchar(600) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `price` float NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id_pruduct`, `name`, `descriptions`, `price`, `date_add`) VALUES
(1, 'Televizor LG2000', NULL, 32.99, '2022-01-27 10:17:55'),
(2, 'Panasonic Telewizor 2020', NULL, 99.97, '2022-02-27 14:17:54'),
(3, 'Xiaomi MI 5', 'Telewizor Kolorowy', 59.89, '2022-02-27 14:18:22'),
(4, 'Sojus 1000 ', NULL, 29.01, '2022-02-27 14:19:01'),
(5, 'Sony Bravia', NULL, 109.99, '2022-01-09 14:19:36'),
(6, 'Apple TV', NULL, 199.99, '2022-02-27 14:19:55'),
(7, 'Drukarka HP TW600', NULL, 9.99, '2021-12-27 14:20:28');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `suppliers`
--

CREATE TABLE `suppliers` (
  `id_supplier` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `supplier_name` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `e_mail` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `suppliers`
--

INSERT INTO `suppliers` (`id_supplier`, `id_product`, `supplier_name`, `phone_number`, `e_mail`) VALUES
(1, 6, 'Apple', '1–800–854–3680.', 'apple@apple.com'),
(2, 7, 'HP', '1–800–854–3680.', 'hp@hp.pl'),
(3, 2, 'Panasonic', '+58PANASONIC', 'info@panasonic.fi'),
(4, 4, 'Sojus', '+98234890', 'priwiet@sojus.ru'),
(5, 1, 'LG', '+0010293843920', 'lg@lg.ko'),
(6, 5, 'Sony', '+2324030349', 'noreply@sony.com'),
(7, 3, 'Xiaomi', '+039483920', 'cnjinping@xiaomi.cn');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `pass` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `surname` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `first_name` varchar(11) COLLATE utf8mb4_polish_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `login`, `pass`, `surname`, `first_name`, `email`) VALUES
(1, 'msokolowski666', 'eff3229a924bc4a98632e9ac1d17d420c10ddda7', 'Sokolowski', 'Mariusz', 'm@sokolowski.pl'),
(2, 'jkowalski', 'ff12bbd8c907af067070211d87bdf098be17375b', 'Kowalski', 'Jan', 'janek@wp.pl'),
(3, 'anna', 'c086257ceae57569feb148daaecc511083063a87', 'Nowak', 'Anna', 'anowak@wp.pl'),
(4, 'Paweł', 'f3df0d4e156eba43e81f29914d2b2e944fdea59a', 'Pawłowski', 'Paweł', 'pp@pp.pl'),
(5, 'jerzyk123', '9b776d945035e2c9d7354e009385c42c1410fce4', 'Jerzyna', 'Krzysztof', 'kszysiekj@kjjs.pl');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id_basket`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_pruduct`);

--
-- Indeksy dla tabeli `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id_supplier`),
  ADD KEY `id_product` (`id_product`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `basket`
--
ALTER TABLE `basket`
  MODIFY `id_basket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id_pruduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_pruduct`);

--
-- Ograniczenia dla tabeli `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_pruduct`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
