export class Place {
    constructor(
        public id: number,
        public name: string,
        public url: string,
        public lat: number,
        public lng: number,
        public parentId?: number
    ) {
    }

    static PROVINCES = {
        AN_GIANG: new Place(0, 'An Giang', 'an-giang', 10.5, 105.166667),
        BR_VT: new Place(1, 'Bà Rịa - Vũng Tàu', 'ba-ria-vung-tau', 10.583333, 107.25),
        BAC_KAN: new Place(2, 'Bắc Kạn', 'bac-kan', 22.166667, 105.833333),
        BAC_LIEU: new Place(3, 'Bạc Liêu', 'bac-lieu', 9.25, 105.75),
        BAC_NINH: new Place(4, 'Bắc Ninh', 'bac-ninh', 21.083333, 106.166667),
        BEN_TRE: new Place(5, 'Bến Tre', 'ben-tre', 10.166667, 106.5),
        BINH_DINH: new Place(6, 'Bình Định', 'binh-dinh', 14.166667, 109),
        BINH_DUONG: new Place(7, 'Bình Dương', 'binh-duong', 11.166667, 106.666667),
        BINH_PHUOC: new Place(8, 'Bình Phước', 'binh-phuoc', 11.75, 106.916667),
        BINH_THUAN: new Place(9, 'Bình Thuận', 'binh-thuan', 10.933333, 108.1),
        CA_MAU: new Place(10, 'Cà Mau', 'ca-mau', 9.083333, 105.083333),
        CAN_THO: new Place(11, 'Cần Thơ', 'can-tho', 10.033333, 105.783333),
        CAO_BANG: new Place(12, 'Cao Bằng', 'cao-bang', 22.666667, 106),
        DA_NANG: new Place(13, 'Đà Nẵng', 'da-nang', 16.066667, 108.233333),
        DAK_LAK: new Place(14, 'Đắk Lắk', 'dak-lak', 12.666667, 108.05),
        DAK_NONG: new Place(15, 'Đắk Nông', 'dak-nong', 11.983333, 107.7),
        DIEN_BIEN: new Place(16, 'Điện Biên', 'dien-bien', 21.383333, 103.016667),
        DONG_NAI: new Place(17, 'Đồng Nai', 'dong-nai', 11.116667, 107.183333),
        DONG_THAP: new Place(18, 'Đồng Tháp', 'dong-thap', 10.666667, 105.666667),
        GIA_LAI: new Place(19, 'Gia Lai', 'gia-lai', 13.75, 108.25),
        HA_GIANG: new Place(20, 'Hà Giang', 'ha-giang', 22.75, 105),
        HA_NAM: new Place(21, 'Hà Nam', 'ha-nam', 20.583333, 106),
        HA_NOI: new Place(22, 'Hà Nội', 'ha-noi', 21.028472, 105.854167),
        HA_TINH: new Place(23, 'Hà Tĩnh', 'ha-tinh', 18.333333, 105.9),
        HAI_DUONG: new Place(24, 'Hải Dương', 'hai-duong', 20.916667, 106.333333),
        HAI_PHONG: new Place(25, 'Hải Phòng', 'hai-phong', 20.865139, 106.683833),
        HAU_GIANG: new Place(26, 'Hậu Giang', 'hau-giang', 9.783333, 105.466667),
        HO_CHI_MINH: new Place(27, 'TP Hồ Chí Minh', 'ho-chi-minh', 10.776889, 106.700806),
        HOA_BINH: new Place(28, 'Hòa Bình', 'hoa-binh', 20.333333, 105.25),
        HUNG_YEN: new Place(29, 'Hưng Yên', 'hung-yen', 20.833333, 106.083333),
        KHANH_HOA: new Place(30, 'Khánh Hòa', 'khanh-hoa', 12.25, 109.2),
        KIEN_GIANG: new Place(31, 'Kiên Giang', 'kien-giang', 10, 105.166667),
        KON_TUM: new Place(32, 'Kon Tum', 'kon-tum', 14.75, 107.916667),
        LAI_CHAU: new Place(33, 'Lai Châu', 'lai-chau', 22, 103),
        LAM_DONG: new Place(34, 'Lâm Đồng', 'lam-dong', 11.95, 108.433333),
        LANG_SON: new Place(35, 'Lạng Sơn', 'lang-son', 21.75, 106.5),
        LAO_CAI: new Place(36, 'Lào Cai', 'lao-cai', 22.333333, 104),
        LONG_AN: new Place(37, 'Long An', 'long-an', 10.666667, 106.166667),
        NAM_DINH: new Place(38, 'Nam Định', 'nam-dinh', 20.25, 106.25),
        NGHE_AN: new Place(39, 'Nghệ An', 'nghe-an', 19.333333, 104.833333),
        NINH_BINH: new Place(40, 'Ninh Bình', 'ninh-binh', 20.25, 105.833333),
        NINH_THUAN: new Place(41, 'Ninh Thuận', 'ninh-thuan', 11.75, 108.833333),
        PHU_THO: new Place(42, 'Phú Thọ', 'phu-tho', 21.333333, 105.166667),
        PHU_YEN: new Place(43, 'Phú Yên', 'phu-yen', 13.166667, 109.166667),
        QUANG_BINH: new Place(44, 'Quảng Bình', 'quang-binh', 17.5, 106.333333),
        QUANG_NAM: new Place(45, 'Quảng Nam', 'quang-nam', 15.583333, 107.916667),
        QUANG_NGAI: new Place(46, 'Quảng Ngãi', 'quang-ngai', 15, 108.666667),
        QUANG_NINH: new Place(47, 'Quảng Ninh', 'quang-ninh', 21.25, 107.333333),
        QUANG_TRI: new Place(48, 'Quảng Trị', 'quang-tri', 16.75, 107),
        SOC_TRANG: new Place(49, 'Sóc Trăng', 'soc-trang', 9.666667, 105.833333),
        SON_LA: new Place(50, 'Sơn La', 'son-la', 21.166667, 104),
        TAY_NINH: new Place(51, 'Tây Ninh', 'tay-ninh', 11.333333, 106.166667),
        THAI_BINH: new Place(52, 'Thái Bình', 'thai-binh', 20.5, 106.333333),
        THAI_NGUYEN: new Place(53, 'Thái Nguyên', 'thai-nguyen', 21.666667, 105.833333),
        THANH_HOA: new Place(54, 'Thanh Hóa', 'thanh-hoa', 20, 105.5),
        THUA_THIEN_HUE: new Place(55, 'Huế', 'thua-thien-hue', 16.333333, 107.583333),
        TIEN_GIANG: new Place(56, 'Tiền Giang', 'tien-giang', 10.416667, 106.166667),
        TRA_VINH: new Place(57, 'Trà Vinh', 'tra-vinh', 9.833333, 106.25),
        TUYEN_QUANG: new Place(58, 'Tuyên Quang', 'tuyen-quang', 21.666667, 105.833333),
        VINH_LONG: new Place(59, 'Vĩnh Long', 'vinh-long', 10.166667, 106),
        VINH_PHUC: new Place(60, 'Vĩnh Phúc', 'vinh-phuc', 21.3, 105.6),
        YEN_BAI: new Place(61, 'Yên Bái', 'yen-bai', 21.5, 104.666667)
    };

    static findByUrl(url: string): Place {
        let keyProvince = Object.keys(this.PROVINCES).find(key => {
            let p: Place = this.PROVINCES[key];
            return p.url === url;
        });
        if(keyProvince === undefined) keyProvince = 'HO_CHI_MINH';
        return this.PROVINCES[keyProvince];
    }
}