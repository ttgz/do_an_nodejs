-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 09, 2024 lúc 01:15 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quan_ly_bai_viet`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `user_name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `user_name`, `email`, `password`) VALUES
(1, 'Nguyễn Ngọc Hoàng', 'hoang@gmail.com', 'hoang123'),
(2, 'Nguyễn Bá Kiệt', 'bakiet@gmail.com', 'kiet123'),
(3, 'Đặng Khánh Đông', 'dkd@gmail.com', 'dong123'),
(4, 'Nguyễn Quốc Đô', 'quocdo@gmail.com', 'do123\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet`
--

CREATE TABLE `baiviet` (
  `id` int(11) NOT NULL,
  `tieu_de` text NOT NULL,
  `noi_dung` text NOT NULL,
  `tac_gia` text NOT NULL,
  `ngay_dang` datetime NOT NULL DEFAULT current_timestamp(),
  `trang_thai` text DEFAULT 'hiển thị',
  `luot_xem` int(11) NOT NULL DEFAULT 0,
  `hinh_anh` text NOT NULL,
  `danh_muc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`id`, `tieu_de`, `noi_dung`, `tac_gia`, `ngay_dang`, `trang_thai`, `luot_xem`, `hinh_anh`, `danh_muc`) VALUES
(1, 'Chuyển động là gì ?', 'chuyển động là sự thay đổi vị trí của một vật theo thời gian. Một cuốn sách rơi khỏi bàn, nước chảy từ vòi, cửa sổ lạch cạch, v.v. tất cả đều thể hiện chuyển động. Ngay cả không khí mà chúng ta hít thở cũng có chuyển động!', 'Quoc Do', '2024-05-01 00:00:00', 'hiển thị', 6, '\\images\\chuyen_dong.jpg', 1),
(2, 'Cực quang là gì? Những điều thú vị chưa biết về hiện tượng cực quang', 'Cực quang là màn trình diễn ánh sáng tự nhiên lung linh trên bầu trời. Cực quang chỉ nhìn thấy được vào ban đêm và thường chỉ xuất hiện ở các vùng cực thấp hơn.\r\n\r\nNếu bạn từng ở gần Bắc Cực hoặc Nam Cực, bạn có thể sẽ được thưởng thức một món quà rất đặc biệt. Đó là những màn trình diễn ánh sáng tuyệt đẹp trên bầu trời. Những ánh sáng này được gọi là cực quang. Vậy hiện tượng cực quang là gì và điều gì tạo nên cực quang?', 'Quốc Đô', '2024-04-30 00:00:00', 'hiển thị', 14, '\\images\\cuc_quang.jpg', 1),
(3, 'Năng lượng hạt nhân là gì?', ' Năng lượng hạt nhân hay còn gọi là năng lượng nguyên tử là một loại công nghệ hạt nhân được thiết kế để tách năng lượng hữu ích từ hạt nhân nguyên tử thông qua các lò phản ứng hạt nhân có kiểm soát', 'Quốc Đô', '2024-05-01 00:00:00', 'hiển thị', 3, '\\images\\nang_luong_hat_nhan.jpg', 1),
(4, 'Khúc xạ ánh sáng là gì ', 'Khúc xạ hay chiết xạ là thuật ngữ thường dùng để chỉ hiện tượng ánh sáng đổi hướng khi đi qua mặt phân cách giữa hai môi trường trong suốt có chiết suất khác nhau. Mở rộng ra, đây là hiện tượng đổi hướng đường đi của bức xạ điện từ, hay các sóng nói chung, khi lan truyền trong môi trường không đồng nhất.', 'Quốc Đô', '2024-05-01 00:00:00', 'hiển thị', 0, '\\images\\khuc_xa_anh_sang.jpg', 1),
(5, 'Từ tính là gì?', 'Từ tính là hiện tượng liên quan đến nam châm. Nó được tạo ra bởi sự chuyển động của các điện tích hoặc bởi sự sắp xếp của các nguyên tử trong một vật liệu. Từ tính có thể được sử dụng để tạo ra nam châm, cũng như để lưu trữ dữ liệu.', 'Quốc Đô', '2024-05-01 00:00:00', 'hiển thị', 0, '\\images\\tu_tinh.jpg', 1),
(6, 'BNHD có ý nghĩa gì ', '<p>BNHD là cụm từ chỉ việc bắt nạt học đường.Bắt nạt học đường là những hành vi lặp đi lặp lại, mang tính bạo lực, nhằm mục đích gây tổn thương về thể chất, tinh thần cho người khác, xảy ra trong môi trường giáo dục. Nạn nhân thường là những học sinh yếu thế hơn về thể chất hoặc tinh thần.</p>', 'Ngọc Hoàng', '0000-00-00 00:00:00', 'hiển thị', 1, '/images/yhoc.jpg', 2),
(7, 'Bạo lực gia đình có tác hại như thế nào ?\r\n\r\n', '\r\nBạo lực gia đình gây ra nhiều tác hại nghiêm trọng trên nhiều phương diện, ảnh hưởng tiêu cực đến cả nạn nhân, thủ phạm và gia đình, đồng thời tác động đến cộng đồng và xã hội.\r\nSức khỏe thể chất: Bị thương tích, tàn tật, thậm chí tử vong do bạo hành.\r\nSức khỏe tinh thần: Lo âu, trầm cảm, rối loạn stress sau sang chấn, mất ngủ, sợ hãi, hoang mang, tự ti, thậm chí có ý thức tự tử.', 'Quốc Đô', '2024-05-01 00:00:00', 'hiển thị', 0, '\\images\\bao_luc_gia_dinh.jpg', 2),
(8, 'Tình yêu thương con người ', 'Tình yêu thương con người là một phẩm chất cao đẹp, được thể hiện qua những hành động, cử chỉ quan tâm, giúp đỡ, chia sẻ và san sẻ với những người xung quanh.\r\nGiúp đỡ người gặp khó khăn\r\nQuan tâm, chia sẻ với mọi người\r\nGóp phần xây dựng cộng đồng văn minh\r\nBiết ơn những người đã giúp đỡ mình', 'Quốc Đô', '2024-05-01 00:00:00', 'hiển thị', 0, '\\images\\tinh_yeu_thuong_con_nguoi.jpg', 2),
(9, 'Những hành vi cần lan truyền trong xã hội', 'Dọn dẹp rác thải, trồng cây xanh.\r\nNâng cao nhận thức về bảo vệ môi trường cho cộng đồng.\r\nChống biến đổi khí hậu.\r\nBảo vệ các loài động, thực vật quý hiếm.Giúp đỡ người dân gặp khó khăn do thiên tai, lũ lụt.\r\nTổ chức các hoạt động hiến máu nhân đạo, khám sức khỏe miễn phí.', 'Quốc Đô', '2024-05-01 00:00:00', 'hiển thị', 0, '\\images\\Nhung_hanh_vi_can_lan_truyen_trong_xa_hoi.jpg', 2),
(10, 'Mái ấm yêu thương\" của chị Võ Thị Thanh Tâm', 'Chị Tâm là người sáng lập dự án \"Mái ấm yêu thương\" - nơi nuôi dưỡng, chăm sóc trẻ em mồ côi, cơ nhỡ. Chị Tâm đã dành hơn 10 năm cuộc đời để nuôi dưỡng, dạy dỗ hàng chục trẻ em mồ côi, giúp các em có được mái ấm và cơ hội phát triển tốt đẹp.\r\n\r\n', 'Quốc Đô', '2024-05-01 00:00:00', 'hiển thị', 0, '\\images\\mai_am_yeu_thuong.jpg', 2),
(11, '\"Bàn tay của Chúa\" -  Diego Maradona (Argentina)', '\"Bàn tay của Chúa\" trong trận tứ kết World Cup 1986 giữa Argentina và Anh. Maradona đã dùng tay đập bóng vào lưới đối phương, giúp Argentina giành chiến thắng.', 'Quốc Đô', '2024-05-01 00:00:00', 'không hiển thị', 0, '\\images\\ban_tay_cua_chua.jpg', 3),
(12, 'Cú húc đầu của Zinédine Zidane', 'Trả đũa Marco Materazzi bằng cú húc đầu trong trận chung kết World Cup 2006 giữa Pháp và Ý.\r\n', 'Quốc Đô', '2024-05-01 00:00:00', 'không hiển thị', 0, '\\images\\cu_huc_dau_cua_zidane.jpg', 3),
(13, 'Ronaldo -\"Trái tim ấm áp\"', 'Ronaldo đã thành lập Quỹ CR7 để hỗ trợ trẻ em nghèo, mồ côi và mắc bệnh hiểm nghèo trên khắp thế giới. Quỹ đã tài trợ cho nhiều dự án giáo dục, y tế và phát triển cộng đồng.\r\nRonaldo đã ủng hộ nhiều tổ chức từ thiện uy tín như UNICEF, Save the Children, và Hội Chữ thập đỏ.', 'Quốc Đô', '2024-05-01 00:00:00', 'không hiển thị', 1, '\\images\\cr7_trai_tim_am_ap.jpg', 3),
(14, 'Messi nhân hậu ', 'Messi là Đại sứ thiện chí của UNICEF và đã tham gia nhiều hoạt động để nâng cao nhận thức về quyền trẻ em và bảo vệ trẻ em khỏi bị bóc lột, lạm dụng.\r\nLeo Messi hỗ trợ các dự án giáo dục và y tế cho trẻ em tại Argentina và các nước khác trên thế giới.\r\n', 'Quốc Đô', '2024-05-01 00:00:00', 'không hiển thị', 0, '\\images\\messi.jpg', 3),
(15, 'Trái tim quỷ đỏ - Manschester ', 'Thành tích của Sir Alex Ferguson trong quá trình huấn luyện Manchester United:\r\nSir Alex Ferguson là huấn luyện viên thành công nhất trong lịch sử Manchester United và là một trong những huấn luyện viên vĩ đại nhất mọi thời đại. Ông đã dẫn dắt \"Quỷ đỏ\" giành được vô số danh hiệu cao quý trong suốt 27 năm cầm quân tại Old Trafford\r\n', 'Quốc Đô', '2024-05-01 00:00:00', 'hiển thị', 0, '\\images\\trai_tim_quy_do.jpg', 3),
(16, 'Y học chính xác là gì?', 'Y học chính xác là một mô hình điều trị cá nhân hóa và chăm sóc bệnh nhân theo từng nhóm cụ thể có chia sẻ đặc điểm di truyền, đặc trưng hoặc điều kiện y tế. Mục tiêu của y học chính xác là đưa ra các phương pháp điều trị và điều chỉnh cá nhân dựa trên thông tin di truyền và dữ liệu của từng bệnh nhân.\r\n', 'Quốc Đô', '2024-05-02 00:00:00', 'hiển thị', 1, '\\images\\yhoc.jpg', 1),
(17, 'Vũ trụ là gì ?', 'Vũ trụ bao gồm tất cả các vật chất, năng lượng và không gian hiện có, được xem là một khối bao quát. Vũ trụ hiện tại chưa xác định được kích thước chính xác, giả thuyết cho rằng nó đã được mở rộng kể từ khi khởi đầu ở vụ nổ Big Bang khoảng 13,8 tỷ năm trước.[8][9][10][11][12][13] Vũ trụ bao gồm các hành tinh, sao, thiên hà, các thành phần của không gian liên sao, những hạt hạ nguyên tử nhỏ nhất, vật chất và năng lượng. Vũ trụ quan sát được có đường kính vào khoảng 28,5 tỷ parsec (93 tỷ năm ánh sáng) trong thời điểm hiện tại và ước tính có khoảng 2 nghìn tỉ thiên hà trong vũ trụ quan sát được.[2] Các nhà thiên văn chưa biết được kích thước toàn thể của Vũ trụ là bao nhiêu và cũng có thể là gần như vô hạn.[14] Những quan sát và phát triển của vật lý lý thuyết đã giúp suy luận ra thành phần và sự tiến triển của Vũ trụ.', 'Quốc Đô', '2024-05-02 00:00:00', 'hiển thị', 2, '\\images\\vutru.jpg', 1),
(18, 'U.23 Việt Nam nỗ lực ‘đầu xuôi, đuôi lọt’ trong trận mở màn đấu U.23 Kuwait', 'Với mục tiêu vượt qua vòng bảng giải U.23 châu Á 2024, U.23 Việt Nam hướng đến thắng lợi trước U.23 Kuwait trong trận đấu đầu tiên vào ngày 17.4, làm tiền đề tinh thần cho 2 trận còn lại trước Malaysia và Uzbekistan.\r\nSau 54 trận vòng loại, 16 đội tuyển hàng đầu châu lục (bao gồm Qatar được đặc cách tham dự với tư cách chủ nhà) sẽ chính thức bước vào vòng chung kết', 'Quốc Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\u23.jpg', 3),
(19, 'Sinh học là gì ?', 'Sinh học hay sinh vật học (gọi tắt là sinh) (Tiếng Anh: biology) là một nhánh khoa học tự nhiên nghiên cứu về thế giới sinh vật và các đặc điểm của sự sống.[1][2][3] Nó là một nhánh khoa học có phạm vi rộng nhưng có một số chủ đề thống nhất gắn kết nó với nhau thành một lĩnh vực duy nhất, mạch lạc.[1][2][3] Ngành tập trung nghiên cứu các cá thể sống, mối quan hệ giữa chúng với nhau và với môi trường, miêu tả những đặc điểm và tập tính của sinh vật (ví dụ: cấu trúc, chức năng, sự phát triển, môi trường sống), cách thức các cá thể và loài tồn tại (ví dụ: nguồn gốc, sự tiến hóa và phân bổ của chúng). Trao đổi chất quan trọng đối với sinh vật giúp chúng phát triển, ', 'Quốc Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\sinhhoc.jpg', 2),
(20, 'tiểu sử ronaldo', 'Thông tin tiểu sử cầu thủ Cristiano Ronaldo\r\nTên đầy đủ: Cristiano Ronaldo dos Santos Aveiro.\r\n\r\nNgày sinh: 05/02/1985.\r\n\r\nNơi sinh: Funchal, Madeira, Bồ Đào Nha.\r\n\r\nVị trí chơi bóng: Tiền vệ cánh, tiền đạo.\r\n\r\nFan hâm mộ bóng đá thường gọi Cristiano Ronaldo với biệt danh quen thuộc là CR7 hay Anh Bảy. Hiện anh đang thi đấu ở giải Ngoại Hạng Anh cho câu lạc bộ Man Utd với vị trí tiền vệ cánh trái hay tiền đạo và là đội trưởng của ĐTQG Bồ Đào Nha.\r\n\r\nLà một cầu thủ chạy cánh thế nhưng Ronaldo lại sở hữu cho mình những phẩm chất thường thấy ở một tiền đạo bẩm sinh. Anh có thể dứt điểm tốt bằng cả hai chân, xuất sắc trong các tình huống xử lý bóng chết như đá phạt trực tiếp hoặc Penalty và các tình huống xử lý cá nhân trước khi dứt điểm. Ronaldo còn có khả năng đánh đầu thiện xạ nhờ chiều cao và thể hình lý tưởng (1m86). Tuy nhiên lối chơi bóng của Ronaldo thường độc lập chứ không bắt nhịp cùng cả đội. Đây vừa là ưu điểm cũng như chính là khuyết điểm mà giới đánh đá nhận xét về CR7.\r\n\r\nSự nghiệp câu lạc bộ\r\nSporting Lisbon\r\nSau khi gia nhập Sporting vài năm thì Ronaldo bị phát hiện mắc hội chứng tim đập nhanh. Thời điểm này Ronaldo vừa tròn 15 tuổi, tưởng chừng như anh đã mất hết bởi căn bệnh này không cho phép hoạt động mạnh huống chi là đá bóng.\r\n\r\nNhưng dường như, với Ronaldo tình yêu với trái bóng tròn là tất cả. Ronaldo đã cầu xin mẹ để được đi chữa trị và làm phẫu thuật để có thể tiếp tục với sự nghiệp quần đùi áo số. Và may mắn đã mỉm cười với Ronaldo. Sau cuộc phẫu thuật thành công, Ronaldo lại có thể tiếp tục thi đấu bóng đá.\r\n\r\nMan Utd\r\nỞ tuổi 16, tài năng của CR7 ngày 1 tỏa sáng. Tưởng chừng CR7 sẽ rời bỏ Sporting để tới với đội bóng nổi tiếng ở Ngoại Hạng Anh Liverpool nhưng ban lãnh đạo của Liverpool lại không thể chấp nhận một cầu thủ còn quá non trẻ như thế.\r\n\r\nSự nghiệp thi đấu bóng đá của Ronaldo bắt đầu chính thức vào; Mùa hè năm 2003, khi Sporting có kqbd truc tuyen đánh bại Man Utd 3-1 trong lễ khai trương sân vận động mới của họ Estádio José Alvalade tại Lisboa. CR7 đã lọt vào tầm ngắm của HLV Man Utd Sir. Alex Ferguson. Và ngay sau đó bản hợp đồng mua đứt CR7 từ Man Utd đã được ký duyệt. Ferguson đã quyết định để Ronaldo thay thế cho vị trí tiền vệ cánh phải của David Beckham và mặc áo 7 huyền thoại Beckham đã để lại.\r\n\r\nTháng 11/2009, CR7 bày tỏ ý định muốn rời khỏi Man Utd để phát triển sự nghiệp. Và Man Utd đã ký bản hợp đồng chuyển nhượng cầu thủ này cho Real Madrid với giá 80 triệu bảng. Ronaldo kết thúc 6 năm thi đấu tại Man Utd với 292 trận đấu và ghi được 118 bàn thắng cùng rất nhiều những danh hiệu cao quý mà cầu thủ bóng đá nào cũng mơ ước.\r\n\r\nXem thêm: Tiểu sử Jon Bautista – Thông tin và sự nghiệp cầu thủ Jon Bautista\r\n\r\nReal Madrid\r\nTrong mùa giải đầu tiên 2009-2010 tại CLB mới, CR7 đã ghi với 33 bàn thắng trong 35 trận đấu. Đây là một con số ấn tượng trong mùa giải đầu tiên khi mà CR7 chơi bóng tại Tây Ban Nha.\r\n\r\nVới sự ra đi của Raúl vào mùa hè năm 2010, Ronaldo đã được Raúl trao lại chiếc áo đấu số 7 gắn liền với tên tuổi của Ronaldo khi còn ở Man Utd.\r\n\r\nTuy nhiên trải qua 9 mùa giải cùng Real Madrid với vô số những danh hiệu cao quý cho cá nhân và cả tập thể. Ronaldo vẫn muốn tiếp tục tiến xa hơn trong sự nghiệp bóng đá nên việc CR7 rời đi là một điều không mấy ngạc nhiên.\r\n\r\nVào ngày 10/7/2018, Ronaldo đồng ý ký bản hợp đồng với thời hạn 4 năm với CLB Juventus của Italia sau khi hoàn tất phí chuyển nhượng 100 triệu euro, trong đó bao gồm thêm 12 triệu euro các phí khác. Đây là mức phí chuyển nhượng cao nhất từ ​​trước đến nay đối với 1 cầu thủ trên 30 tuổi.\r\n\r\nXem thêm: Tiểu sử cầu thủ Diogo Jota và sự nghiệp bóng đá chuyên nghiệp\r\n\r\nJuventus\r\nRonaldo giành được danh hiệu đầu tiên của mình cùng với CLB Juventus vào tháng 1/2019, cụ thể là tại Supercoppa Italiana 2018, sau khi anh ghi bàn thắng từ cú đánh đầu vào lưới A.C. Milan.\r\n\r\nTrải qua 3 mùa giải và cũng là lúc tuổi tác ngày một lớn trong sự nghiệp nhưng dường như cầu thủ năm nay 36 tuổi vẫn chưa muốn dừng lại. Hiếm có 1 cầu thủ nào có được số lượng các danh hiệu nhiều như Cristiano Ronaldo.\r\n\r\nMan Utd\r\nVào ngày 27 tháng 8 năm 2021, Manchester United thông báo rằng họ đã đạt được thỏa thuận với Juventus để ký hợp đồng với Ronaldo, tùy thuộc vào thỏa thuận liên quan đến các điều khoản cá nhân. Thương vụ chuyển nhượng được cho là có mức phí ban đầu là 12,85 triệu bảng, có thời hạn hai năm cộng với tùy chọn gia hạn thêm một năm, được công bố vào ngày 31 tháng 8.\r\n\r\nNgoài ra chúng tôi cung cấp thêm cho quý đọc giả kết quả bóng đá pháp để có cái nhìn tổng quát về giải đấu hấp dẫn hàng đầu Châu Âu này.\r\n\r\nRonaldo sẽ mặc áo số 7 sau khi Edinson Cavani nhường cho Ronaldo và chuyển sang số 21. Ronaldo được cho là đã phá kỷ lục mọi thời đại sau một thương vụ chuyển nhượng, vượt qua Messi sau khi anh chuyển đến Paris Saint-Germain trước đó.', 'Quốc Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\ro.jpg', 3),
(21, 'thành tích real marid', 'Real Madrid khẳng định mình là một thế lực lớn của bóng đá Tây Ban Nha và châu Âu trong suốt những năm 1950, giành được 5 Cúp C1 liên tiếp và 7 lần lọt vào trận chung kết. Thành công này được nhân rộng ở giải đấu mà câu lạc bộ đã vô địch năm lần trong khoảng thời gian bảy năm. Đội hình này, bao gồm Alfredo Di Stéfano, Ferenc Puskás, Francisco Gento và Raymond Kopa, được xem là đội hình vĩ đại nhất mọi thời đại.\r\n\r\n\r\nỞ đấu trường quốc nội, câu lạc bộ đã giành được 69 danh hiệu; kỷ lục 35 danh hiệu La Liga, 20 Copa del Rey, 12 Supercopa de España, một Copa Eva Duarte và một Copa de la Liga. Trong các giải đấu châu Âu và thế giới, Real Madrid đã giành được 26 danh hiệu; kỷ lục 14 danh hiệu Cúp C1 châu Âu/UEFA Champions League, 2 Cúp UEFA, 5 Siêu cúp UEFA, họ cũng giành được kỷ lục 8 chức vô địch thế giới cấp câu lạc bộ.\r\n\r\n\r\nReal Madrid được công nhận là Câu lạc bộ xuất sắc nhất thế kỷ 20 của FIFA vào ngày 11 tháng 12 năm 2000 với 42,35% phiếu bầu, và nhận được Kỉ niệm chương FIFA vào ngày 20 tháng 5 năm 2004. Câu lạc bộ cũng được IFFHS trao giải Câu lạc bộ châu Âu xuất sắc nhất thế kỷ 20 vào ngày 11 tháng 5 năm 2010. Vào tháng 6 năm 2017, Real Madrid trở thành câu lạc bộ giành nhiều chức vô địch Champions League liên tiếp nhất, nối dài vị trí dẫn đầu của họ trên bảng xếp hạng câu lạc bộ của UEFA. Tính đến năm 2022, Real Madrid xếp thứ 5 sau Bayern Munich, Manchester City, Liverpool và Chelsea trên bảng xếp hạng này.', 'Quốc Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\real.jpg', 3),
(22, 'sự kiện phòng trọ lên giá', 'Dựa vào thông tin ghi nhận, sau Tết Nguyên đán, nhiều người lao động và sinh viên trở lại TPHCM để học tập và làm việc, dẫn đến nhu cầu tìm phòng trọ tăng cao. Giá thuê phòng trọ cũng tăng lên từ 1 triệu đến 1,5 triệu đồng/phòng, tùy thuộc vào diện tích, nội thất và khu vực1', 'Quốc Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\phongtro.jpg', 2),
(23, 'Chiến Tranh ', 'Chiến tranh (Tiếng Anh: war) là một mức độ xung đột vũ trang giữa các quốc gia, chính phủ, xã hội hoặc các nhóm bán quân sự như lính đánh thuê, quân nổi dậy và dân quân do sự mâu thuẫn về ý thức hệ, sắc tộc và tôn giáo nhằm tranh giành lợi ích về kinh tế và chính trị. Nó thường được đặc trưng bởi bạo lực cực đoan, xâm lược, phá hủy và tử vong, sử dụng lực lượng quân sự thường xuyên hoặc không thường xuyên. Chiến tranh đề cập đến các hoạt động và đặc điểm chung của các loại chiến tranh, hoặc của các cuộc chiến nói chung.[1] Chiến tranh toàn diện là chiến tranh không bị giới hạn trong các mục tiêu quân sự hợp pháp, và có thể dẫn đến những đau khổ và thương vong dân sự không chiến đấu khác.', 'Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\chientranh.jpg', 2),
(24, 'Khí hậu nóng dần ', 'Theo tài liệu nghiên cứu, nếu vượt ngưỡng Hothouse Eaerth thì nhiệt độ toàn cầu sẽ đạt mức cao nhất trong 1,2 triệu năm qua. Khí hậu có thể tăng lên 4-5 độ C so với thời kỳ tiền công nghiệp. Băng tan sẽ khiến mực nước biển có thể dâng cao 10-60 m so với bây giờ. Về cơ bản, điều này có nghĩa là một số nơi trên trái đất sẽ không thể sống được.', 'Quốc Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\khihau.jpg', 2),
(25, 'Hậu quả COVID ', 'Thông tin trên báo chí, PGS.TS.BS Lương Ngọc Khuê cho biết, vào tháng 10/2021, Tổ chức Y tế thế giới (WHO) đã công bố chính thức về khái niệm \"hậu Covid-19\".\r\n\r\nTheo đó, hậu Covid-19 xảy ra ở người có tiền sử nhiễm SARS-CoV-2, thường là 3 tháng kể từ khi bắt đầu mắc Covid-19 với các triệu chứng và kéo dài ít nhất 2 tháng mà không thể giải thích bằng chẩn đoán thay thế.\r\n\r\nCũng theo WHO, hậu Covid-19 có thể khiến sức khỏe con người bị suy giảm kéo dài, có tác động nghiêm trọng đến khả năng quay trở lại làm việc hoặc tham gia cuộc sống xã hội của người bị mắc Covid-19. Họ bị ảnh hưởng đến sức khỏe tâm thần và có thể gây ra những hậu quả kinh tế đáng kể cho bản thân, cho gia đình và cho xã hội.\r\n\r\nPGS.TS Lương Ngọc Khuê nhấn mạnh, tuy nhiên để hiểu rõ về hậu Covid-19, chúng ta cần công nhận, Covid-19 để lại rất nhiều hậu quả nặng nề. Đối với mỗi cá nhân, đó là những hậu quả cả về mặt tinh thần và thể chất.\r\n\r\nPhân tích rõ hơn về nội dung này, Cục trưởng Cục Quản lý Khám chữa bệnh cho biết, ở khía cạnh tinh thần, sau khi trải qua thảm họa đại dịch, đã chứng kiến những tác động của đại dịch tới bản thân, gia đình và xã hội, bộ phận người dân đã gặp phải những sang chấn tâm lý.\r\n\r\nDo đó, người bệnh có thể cảm thấy stress, trầm cảm, lo âu, mất ngủ, hồi hộp… sau Covid-19. Thực tiễn điều trị cũng như các nghiên cứu khoa học cũng đã ghi nhận điều tương tự của người bệnh mắc các bệnh nan y hay trong các đại dịch nguy hiểm trước đó.\r\n\r\nĐối với thể chất, một số biểu hiện hậu Covid-19 rất phổ biến có thể kể đến như các triệu chứng hô hấp.\r\n\r\nPGS.TS Lương Ngọc Khuê đưa ra dẫn chứng thực tế tại Bệnh viện Bạch Mai, có 50-60% những bệnh nhân sau mắc Covid-19 với triệu chứng hô hấp kéo dài đến khám được chụp X-quang hoặc chụp cắt lớp vi tính lồng ngực thấy có tổn thương; Sốt nhẹ, khó thở, mệt mỏi, đau cơ, khớp, rụng tóc, xơ phổi, tim đập nhanh hoặc đánh trống ngực, rối loạn nội tiết, huyết học bị huyết khối…\r\n\r\nCó trường hợp xuất hiện rối loạn tiêu hóa: ăn không ngon miệng, chán ăn, đau dạ dày, tiêu chảy; buồn nôn, nôn, đau thượng vị; Rối loạn vị giác hoặc khứu giác, phát ban…\r\n\r\nCác triệu chứng về tâm thần như: rối loạn tâm lý, giảm sự tập trung, lo âu, trầm cảm, bồn chồn, rối loạn giấc ngủ, mau quên, không tập trung. Một số người xuất hiện tình trạng não sương mù, nhận thức kém, đọc chậm, giảm trí nhớ ngắn hạn, thay đổi tâm trạng.', 'Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\covid.jpg', 2),
(26, 'Bất bình đẳng xã hội là gì', 'Bất bình đẳng xã hội là sự bất bình đẳng, thiếu công bằng, sự bằng nhau về các cơ hội hoặc lợi ích đối với những cá nhân khác nhau trong một nhóm hoặc nhiều nhóm trong xã hội.\r\n\r\nTất cả các xã hội - cả quá khứ hay hiện tại - đều được đặc trưng bởi sự khác biệt xã hội. Đó là một quá trình trong đó con người tạo nên khoảng cách do cách ứng xử khác nhau bởi các địa vị, vai trò và những đặc điểm khác nhau. Quá trình của sự khác biệt xã hội không đòi hỏi con người đánh giá các vai trò và các hoạt động cụ thể tồn tại như là quan trọng hơn những cái khác; tuy nhiên, sự khác biệt xã hội chuẩn bị cho sự bất bình đẳng xã hội, là một điều kiện trong đó con người có cơ hội không ngang bằng về sử dụng của cải, quyền lực và uy tín. Nhà xã hội học Daniel Rossides cho rằng: ngay trong các xã hội đơn giản nhất \"người già thường có uy quyền đối với người trẻ, cha mẹ có uy quyền với con cái, và đàn ông có uy quyền đối với đàn bà.\"\r\n\r\nBất bình đẳng xã hội không phải là một hiện tượng tồn tại một cách ngẫu nhiên giữa các cá nhân trong xã hội. Xã hội có bất bình đẳng khi một số nhóm xã hội kiểm soát và khai thác các nhóm xã hội khác. Qua những xã hội khác nhau đã tồn tại những hệ thống bất bình đẳng xã hội khác nhau. Bất bình đẳng xã hội là một vấn đề trung tâm của xã hội học, đây là vấn đề có ý nghĩa quyết định đối với sự phân tầng trong tổ chức xã hội.', 'Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\bbd.jpg', 1),
(27, 'Bất bình đẳng', 'Bất bình đẳng xã hội là sự bất bình đẳng, thiếu công bằng, sự bằng nhau về các cơ hội hoặc lợi ích đối với những cá nhân khác nhau trong một nhóm hoặc nhiều nhóm trong xã hội.\r\n\r\nTất cả các xã hội - cả quá khứ hay hiện tại - đều được đặc trưng bởi sự khác biệt xã hội. Đó là một quá trình trong đó con người tạo nên khoảng cách do cách ứng xử khác nhau bởi các địa vị, vai trò và những đặc điểm khác nhau. Quá trình của sự khác biệt xã hội không đòi hỏi con người đánh giá các vai trò và các hoạt động cụ thể tồn tại như là quan trọng hơn những cái khác; tuy nhiên, sự khác biệt xã hội chuẩn bị cho sự bất bình đẳng xã hội, là một điều kiện trong đó con người có cơ hội không ngang bằng về sử dụng của cải, quyền lực và uy tín. Nhà xã hội học Daniel Rossides cho rằng: ngay trong các xã hội đơn giản nhất \"người già thường có uy quyền đối với người trẻ, cha mẹ có uy quyền với con cái, và đàn ông có uy quyền đối với đàn bà.\"\r\n\r\nBất bình đẳng xã hội không phải là một hiện tượng tồn tại một cách ngẫu nhiên giữa các cá nhân trong xã hội. Xã hội có bất bình đẳng khi một số nhóm xã hội kiểm soát và khai thác các nhóm xã hội khác. Qua những xã hội khác nhau đã tồn tại những hệ thống bất bình đẳng xã hội khác nhau. Bất bình đẳng xã hội là một vấn đề trung tâm của xã hội học, đây là vấn đề có ý nghĩa quyết định đối với sự phân tầng trong tổ chức xã hội.', 'Đô', '2024-05-02 00:00:00', 'hiển thị', 0, '\\images\\bbd.jpg', 1),
(28, 'FC Bayern München thành tựu', 'Kỷ lục vô địch quốc gia Đức: 34 lần (1932, 1968/1969, 1971/1972, 1972/1973, 1973/1974, 1979/1980, 1980/1981, 1984/1985, 1985/1986, 1986/1987, 1988/1989, 1989/1990, 1993/1994, 1996/1997, 1998/1999, 1999/2000, 2000/2001, 2002/2003, 2004/2005, 2005/2006, 2007/2008, 2009/2010, 2012/2013, 2013/2014, 2014/2015, 2015/2016, 2016/2017, 2017/2018, 2018/2019, 2019/2020, 2020/2021, 2021/2022, 2022/2023, 2023/2024)\r\nKỷ lục vô địch cúp bóng đá Đức: 21 lần (1956/1957, 1965/1966, 1966/1967, 1968/1969, 1970/1971, 1981/1982, 1983/1984, 1985/1986, 1997/1998, 1999/2000, 2002/2003, 2004/2005, 2005/2006, 2007/2008, 2009/2010, 2012/2013, 2013/2014, 2015/2016, 2018/2019, 2019/2020, 2023/2024)\r\nKỷ lục vô địch Siêu cúp bóng đá Đức: 11 lần (1987, 1990, 2010, 2012, 2016, 2017, 2018, 2020, 2021, 2022, 2024)\r\nKỷ lục vô địch cúp Liên đoàn bóng đá Đức: 6 lần (1997, 1998, 1999, 2000, 2004, 2007)\r\nCúp C1 châu Âu: 7 lần (1973/1974, 1974/1975, 1975/1976, 2000/2001, 2012/2013, 2019/2020, 2023/2024)\r\nUEFA Europa League: 1 lần (1995/1996)\r\nUEFA Cup Winners\' Cup: 1 lần (1966/1967)\r\nSiêu cúp bóng đá châu Âu: 3 lần (2013, 2020, 2024)\r\nCúp bóng đá liên lục địa: 2 lần (1976, 2001)\r\nCúp bóng đá thế giới cấp câu lạc bộ: 2 lần (2013, 2020)', 'Đô', '2024-05-02 00:00:00', '', 0, '\\images\\bayyern.jpg', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `noi_dung` text NOT NULL,
  `bai_viet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `email`, `noi_dung`, `bai_viet`) VALUES
(1, 'trungnguyen@gmail.com', 'Bài viết rất hay', 2),
(2, 'hoang@gmail.com', 'Bài viết rất bổ ích, cần phát triển thêm', 2),
(3, 'dkd@gmail.com', 'Bài viết rất hay', 3),
(4, 'do@gmail.com', 'Bài viết rất hay ', 17),
(5, 'khanhdong@gmail.com', 'Bài viết rất hay\r\n', 2),
(6, 'dong@gmail.com', 'Bài viết rất bổ ích', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dangky`
--

CREATE TABLE `dangky` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dangky`
--

INSERT INTO `dangky` (`id`, `email`) VALUES
(1, 'trungnguyen@gmail.com'),
(2, 'quocdo113cscd@gmail.com'),
(5, 'donguyentrungnguyen@gmail.com'),
(6, 'khanhdong@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmucbaiviet`
--

CREATE TABLE `danhmucbaiviet` (
  `id` int(11) NOT NULL,
  `ten_danh_muc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmucbaiviet`
--

INSERT INTO `danhmucbaiviet` (`id`, `ten_danh_muc`) VALUES
(1, 'khoa học'),
(2, 'đời sống'),
(3, 'thể thao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lienhe`
--

CREATE TABLE `lienhe` (
  `id` int(11) NOT NULL,
  `ten_lien_he` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `tieu_de` text NOT NULL,
  `noi_dung` text NOT NULL,
  `trang_thai_duyet` text NOT NULL DEFAULT 'chờ duyệt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lienhe`
--

INSERT INTO `lienhe` (`id`, `ten_lien_he`, `email`, `tieu_de`, `noi_dung`, `trang_thai_duyet`) VALUES
(1, 'Trung Nguyên', 'trungnguyen@gmail.com', '', 'nội dung của liên hệ\r\n', 'chờ duyệt'),
(2, 'DKD', '0306221014@gmail.com', '', 'chưa đầy đủ', 'chờ duyệt'),
(6, 'Ngọc Hoàng', 'hoang@gmail.com', 'Trang web cần cải thiện ', 'Thêm nhiều chức năng hơn', 'đã duyệt'),
(7, 'Đặng Khánh Đông', 'quocdo@gmail.com', 'Trang web cần cải thiện', 'Cần có chức năng phân trang', 'chờ duyệt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(11) NOT NULL,
  `ten_nguoi_dung` text NOT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` text NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mat_khau` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `ten_nguoi_dung`, `ngay_sinh`, `gioi_tinh`, `email`, `mat_khau`) VALUES
(1, 'Trung Nguyên', '2004-01-01', 'Nam', 'trungnguyen@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongtinlienhe`
--

CREATE TABLE `thongtinlienhe` (
  `id` int(11) NOT NULL,
  `dia_chi` text DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `thong_tin_ban_quyen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thongtinlienhe`
--

INSERT INTO `thongtinlienhe` (`id`, `dia_chi`, `email`, `facebook`, `youtube`, `thong_tin_ban_quyen`) VALUES
(1, '1135 Huỳnh Tấn Phát, Quận 7, TP HCM', 'dong_hoang_do_kiet@gmail.com', 'https://www.facebook.com/idkd.17', 'https://www.youtube.com/channel/UC-K7debtooBFcpRFZvJ5XYA', 'Bản quyền © thuộc nhóm của Đông, Hoàng, Đô và Kiệt');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_baiviet_danhmucbaiviet` (`danh_muc`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_binhluan_baiviet` (`bai_viet`);

--
-- Chỉ mục cho bảng `dangky`
--
ALTER TABLE `dangky`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhmucbaiviet`
--
ALTER TABLE `danhmucbaiviet`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thongtinlienhe`
--
ALTER TABLE `thongtinlienhe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `dangky`
--
ALTER TABLE `dangky`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `danhmucbaiviet`
--
ALTER TABLE `danhmucbaiviet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `thongtinlienhe`
--
ALTER TABLE `thongtinlienhe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `fk_baiviet_danhmucbaiviet` FOREIGN KEY (`danh_muc`) REFERENCES `danhmucbaiviet` (`id`);

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `fk_binhluan_baiviet` FOREIGN KEY (`bai_viet`) REFERENCES `baiviet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
