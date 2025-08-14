# Sales-Trend-Analysis-Using-Aggregations
# 🛒 Task 06 - Online Sales Analysis

**📌 Overview**  
Cleaned and analyzed `online_sales_extended` in MySQL to get **monthly revenue** & **order volume**.

---

**🗂 Steps**
- Created DB & used it  
- Converted `order_date` from text → DATE  
- Formatted dates as `dd-mm-yy`  
- Calculated monthly totals using `EXTRACT`, `SUM`, `COUNT(DISTINCT)`  

---

**🛠 Key Functions Used**
- `EXTRACT(YEAR/MONTH FROM order_date)` → Get year & month  
- `SUM(amount)` → Total revenue  
- `COUNT(DISTINCT order_id)` → Unique orders  
- `DATE_FORMAT()` → Custom date display  

---

**💡 Insights Generated**
- Monthly revenue trends  
- Monthly order volume trends  
- Clean standardized dates for analysis  

---

**📊 Sample Output**
| Year | Month | Revenue | Orders |
|------|-------|---------|--------|
| 2024 | 2     | 6550    | 3      |
| 2024 | 3     | 8344    | 4      |  

**Summary:** Feb 2024 had 3 orders with ₹6,550 revenue; Mar 2024 had 4 orders with ₹8,344 revenue.

---

**🚀 How to Run**
1. Import CSV into MySQL Workbench  
2. Run `task_06.sql` step-by-step  
3. View results in the Results Grid  
