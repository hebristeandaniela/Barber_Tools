-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: iun. 17, 2024 la 01:30 AM
-- Versiune server: 10.4.32-MariaDB
-- Versiune PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `craft_db`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image_path`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'ROVRA', 'Rovra a devenit un nume de referință în industria frizeriei datorită angajamentului său pentru inovație și excelență. Produsele Rovra sunt concepute pentru a satisface nevoile profesioniștilor din domeniu, oferind performanță, confort și fiabilitate.', 'uploads/brands/ROVRA.jpg', 1, 0, '2024-05-17 10:55:02'),
(2, 'GAMMA+', 'Gamma+ este un brand italian bine cunoscut în industria frizeriei și coafurii, apreciat pentru inovațiile sale și calitatea produselor. Fondat în 1987, Gamma+ a câștigat rapid recunoaștere pentru echipamentele profesionale de styling, inclusiv uscătoare de păr, mașini de tuns, mașini de ras și alte accesorii esențiale pentru saloanele de frizerie.', 'uploads/brands/GAMMA+.jpg', 1, 0, '2024-05-17 10:57:41'),
(3, 'JRL', 'JRL este un brand de renume în industria frizeriei, cunoscut pentru inovația și calitatea superioară a produselor sale. De la mașini de tuns și de ras până la accesorii esențiale pentru îngrijirea părului, JRL se angajează să ofere instrumente de top care să îmbunătățească experiența profesională a stiliștilor și frizerilor din întreaga lume.', 'uploads/brands/JRL.jpg', 1, 0, '2024-05-17 10:59:32'),
(4, 'VERO', 'Vero este un brand cunoscut în industria frizeriei, specializat în producția de echipamente și accesorii profesionale pentru tuns și coafură. Produsele Vero sunt recunoscute pentru calitatea lor superioară, durabilitate și performanță excelentă. ', 'uploads/brands/VERO.png', 1, 0, '2024-05-17 11:00:18'),
(5, 'BABYLISS ', 'BaByliss oferă o gamă largă de produse profesionale, inclusiv uscătoare de păr, plăci de întins părul, ondulatoare și mașini de tuns.', 'uploads/brands/BABYLISS.jpg', 1, 0, '2024-05-17 11:01:12'),
(6, 'STYLECRAFT ', 'Brandul Stylecraft este recunoscut în industria frizeriei pentru inovație și calitate superioară. Cu o gamă diversă de produse, de la mașini de tuns și uscătoare de păr până la accesorii și produse de îngrijire a părului, Stylecraft oferă soluții profesionale pentru stiliști și clienții lor. ', 'uploads/brands/STYLECRAFT.jpg', 1, 0, '2024-05-17 11:01:49'),
(7, 'NISH MAN', 'NISH MAN reprezintă o marcă de încredere în industria produselor de îngrijire personală pentru bărbați. Cunoscută pentru aromele sale rafinate și produsele de calitate superioară, NISH MAN oferă o gamă variată de produse, de la colonii și aftershave-uri la produse pentru îngrijirea părului și a pielii.', 'uploads/brands/NISH.png', 1, 0, '2024-06-04 00:50:58');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(13, 3, 4, 250, 1, '2024-04-08 23:55:49'),
(16, 4, 4, 250, 1, '2024-05-08 17:08:38'),
(17, 2, 4, 250, 3, '2024-06-01 18:53:36');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Mașini de tuns', 'Mașinile de tuns reprezintă un instrument esențial în arsenalul oricărui frizer sau stilist. Acestea sunt proiectate pentru a tunde părul rapid și eficient, oferind precizie și confort în utilizare. Mașinile de tuns sunt disponibile într-o varietate de modele și specificații, adaptate atât pentru uz profesional cât și pentru uz casnic', 1, 0, '2024-05-17 11:27:11'),
(2, 'Foarfecă de tuns', 'Foarfeca pentru frizerie este un instrument esențial în arsenalul oricărui frizer sau stilist profesionist. Cu un design minimalist și o construcție robustă, această foarfecă este indispensabilă în efectuarea tunsorilor de calitate și în realizarea unor coafuri precise.', 1, 0, '2024-05-17 11:27:24'),
(3, 'Uscător de păr', 'Uscătorul de păr este un instrument esențial în orice salon de frizerie, oferind o metodă rapidă și eficientă pentru uscarea și stilizarea părului. Cu tehnologii avansate și funcționalități variate, acest dispozitiv este indispensabil în realizarea unor coafuri impecabile și în obținerea unor rezultate profesionale.', 1, 0, '2024-02-17 11:27:45'),
(4, 'Mașină de ras', 'Mașina de ras este un instrument esențial în arsenalul oricărui frizer profesionist, oferind o modalitate rapidă și precisă de a tunde și de a finisa părul facial. Cu tehnologii avansate și design ergonomic, această unealtă este indispensabilă în obținerea unor rezultate impecabile și în crearea unor coafuri masculine perfecte.', 1, 0, '2024-02-17 11:27:55'),
(10, 'Accesorii', 'Accesoriile pentru frizerie sunt elemente esențiale care completează echipamentele de bază ale oricărui frizer profesionist sau salon de frizerie. Acestea includ o varietate de produse care facilitează procesul de tuns, stilizat și îngrijire a părului, contribuind la confortul și satisfacția clienților.', 1, 0, '2024-02-17 11:31:18');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `status`, `delete_flag`, `date_created`) VALUES
(2, 'Iacob', 'Rahela', 'Female', '0752345678', 'rahela12@gmail.com', '45bff2a14658fc9b21c6e5e9bf75186b', 'Bihor, comuna Popești, Varviz, nr 29', 1, 0, '2024-02-17 14:24:00'),
(3, 'Nagy', 'Doina', 'Female', '0752332236', 'nagydoina@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'Bihor, Oradea, strada Garoafelor, nr 11', 1, 0, '2024-04-08 23:53:28'),
(4, 'Ardelean', 'Ioana', 'Female', '0745454532', 'ioana99@gmail.com', 'f65bf30f0f133b311ae8710c9ea088cd', 'Bihor, Comuna Popești, sat Varviz, strada principală, nr 59', 1, 0, '2024-05-03 01:39:34'),
(5, 'Cost', 'Daniel', 'Male', '0748276542', 'danicost15@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Bihor, Oradea, Strada Universitatii, nr. 8', 1, 0, '2024-06-01 20:19:03');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `variant` text NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `inventory`
--

INSERT INTO `inventory` (`id`, `variant`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(4, '', 3, 25, 500, '2024-05-17 13:22:54', '2024-06-16 22:23:27'),
(7, '', 5, 112, 66, '2024-06-01 19:33:17', '2024-06-16 22:23:21'),
(8, '', 6, 46, 478, '2024-06-01 22:01:28', NULL),
(9, '', 7, 38, 300, '2024-06-01 22:02:05', NULL),
(10, '', 8, 29, 400, '2024-06-01 23:41:26', NULL),
(11, '', 9, 17, 692, '2024-06-02 18:53:32', NULL),
(12, '', 10, 44, 999, '2024-06-02 18:59:41', '2024-06-03 22:04:37'),
(13, '', 11, 29, 510, '2024-06-02 19:04:27', NULL),
(14, '', 12, 87, 120, '2024-06-02 19:14:30', NULL),
(15, '', 13, 64, 600, '2024-06-02 19:20:26', NULL),
(16, '', 14, 156, 58, '2024-06-03 21:36:51', NULL),
(17, '', 15, 74, 882, '2024-06-03 21:43:42', NULL),
(18, '', 16, 59, 999, '2024-06-03 21:57:46', '2024-06-03 22:04:26'),
(19, '', 17, 258, 120, '2024-06-03 22:13:56', NULL),
(20, '', 18, 376, 60, '2024-06-03 22:16:02', NULL),
(21, '', 19, 154, 55, '2024-06-03 23:53:07', NULL),
(22, '', 20, 28, 999, '2024-06-04 00:06:59', NULL),
(23, '', 21, 14, 549, '2024-06-04 00:11:30', '2024-06-04 00:12:57'),
(24, '', 22, 54, 500, '2024-06-04 00:19:52', NULL),
(25, '', 23, 29, 160, '2024-06-04 00:23:59', NULL),
(26, '', 24, 37, 752, '2024-06-04 00:35:02', NULL),
(27, '', 25, 63, 302, '2024-06-04 00:40:45', NULL),
(28, '', 26, 72, 825, '2024-06-04 00:44:31', NULL),
(29, '', 27, 474, 15, '2024-06-04 00:54:22', NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = pending,\r\n1= Packed,\r\n2 = Out for Delivery,\r\n3=Delivered,\r\n4=cancelled',
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `orders`
--

INSERT INTO `orders` (`id`, `ref_code`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(12, '20240600004', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 2066, 0, 0, '2024-06-05 01:56:09', NULL),
(13, '20240600005', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 0, 0, 0, '2024-06-05 02:36:32', NULL),
(14, '20240600006', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 0, 0, 0, '2024-06-05 02:40:20', NULL),
(15, '20240600007', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 882, 0, 0, '2024-06-05 02:40:35', NULL),
(16, '20240600008', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 1998, 0, 0, '2024-06-12 23:07:51', NULL),
(17, '20240600009', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 500, 0, 0, '2024-06-14 13:17:09', NULL),
(18, '20240600010', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 1000, 0, 0, '2024-06-14 13:17:22', NULL),
(19, '20240600011', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 1000, 0, 0, '2024-06-14 13:19:02', NULL),
(20, '20240600012', 5, 'Oradea, Strada Universitatii, nr. 81', 'cash', 0, 1692, 0, 0, '2024-06-14 13:21:24', NULL),
(21, '20240600013', 5, 'Oradea, Strada Universitatii, nr. 81', 'cash', 0, 1692, 0, 0, '2024-06-14 13:21:36', NULL),
(22, '20240600014', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 1692, 0, 0, '2024-06-14 13:23:35', NULL),
(23, '20240600015', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 1692, 0, 0, '2024-06-14 13:34:23', NULL),
(24, '20240600016', 5, 'Strada Universitatii, nr. 8', 'cash', 0, 1692, 0, 0, '2024-06-14 13:38:59', NULL),
(25, '20240600017', 5, 'Varviz, Strada Principala, nr. 8', 'cash', 0, 60, 0, 0, '2024-06-14 13:39:27', NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Inserarea datelor in tabel `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `inventory_id`, `quantity`, `price`, `total`) VALUES
(10, 8, 4, 2, 350, 700),
(14, 11, 21, 3, 549, 1647),
(15, 12, 15, 2, 882, 1764),
(16, 12, 25, 1, 302, 302),
(17, 15, 15, 1, 882, 882),
(18, 16, 16, 2, 999, 1998),
(30, 24, 4, 2, 500, 1000),
(31, 24, 11, 1, 692, 692),
(32, 25, 20, 1, 60, 60);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `name`, `specs`, `status`, `delete_flag`, `date_created`) VALUES
(3, 1, 1, 'Mașina de tuns ', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;\r\nROVRA X-CLIP este mașina de tuns profesională de ultimă generație, destinată frizerilor și stiliștilor care își doresc performanțe de neegalat și eficiență maximă în activitatea zilnică. Cu o combinație de tehnologii avansate, design ergonomic și autonomie impresionantă, ROVRA X-CLIP redefineste standardele echipamentelor de frizerie.\r\n&lt;/p&gt;\r\nROVRA X-CLIP impresionează prin tehnologia sa de vârf, integrând un motor puternic și silențios. Acest motor nu doar că facilitează o tăiere rapidă și precisă, ci și menține un nivel de zgomot redus, oferind astfel o experiență confortabilă atât pentru frizer, cât și pentru client. Indiferent de tipul de păr sau de stilul dorit, mașina de tuns ROVRA X-CLIP garantează o performanță superioară, realizând tunsori netede și uniforme.\r\n&lt;/p&gt;\r\nAutonomia de 3 ore a bateriei este un alt aspect remarcabil al mașinii de tuns ROVRA X-CLIP. Această caracteristică permite utilizarea continuă a dispozitivului fără necesitatea reîncărcărilor frecvente, fiind ideală pentru saloane aglomerate și sesiuni de tuns prelungite. Bateria de lungă durată nu doar că economisește timp, dar și asigură fiabilitatea echipamentului pe parcursul întregii zile de lucru.\r\nPerformanța de tăiere a mașinii ROVRA X-CLIP este desăvârșită de lamele sale de oțel inoxidabil de înaltă calitate. Aceste lame sunt concepute pentru a oferi o tăiere precisă și netedă, permițând realizarea unui fade perfect și a altor stiluri sofisticate.&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;', 1, 0, '2024-05-17 13:22:33'),
(5, 1, 10, 'Pelerină Neagră', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Pelerina ROVRA - Neagră este un accesoriu esențial pentru orice salon profesional care dorește să ofere clienților săi nu doar servicii de calitate, ci și o experiență confortabilă și plăcută. Construită pentru a rezista și a proteja, această pelerină reprezintă combinația perfectă între funcționalitate, durabilitate și design elegant.&lt;/p&gt;\r\n\r\nUnul dintre principalele avantaje ale pelerinei ROVRA este capacitatea sa de a crea o barieră impenetrabilă împotriva firelor de păr și a apei. Pelerina protejează hainele clientului, prevenind ca firele de păr să pătrundă prin material și să provoace disconfort. De asemenea, materialul impermeabil asigură că nici apa, nici produsele de styling lichide nu vor ajunge pe hainele clientului, menținându-le curate și uscate.\r\nPelerina ROVRA este realizată dintr-un material de înaltă calitate, cunoscut pentru rezistența și durabilitatea sa. Materialul folosit este rezistent la uzură și la rupere, garantând că pelerina va rămâne în stare excelentă.&lt;/p&gt;\r\n\r\nPelerina ROVRA - Neagră nu este doar funcțională, ci și elegantă. Culoarea neagră clasică oferă un aspect profesional și sofisticat, potrivindu-se perfect în orice salon modern. Designul simplu și rafinat reflectă standardele înalte ale salonului și ale serviciilor oferite. În plus, pelerina este ușor de întreținut, putând fi spălată la mașină fără a-și pierde forma sau culoarea, asigurând astfel un aspect impecabil în orice moment.&lt;/p&gt;', 1, 0, '2024-06-01 19:01:05'),
(6, 1, 2, 'Foarfecă de tuns', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;\r\nFoarfeca de tuns ROVRA Black Diamond - 5.0 inch reprezintă un vârf de gamă în materie de instrumente de tuns, creat de celebrul brand Rovra. Cu un design rafinat și o performanță deosebită, această foarfecă se remarcă în industria frizeriei prin combinația perfectă între estetică și funcționalitate.\r\n&lt;/p&gt;\r\nAliaj de Înaltă Performanță\r\nAceastă foarfecă de tuns este realizată dintr-un aliaj special denumit SUPREME COBALT, care oferă durabilitate și rezistență de neegalat. \r\n&lt;/p&gt;\r\nCu o lungime de 5.0 inch, această foarfecă este perfect echilibrată pentru a oferi o manevrare ușoară și precisă.&lt;/p&gt; Lamele ascuțite și robuste tăiesc cu precizie și fără efort prin firele de păr, permițând realizarea unor tunsori precise și detaliate. &lt;/p&gt;\r\nFoarfeca de tuns ROVRA Black Diamond - 5.0 inch este o investiție esențială pentru orice frizer profesionist care dorește să ofere servicii de cea mai înaltă calitate. &lt;/p&gt; Indiferent de nivelul de experiență al utilizatorului sau de stilurile de tuns preferate, această foarfecă este concepută pentru a satisface cele mai exigente cerințe și pentru a oferi rezultate remarcabile în fiecare utilizare.&lt;/p&gt; Cu ROVRA Black Diamond, fiecare tăietură devine o operă de artă.', 1, 0, '2024-06-01 20:52:36'),
(7, 1, 3, 'Uscător de păr', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;\r\n\r\nUscătorul de păr Rovra Etap 2500W este un dispozitiv profesional de înaltă performanță, conceput pentru a satisface cerințele exigente ale frizerilor și stilistilor. Cu un design elegant și tehnologie avansată, acest uscător oferă o experiență de uscare și stilizare superioară, garantând rezultate impecabile în fiecare utilizare.\r\n\r\n&lt;/p&gt;\r\n\r\nDotat cu un motor de 2500W, acest uscător de păr oferă putere și viteză extraordinară, permițând uscarea rapidă și eficientă a părului în timp record. Indiferent de tipul sau lungimea părului, acest dispozitiv asigură o uscare rapidă și uniformă, fără a-l expune la temperaturi ridicate sau la deteriorări.&lt;/p&gt;\r\n\r\nUscătorul de păr Rovra Etap dispune de 2 viteze și 3 trepte de încălzire, oferind utilizatorului control total asupra procesului de uscare și stilizare. Cu un buton dedicat pentru jetul de aer rece, acest uscător de păr oferă și posibilitatea de fixare a coafurii, contribuind la obținerea unui finisaj perfect și de lungă durată. Jetul de aer rece ajută la închiderea cuticulelor părului, reducând electrizarea și păstrând hidratarea naturală a firelor de păr.', 1, 0, '2024-06-01 21:54:51'),
(8, 1, 4, 'Mașină de ras', 'Mașina de ras shaver ROVRA X-SHAVE V2 este un dispozitiv profesional de înaltă performanță, conceput pentru a oferi o experiență de ras superioară atât în saloanele de înfrumusețare, cât și pentru utilizare personală.&lt;/p&gt; Cu tehnologie avansată și un design elegant, acest aparat de ras asigură o tăiere precisă și eficientă, garantând un aspect impecabil în fiecare utilizare.\r\n&lt;/p&gt;\r\nCu o viteză de rotație de 8800 RPM (rotații pe minut), mașina de ras ROVRA X-SHAVE V2 oferă o eficiență maximă la tăiere, asigurând rezultate rapide și uniforme. \r\n&lt;/p&gt;\r\nFiind echipat cu un acumulator încorporat, mașina de ras ROVRA X-SHAVE V2 oferă libertate de mișcare și flexibilitate în utilizare. &lt;/p&gt;\r\nFără fir, acest aparat de ras permite utilizatorului să se deplaseze liber în jurul clientului sau să se raseze în confortul propriei case fără a fi restricționat de cabluri sau prize.\r\n', 1, 0, '2024-06-01 23:03:53'),
(9, 2, 1, 'Mașina Golden', 'Gamma+ Golden Gun este o mașină de tuns profesională fără fir, concepută pentru a satisface cele mai înalte standarde de performanță și fiabilitate în saloanele de frizerie.\r\n&lt;/p&gt; Această mașină de tuns reprezintă vârful tehnologiei inovative, combinând eleganța cu funcționalitatea într-un dispozitiv de top.\r\n\r\n&lt;/p&gt;\r\nGolden Gun Gamma+ este echipată cu un motor puternic, proiectat pentru a asigura o tăiere precisă și eficientă indiferent de tipul de păr. \r\n&lt;/p&gt;Tehnologia sa avansată de tăiere asigură o performanță de neegalat, permițând realizarea de tunsori complexe și detaliate fără efort.\r\n\r\n&lt;/p&gt;\r\nGolden Gun impresionează nu doar prin performanțele sale tehnice, ci și prin designul său deosebit. Carcasa sa aurie nu doar că atrage privirile, dar și asigură o prindere confortabilă și sigură.\r\n&lt;/p&gt; Designul ergonomic permite utilizarea facilă, reducând oboseala mâinii chiar și după perioade îndelungate de utilizare.\r\n&lt;/p&gt;', 1, 0, '2024-06-02 18:49:17'),
(10, 2, 3, 'Uscător Gamma+', 'Gamma+ Profesional XCELL S este un uscător de păr de ultimă generație, proiectat pentru a satisface nevoile exigente ale profesioniștilor din saloanele de înfrumusețare, dar și pentru utilizarea personală la domiciliu.\r\n&lt;/p&gt; Cu o viteză impresionantă de 120.000 RPM și un design elegant, acest uscător de păr redefinește standardele de performanță și eficiență în îngrijirea părului.\r\n\r\n&lt;/p&gt;\r\nMotorul de înaltă performanță al uscătorului de păr Gamma+ XCELL S atinge o viteză incredibilă de 120.000 de rotații pe minut, asigurând o uscare rapidă și eficientă.\r\n&lt;/p&gt; Aceasta nu doar economisește timp prețios în rutina zilnică, dar și reduce expunerea părului la căldură, minimizând astfel riscul de deteriorare.\r\n\r\n&lt;/p&gt;\r\nGamma+ XCELL S este ușor și portabil, ceea ce îl face ideal pentru a fi luat oriunde. Fie că sunteți acasă, la salon sau în deplasare, acest uscător de păr vă va asigura mereu rezultatele dorite, fără compromisuri.\r\n&lt;/p&gt;', 1, 0, '2024-06-02 18:58:23'),
(11, 2, 4, 'Shaver Gamma+', 'Gamma+ Prodigy este o mașină de ras fără fir de ultimă generație, proiectată pentru a oferi performanță profesională și confort maxim.\r\n&lt;/p&gt; Această mașină de ras impresionează prin autonomia sa extinsă și timpul rapid de încărcare, devenind astfel un partener de încredere pentru orice frizerie sau uz personal.\r\n\r\n&lt;/p&gt;\r\nCu o autonomie de până la 120 de minute, Gamma+ Prodigy asigură o funcționare continuă și eficientă, permițând realizarea de retușuri precise și detalii fine fără întreruperi.\r\n&lt;/p&gt; Timpul de reîncărcare de doar 30 de minute este un avantaj major, asigurând disponibilitatea rapidă a aparatului pentru utilizări multiple într-o zi aglomerată.\r\n\r\n&lt;/p&gt;\r\nProdigy se remarcă printr-un design elegant și modern, în nuanțe de negru, care nu doar că arată profesional, dar este și ușor de manevrat.\r\n&lt;/p&gt; Designul ergonomic oferă o prindere confortabilă și sigură, reducând oboseala mâinii chiar și după utilizarea îndelungată.\r\n&lt;/p&gt;', 1, 0, '2024-06-02 19:03:11'),
(12, 2, 10, 'Perie profesională', 'Gamma+ Fade Brush - S este o perie profesională concepută special pentru a obține fade-uri perfecte, oferind stilistilor un instrument esențial pentru realizarea tunsorilor de precizie.\r\n&lt;/p&gt; Cu un design ergonomic și peri de înaltă calitate, această perie transformă fiecare sesiune de styling într-o experiență plăcută și eficientă.\r\n\r\n&lt;/p&gt;\r\nPeria Gamma+ Fade Brush - S se remarcă printr-un design ergonomic, care asigură o prindere confortabilă și sigură. \r\n&lt;/p&gt; Forma sa compactă și ușoară permite o manevrare ușoară, reducând oboseala mâinii chiar și după perioade îndelungate de utilizare. \r\n&lt;/p&gt;Acest design atent gândit face ca peria să fie ideală pentru stilistii care doresc să obțină rezultate precise și uniforme.\r\n\r\nPeria este ușor de curățat și întreținut, asigurând igiena necesară în orice salon de frizerie.\r\n&lt;/p&gt; Perii săi sunt rezistenți la uzură și își păstrează forma și eficiența pe termen lung, făcând din Gamma+ Fade Brush - S un instrument de încredere pentru orice stilist profesionist.\r\n&lt;/p&gt;', 1, 0, '2024-06-02 19:13:04'),
(13, 3, 1, 'Mașina fără fir', 'Mașina de tuns JRL Fresh Fade FF2020C, într-un elegant finisaj auriu, este un instrument de tuns de înaltă performanță, conceput pentru a răspunde nevoilor profesioniștilor din frizerii și saloane de coafură.\r\n&lt;/p&gt; Dotată cu tehnologie inteligentă și funcționalități avansate, această mașină de tuns asigură rezultate de excepție, indiferent de tipul sau volumul părului.\r\n\r\n&lt;/p&gt;\r\nUnul dintre punctele forte ale mașinii de tuns JRL Fresh Fade FF2020C este tehnologia sa inovatoare cu microcip.\r\n&lt;/p&gt; Acest microcip detectează mișcarea lamei în timpul tăierii și ajustează automat turatia motorului pentru a menține o performanță constantă. \r\n&lt;/p&gt;Astfel, mașina nu va încetini și nu va agăța părul, indiferent de grosimea sau densitatea acestuia, oferind o tăiere lină și uniformă de fiecare dată.\r\n&lt;/p&gt;\r\n\r\nFF2020C este o mașină de tuns fără fir, oferind libertate de mișcare și flexibilitate maximă în utilizare. \r\n&lt;/p&gt;Acumulatorul său de înaltă capacitate asigură o autonomie extinsă, permițând utilizarea continuă pe perioade îndelungate fără a fi nevoie de reîncărcare frecventă.\r\n&lt;/p&gt;', 1, 0, '2024-06-02 19:19:30'),
(14, 3, 10, 'Pămătuf frizerie', 'Pamatuful JRL este un element clasic și indispensabil în orice salon de frizerie, aducând un plus de profesionalism și eficiență în munca fiecărui frizer.&lt;/p&gt; Acesta reprezintă o ustensilă esențială pentru orice post de lucru, fiind proiectat pentru a asigura confortul și satisfacția atât a frizerului, cât și a clientului.\r\n&lt;/p&gt;\r\nFabricat din păr foarte fin, pamatuful JRL este dens și moale, permițând îndepărtarea eficientă și delicată a firelor de păr rămase pe piele după tuns.&lt;/p&gt; Această caracteristică asigură o experiență confortabilă pentru client, evitând iritațiile sau disconfortul. Părul fin și suplu din care este fabricat pamatuful asigură o rezistență de lungă durată, menținându-și calitățile chiar și după utilizări repetate.\r\n&lt;/p&gt;\r\nManerul ergonomic din plastic oferă o prindere confortabilă și sigură, permițând frizerului să manevreze pamatuful cu ușurință și precizie. &lt;/p&gt;Designul său ergonomic reduce oboseala mâinilor în timpul utilizării prelungite, facilitând o operare eficientă și confortabilă. Acest aspect este esențial pentru profesioniștii din frizerie care își desfășoară activitatea zilnică la un ritm intens.\r\n&lt;/p&gt;', 1, 0, '2024-06-03 21:29:36'),
(15, 3, 3, 'Uscător JRL', 'Uscătorul de păr JRL FORTE PRO este un echipament profesional de înaltă performanță, conceput pentru a satisface nevoile exigente ale saloanelor de înfrumusețare, dar și pentru uz personal.&lt;/p&gt; Cu un motor impresionant de 95.000 RPM, acest uscător de păr redefinește standardele de eficiență și calitate în îngrijirea părului.\r\n&lt;/p&gt;\r\nMotorul de 95.000 RPM asigură un flux de aer puternic și constant, reducând semnificativ timpul necesar pentru uscarea părului.&lt;/p&gt; Această caracteristică este esențială pentru profesioniștii din saloanele de înfrumusețare care doresc să ofere servicii rapide și eficiente. Pentru utilizatorii casnici, uscătorul JRL FORTE PRO oferă avantajul unei uscări rapide, economisind timp prețios în rutina zilnică de îngrijire a părului.&lt;/p&gt;Echipat cu tehnologii de ultimă generație, JRL FORTE PRO protejează părul împotriva deteriorării cauzate de căldură excesivă.&lt;/p&gt; Sistemul său inteligent de control al temperaturii menține un nivel optim de căldură, prevenind uscarea excesivă și deteriorarea firului de păr.&lt;/p&gt;', 1, 0, '2024-06-03 21:41:28'),
(16, 3, 1, 'Set combo JRL', 'Set Combo - JRL - Mașina de tuns ONYX + STYLECRAFT - Mașina de contur SABER - Neagră + STYLECRAFT - Mașina de ras REBEL\r\n\r\n&lt;/p&gt;\r\nAcest set combo de la JRL și STYLECRAFT reprezintă alegerea perfectă pentru profesioniștii din frizerie care își doresc un echipament de top, combinând performanța și inovația pentru a oferi cele mai bune rezultate. Setul include mașina de tuns ONYX de la JRL, mașina de contur SABER și mașina de ras REBEL de la STYLECRAFT.\r\n\r\n&lt;/p&gt;\r\nMașina de tuns ONYX de la JRL este recunoscută pentru motorul său puternic și tehnologia de vârf. Oferind o performanță de tăiere impecabilă, ONYX este echipată cu un motor de înaltă performanță care asigură o tăiere precisă și rapidă, indiferent de tipul și densitatea părului. \r\n\r\n&lt;/p&gt;\r\nMașina de contur SABER de la STYLECRAFT este un instrument esențial pentru detalierea și finisarea precisă a tunsorilor. \r\n\r\n&lt;/p&gt;\r\nMașina de ras REBEL de la STYLECRAFT completează perfect acest set combo, oferind o experiență de bărbierit de înaltă calitate. \r\n&lt;/p&gt;', 1, 0, '2024-06-03 21:56:29'),
(17, 4, 10, 'Șampon păr', 'Șamponul VERO Anticădere este soluția ideală pentru fortificarea și revitalizarea părului, oferindu-i protecție împotriva îmbătrânirii premature. Acesta conține ingrediente de înaltă calitate, atent selectate pentru a asigura un scalp sănătos și un păr puternic.\r\n\r\n&lt;/p&gt;\r\nFormulat cu Aloe Vera, un antibacterian natural, șamponul îndepărtează delicat impuritățile de pe scalp și păr, lăsându-le curate și revitalizate. Aloe Vera are proprietăți de hidratare și calmare, contribuind la menținerea sănătății scalpului.\r\n\r\n&lt;/p&gt;\r\nArnica Montană și Mentolul sunt incluse pentru a îmbunătăți circulația sângelui în scalp, stimulând creșterea părului și prevenind căderea acestuia. Aceste ingrediente oferă, de asemenea, o senzație de prospețime și un parfum revigorant, împrospătând întreaga coafură.\r\n\r\n&lt;/p&gt;\r\nCu o capacitate de 1000 ml, șamponul VERO Anticădere este perfect pentru utilizare frecventă, oferind rezultate vizibile și de durată. Ideal pentru toate tipurile de păr.\r\n&lt;/p&gt;', 1, 0, '2024-06-03 22:12:46'),
(18, 4, 10, 'Ceară de păr', 'Ceara de par mata - VERO - 100 ml\r\n&lt;/p&gt;\r\nProdus cu putere de fixare puternică și efect mat. Formulă exclusiv profesională conferă un grad înalt de maleabilitate pentru a stiliza părul după preferințe, de câte ori se dorește pe întreagă durată a zilei. Nu lipește firele de păr și nu lasă urme. Se înlătura ușor cu o simplă spălare.\r\n\r\n&lt;/p&gt;\r\nCeara de păr mată VERO este soluția ideală pentru un look bine definit și natural. Cu o putere de fixare puternică, acest produs asigură o coafură impecabilă pe întreaga durată a zilei, oferind în același timp un efect mat distinctiv.\r\n\r\n&lt;/p&gt;\r\nUn alt avantaj al cerii de păr VERO este faptul că se înlătură ușor cu o simplă spălare. Nu lasă reziduuri și nu necesită produse speciale pentru îndepărtare, astfel încât să îți poți schimba stilul fără dificultăți.\r\n\r\n&lt;/p&gt;\r\nCu un recipient de 100 ml, ceara de păr mată VERO este compactă și ușor de transportat, fiind ideală pentru utilizare atât acasă, cât și în deplasare.\r\n&lt;/p&gt;', 1, 0, '2024-06-03 22:15:37'),
(19, 4, 10, 'Fixativ', 'Fixativ puternic mat - VERO - 500 ml\r\nProdus cu fixare puternică.\r\n&lt;/p&gt; Formula sa de ultimă generație special concepută pentru stilizarea părului cu USCARE ULTRA-RAPIDĂ și EFECT MAT. Nu lasă reziduuri chiar dacă este utilizat în mod repetat și permite să obțineți coafura dorită în timp record.\r\n&lt;/p&gt;\r\nFixativul puternic mat VERO este alegerea perfectă pentru cei care doresc să obțină și să mențină coafuri impecabile pe întreaga durată a zilei. \r\n&lt;/p&gt;Fixativul VERO asigură o fixare puternică care menține părul în formă chiar și în condiții de umiditate sau vânt. Efectul mat conferă un aspect natural și sofisticat, ideal pentru orice tip de coafură.\r\n&lt;/p&gt;\r\nCu o formulă avansată, fixativul VERO este proiectat pentru uscare ultra-rapidă, permițându-ți să îți stilizezi părul într-un timp record. &lt;/p&gt;Această caracteristică este deosebit de utilă pentru persoanele ocupate care au nevoie de o coafură rapidă și eficientă.', 1, 0, '2024-06-03 23:52:46'),
(20, 5, 1, 'Mașina Babyliss', 'Mașină de tuns - BABYLISS - Snap FX - fără fir\r\n&lt;/p&gt;\r\nMașina de tuns BaByliss Snap FX fără fir este un instrument profesional de înaltă performanță, proiectat pentru a satisface nevoile frizerilor și stilistilor din saloanele aglomerate.\r\n&lt;/p&gt; Cu garanția calității BaByliss USA, această mașină de tuns combină tehnologia avansată cu un design ergonomic pentru a oferi rezultate impecabile și confort în utilizare.\r\n\r\n&lt;/p&gt;\r\nMașina de tuns Snap FX este echipată cu un motor puternic și durabil, care asigură o tăiere precisă și uniformă. Este ideală pentru conturarea bărbii, pentru crearea de designuri complexe și pentru tunsul general, oferind o versatilitate excelentă în stilizare.\r\n\r\n&lt;/p&gt;\r\nMașina de tuns Snap FX este ușor de întreținut, cu lame care se pot curăța rapid și eficient. Acest aspect asigură o durată de viață îndelungată și performanțe constante.\r\n&lt;/p&gt;', 1, 0, '2024-06-04 00:06:10'),
(21, 5, 4, 'Mașina de ras ', 'Masina de ras - BABYLISS - FX02 GOLD\r\n\r\n&lt;/p&gt;BaByliss FX02 GOLD Shaver Metal este un aparat de bărbierit profesional de dimensiuni mari, proiectat pentru a oferi o experiență de ras excepțională atât pe față, cât și pe corp.\r\n&lt;/p&gt; Acest model este echipat cu un motor puternic rotativ, asigurând o performanță superioară și o eficiență maximă.\r\n\r\n&lt;/p&gt;\r\nMașina de ras FX02 GOLD dispune de un motor puternic care garantează o tăiere precisă și rapidă. Indiferent de grosimea sau densitatea părului, acest aparat se descurcă admirabil, oferind un bărbierit neted și confortabil.\r\n&lt;/p&gt;\r\nCu un finisaj auriu metalic, BaByliss FX02 GOLD nu doar performează impecabil, dar arată și extrem de elegant. \r\n&lt;/p&gt;Carcasa metalică adaugă durabilitate și rezistență, asigurând o utilizare de lungă durată.\r\n', 1, 0, '2024-06-04 00:11:03'),
(22, 5, 3, 'Uscător Babyliss', 'Uscator de par BABYLISS - Pro Excess HQ 2600 W\r\n\r\n&lt;/p&gt;\r\nUscătorul de păr BaByliss Pro Excess HQ 2600 W este un instrument profesional de înaltă performanță, creat pentru a satisface nevoile celor mai exigenți stiliști și utilizatori.\r\n&lt;/p&gt; Cu o putere impresionantă de 2600 W, acest uscător asigură o uscare rapidă și eficientă, economisind timp prețios în rutina de înfrumusețare.\r\n\r\n&lt;/p&gt;\r\nBaByliss Pro Excess HQ 2600 W oferă o putere remarcabilă, ceea ce îl face ideal pentru utilizarea profesională în saloanele de înfrumusețare. \r\n&lt;/p&gt;Motorul său robust și eficient asigură o flux constant de aer cald, reducând timpul necesar pentru uscare și stilizare.\r\n\r\n&lt;/p&gt;\r\nAcest uscător de păr oferă control precis al temperaturii, cu o temperatură medie de 90°C și până la 125°C la viteza maximă.\r\n&lt;/p&gt;\r\n', 1, 0, '2024-06-04 00:17:38'),
(23, 5, 4, 'Mașină ras FX01 ', 'Masina de ras - BABYLISS - FX01 - Argintiu\r\n\r\n&lt;/p&gt;BaByliss FX01 - Argintiu este un aparat de bărbierit profesional care impresionează prin inovație și inventivitate, caracteristici distinctive ale brandului BaByliss.&lt;/p&gt; Acest nou model din gama mașinilor de ras este conceput pentru a oferi o experiență de bărbierit superioară, combinând performanța de top cu un design elegant și funcțional.\r\n&lt;/p&gt;\r\nBaByliss FX01 este echipat cu un motor puternic și precis, care asigură o tăiere rapidă și uniformă. Lamele sale de înaltă calitate oferă o experiență de bărbierit netedă și confortabilă, eliminând chiar și cele mai fine fire de păr.&lt;/p&gt;\r\nFX01 este ușor de manevrat datorită designului său ergonomic și greutății echilibrate. &lt;/p&gt;Datorită bateriei sale performante, BaByliss FX01 oferă o autonomie extinsă, permițând sesiuni de bărbierit fără întreruperi. Timpul redus de încărcare și durata lungă de funcționare asigură că aparatul este mereu gata de utilizare atunci când este necesar.&lt;/p&gt;', 1, 0, '2024-06-04 00:23:37'),
(24, 6, 1, 'Mașina tuns Rebel', 'Masina de tuns STYLECRAFT - Rebel\r\n&lt;/p&gt;Mașina de tuns Stylecraft Rebel este un instrument de tuns profesional de înaltă calitate, creat pentru a satisface cele mai exigente cerințe ale frizerilor și stilistilor.\r\n&lt;/p&gt; Echipată cu o tehnologie avansată și un design ergonomic, Rebel Clipper asigură o experiență de tuns excepțională, combinând puterea, precizia și versatilitatea într-un singur aparat.\r\n\r\n&lt;/p&gt;\r\nStylecraft Rebel este dotată cu un motor puternic și eficient, care oferă o tăiere precisă și uniformă, indiferent de tipul sau densitatea părului. \r\n&lt;/p&gt;Tehnologia de ultimă generație integrată în acest aparat permite realizarea unor tunsori impecabile și detaliate, adaptate nevoilor fiecărui client.\r\n&lt;/p&gt;\r\nRebel Clipper vine la pachet cu o serie de accesorii utile, inclusiv piepteni de ghidare de diferite dimensiuni, o perie de curățare și ulei pentru întreținerea lamei. \r\n&lt;/p&gt;Aceste accesorii permit personalizarea și adaptarea aparatului la diverse stiluri de tuns și nevoi specifice ale clienților.\r\n', 1, 0, '2024-06-04 00:32:55'),
(25, 6, 4, 'Mini shaver UNO', 'Masina de ras STYLECRAFT - mini shaver - UNO - Albastru&lt;/p&gt;Mașina de ras fără fir Stylecraft UNO este un instrument versatil și practic, conceput pentru a oferi o experiență de ras confortabilă și eficientă, fie acasă sau în călătorii.&lt;/p&gt; Cu un design compact și o performanță de încredere, această mașină de ras este partenerul ideal pentru o rutină de îngrijire personală impecabilă.&lt;/p&gt;\r\n\r\nStylecraft UNO este echipată cu o lamă precisă și puternică, care asigură o tăiere netedă și uniformă a firelor de păr, indiferent de lungimea sau densitatea acestora.&lt;/p&gt; Tehnologia avansată a lamei minimizează iritațiile și oferă rezultate de înaltă calitate în fiecare utilizare.\r\n&lt;/p&gt;\r\nCu o autonomie impresionantă de până la 120 de minute, Stylecraft UNO este perfectă pentru utilizare pe termen lung fără a fi nevoie de încărcare constantă.&lt;/p&gt; Această caracteristică face ca mașina de ras să fie ideală pentru călătorii sau pentru sesiuni de ras mai lungi, fără întreruperi.&lt;/p&gt;', 1, 0, '2024-06-04 00:39:04'),
(26, 6, 1, 'Mașină de contur', 'Masina de contur - STYLECRAFT - Evo - 10.000 RPM - fara fir\r\n&lt;/p&gt;\r\nMașina de contur Stylecraft Evo reprezintă un instrument esențial pentru stiliștii profesioniști și saloanele de înfrumusețare, oferind o performanță superioară și rezultate precise. Cu o tehnologie avansată și un design ergonomic, această mașină de contur este proiectată pentru a satisface cele mai exigente cerințe de tuns și conturare.\r\n&lt;/p&gt;\r\nEchipată cu un motor puternic ce atinge o viteză de rotație de 10.000 RPM, Stylecraft Evo oferă o tăiere precisă și uniformă, chiar și pentru cele mai fine detalii și contururi. Lamele sale de înaltă calitate garantează rezultate impecabile și o finisare profesională în fiecare utilizare.\r\n&lt;/p&gt;\r\nCu o autonomie impresionantă de aproximativ 120 de minute, Stylecraft Evo este perfectă pentru utilizare pe termen lung, fără a fi necesară o încărcare constantă. Acest aspect este esențial pentru saloanele aglomerate sau pentru sesiuni lungi de lucru, asigurând eficiență și confort în timpul tăierii.&lt;/p&gt;', 1, 0, '2024-06-04 00:44:05'),
(27, 7, 10, 'Loțiune', 'After shave colonie - NISH MAN 6 - 100 ml&lt;/p&gt;\r\nColonia NISH MAN 6 este un produs de înaltă calitate din seria Nish Man, cunoscut pentru aromele sale rafinate și durabile. &lt;/p&gt;Conceput special pentru bărbații activi, această colonie oferă o experiență olfactivă plăcută și proaspătă, ce persistă pe tot parcursul zilei.&lt;/p&gt;\r\n\r\nCu un miros distinct și îmbietor, NISH MAN 6 emană note aromatice și proaspete, care adaugă o notă subtilă de eleganță și rafinament oricărei aplicații. &lt;/p&gt;Aromele selectate cu grijă creează o compoziție olfactivă echilibrată și încântătoare, perfectă pentru bărbații moderni și sofisticați.&lt;/p&gt;\r\nColonia NISH MAN 6 poate fi aplicată cu ușurință pe piele după bărbierit, oferind o senzație revigorantă și calmantă. &lt;/p&gt;De asemenea, poate fi utilizată și ca o colonie de zi cu zi, pentru a conferi o notă subtilă de prospețime și rafinament întregii tale prezențe.&lt;/p&gt;', 1, 0, '2024-06-04 00:53:21');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(3, 3, 900, '2024-02-17 14:51:58'),
(4, 4, 1800, '2024-02-17 15:26:17'),
(5, 5, 500, '2024-02-17 15:32:52'),
(6, 6, 250, '2024-04-08 23:54:23'),
(7, 7, 250, '2024-05-03 01:40:22'),
(8, 8, 700, '2024-05-08 17:06:56'),
(9, 9, 500, '2024-06-01 20:20:02'),
(10, 10, 816, '2024-06-01 23:30:16'),
(11, 11, 1647, '2024-06-04 00:12:32'),
(12, 12, 2066, '2024-06-05 01:56:09'),
(13, 15, 882, '2024-06-05 02:40:35'),
(14, 16, 1998, '2024-06-12 23:07:51'),
(15, 24, 1692, '2024-06-14 13:38:59'),
(16, 25, 60, '2024-06-14 13:39:27');

-- --------------------------------------------------------

--
-- Structură tabel `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Inserarea datelor in tabel `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'CRAFT BARBER TOOLS'),
(6, 'short_name', 'CRAFT'),
(11, 'logo', 'uploads/logo-1645065716.jpg?v=1645065716'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1645065725.jpg?v=1645065725');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Inserarea datelor in tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Iacob', 'Natanael', 'admin@gmail.com', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1645064505', NULL, 1, '2024-01-20 14:02:37', '2024-06-12 16:34:29');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexuri pentru tabele `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexuri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexuri pentru tabele `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexuri pentru tabele `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexuri pentru tabele `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexuri pentru tabele `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pentru tabele `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pentru tabele `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pentru tabele `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pentru tabele `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pentru tabele `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pentru tabele `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pentru tabele `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pentru tabele `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pentru tabele `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constrângeri pentru tabele `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
