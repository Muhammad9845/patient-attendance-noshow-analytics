# Patient Attendance & No-Show Analytics Dashboard

A professional, production-ready **Power BI Dashboard** analyzing patient appointment attendance behaviors, demographic trends, and the operational impact of SMS reminder delivery. This project translates raw healthcare operational data into actionable insights to help clinical administrators optimize appointment capacity and mitigate lost revenue from no-shows.

## 📊 Live Dashboard Preview
* 📊 **Overall No-Show Rate:** 20%
* 📅 **Total Scheduled Appointments Analyzed:** 110,527
* 🚫 **Total Absenteeism (No-Shows):** 22,319

---

## 💡 Key Business Insights

* **The Youth Attendance Gap:** Demographics play a critical role in clinical compliance. **Teens (22%)** and **Young Adults (23%)** exhibit the highest operational no-show rates. Conversely, **Seniors (16%)** are the most reliable demographic group, presenting a massive opportunity to optimize booking windows based on age groups.
* **Volume Contribution:** While Young Adults have a high *percentage* of no-shows, the **Adult** demographic contributes the largest absolute *volume* of total missed appointments due to their high baseline scheduling footprint.
* **Operational Opportunity:** With a blanket **20% No-Show Rate** across 110k+ appointments, scheduling infrastructure could benefit from predictive overbooking models or targeted follow-up strategies geared specifically toward patients under the age of 30.

---

## 🎨 Dashboard Design & Visual Architecture

The dashboard was built following strict business intelligence UI/UX best practices:
* **Strict Color Context:** A cohesive 4-color palette was designed exclusively to isolate and map the 4 distinct age groups seamlessly across all visuals (**Teens:** Soft Teal, **Young Adults:** Slate Blue, **Adults:** Muted Plum, **Seniors:** Charcoal Gray).
* **Semantic Signaling:** Fibrant warning colors (Red) were strictly stripped away from standard demographic variables and exclusively reserved for critical operational KPIs (Total No-Shows) to anchor executive focus immediately.
* **Visual Symmetry:** Structured around clean gridlines separating high-level KPI cards, categorical analysis (Gender & SMS impacts), and core demographic cross-filtering visuals.

---

## 🛠️ Data Stack & Technical Workflow

1. **Database Querying (SQL):** Aggregated relational tables, structured consecutive date trends, and cleaned patient parameters prior to model ingestion.
2. **Data Modeling (Power BI DAX):** Authored explicit measures for total appointments, no-show counts, and dynamic attendance margins.
3. **Report Authoring:** Built highly synchronized interactive tiles, custom multi-state filter slicers, and color-mapped column arrays.

---

## 📈 Future Recommendations
* **Targeted Interventions:** Deploy localized SMS/call cadence strategies tailored specifically for the under-30 brackets (Teens & Young Adults).
* **Predictive Booking:** Introduce a machine learning-backed overbooking threshold in clinics with high proportions of young adult registrations.

---
*Developed as part of a professional Data Analytics portfolio. Feedback and optimization suggestions are welcome!*
