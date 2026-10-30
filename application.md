# B08 · Bối cảnh ứng dụng



| | |
|---|---|
| Mã đề | **B08** |
| Tên đề | Bộ ghép kênh 8→1 và tách kênh 1→8 dùng chung đường chọn |
| Nhóm đề | B · Mã hoá, giải mã và chuyển đổi mã |
| Độ khó | Trung bình |
| Loại mạch | **Tổ hợp** |
| Quy mô ước lượng (Charter) | ~70–120 cell · 1×1 tile |
| Nguồn gốc | Project Charter — B08, mục 1 |

---

## 1. Mục tiêu và bối cảnh ứng dụng

Trích nguyên văn Charter mục 1:

> Phân tích khối số “Bộ ghép kênh 8→1 và tách kênh 1→8 dùng chung đường chọn” ở mức khối. Bối cảnh ứng dụng: Khối định tuyến tín hiệu trong bo mạch đo nhiều kênh: một đường dây dùng chung cho 8 cảm biến, chọn kênh bằng 3 bit.

## 2. Vị trí khối B08 trong hệ thống

```
   ┌──────────────┐      ┌──────────────────────────────┐      ┌──────────────┐
   │  Nguồn tín   │─────▶│      ►►► KHỐI B08 ◄◄◄        │─────▶│  Tầng tiêu   │
   │  hiệu / dữ   │      │  Bộ ghép kênh 8→1 và tách kên │      │  thụ kết quả │
   │  liệu vào    │      │  Loại mạch: Tổ hợp           │      │              │
   └──────────────┘      └──────────────────────────────┘      └──────────────┘
```

> Sơ đồ chi tiết có chú thích: `03_ARCHITECTURE/system_diagram.md`.

## 3. Phân loại analog / digital / mixed

| Khối | Phân loại | Ghi chú |
|---|---|---|
| Cảm biến / nguồn tín hiệu vật lý (nếu có) | Analog | Đại lượng liên tục |
| Chuyển đổi ADC/DAC (nếu có) | Mixed-signal | Ranh giới analog–số |
| **B08 — Bộ ghép kênh 8→1 và tách kênh 1→8 dùng chung đường chọn** | **Digital, tổ hợp** | Đầu ra chỉ phụ thuộc đầu vào hiện tại; không clock, không ô nhớ |
| Tầng xử lý phía sau | Digital | Tiêu thụ kết quả của B08 |

Bằng chứng cho dòng phân loại của B08: tổng hợp thật cho **0 flip-flop**
(`06_GDSII/synthesis/synth_stat.txt`).

---

**Truy vết:** yêu cầu sinh từ tài liệu này được đánh số `REQ-B08-0xx` trong
`01_REQUIREMENT/requirements.md`, và truy vết đến bằng chứng trong `07_TRACEABILITY/RTM.csv`.

*Phiên bản: v1.0 · Ngày: 2026-09-24*
