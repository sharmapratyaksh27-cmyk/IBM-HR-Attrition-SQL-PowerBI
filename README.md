# 📊 Workforce Attrition Insights: HR Analytics Portfolio Project

## 📝 Overview
Employee turnover is a massive expense for organizations. This project analyzes a simulated HR dataset from IBM to identify the root causes of employee attrition. By uncovering these drivers, the business can implement targeted retention strategies to save costs and improve workplace culture. 

This project encompasses the entire data analytics workflow, from raw data extraction and cleaning using **SQL** to building an interactive, dark-mode data visualization dashboard in **Power BI**.

## 🛠️ Tech Stack & Tools
* **Database Engine:** SQL (MySQL / PostgreSQL) for data exploration, cleaning, and complex aggregations.
* **Data Visualization:** Power BI
* **UI/UX Design:** Custom "Spotify/IBM" inspired dark-theme aesthetic designed to reduce stakeholder eye strain and highlight critical metrics.
* **Dataset:** IBM HR Employee Attrition & Performance Dataset (1,470 records, 35 distinct variables).

## 🗂️ Project Workflow

### Phase 1: Data Modeling & SQL Extraction
The raw CSV data was imported into a relational database. I wrote advanced SQL queries using `CTEs`, `CASE WHEN` statements, `Window Functions`, and multi-column `GROUP BY` clauses to segment the workforce and identify churn drivers.
* *View the SQL scripts here:* https://github.com/sharmapratyaksh27-cmyk/IBM-HR-Attrition-SQL-PowerBI

### Phase 2: Interactive Dashboard Design
I connected Power BI directly to the dataset to visualize the findings. The dashboard features:
* Dynamic filtering by Department, Job Role, and Gender via left-hand navigation slicers.
* High-level KPI cards for instant executive summaries.
* Conditional formatting to emphasize high-risk cohorts.

## 📸 Dashboard Preview
[HR_Attrition_Analysis.pdf](https://github.com/user-attachments/files/29756278/HR_Attrition_Analysis.pdf)

## 💡 Key Business Insights
1. **The Burnout Factor:** Employees who are required to work frequent overtime have an attrition rate of **30.5%**, which is significantly higher than those who do not (**10.4%**).
2. **Departmental Flight Risk:** The **Sales department** struggles the most with retention, showing a notably higher turnover rate compared to Research & Development.
3. **The Pay Gap:** Across several job roles (e.g., Sales Representatives and Laboratory Technicians), the data reveals that employees who churned were consistently paid less on average than those who stayed.
4. **Career Stagnation:** A noticeable spike in attrition occurs when employees hit the 2-year and 3-year marks without receiving a formal promotion.

## 🎯 Strategic Recommendations
Based on the data, I recommend the following actionable strategies for the HR and Executive teams:
* **Implement Overtime Caps:** Restrict weekly overtime hours, specifically in the Sales department, to prevent burnout.
* **Market Salary Adjustments:** Conduct an immediate compensation review for high-risk roles (like Sales Representatives) to ensure base salaries are highly competitive.
* **Revamp the Promotion Cycle:** Introduce intermediate job titles, milestone bonuses, or clearer career roadmaps for employees approaching their 2-year anniversary in a single role.

## 👨‍💻 How to Use This Repository
1. Clone the repository to your local machine.
2. Review the `HR_Attrition_Analysis.sql` file to see the queries used for data extraction.
3. Open the `.pbix` file (if provided) or view the PDF/PNG dashboard export to interact with the visualizations.
