# 📊 Attendance Streaming Data Pipeline & Analytics System

## 👤 Student Details
- **Name:** Abhinav Singh  
- **Roll No:** 23051398  
- **Department:** Computer Science and Engineering  

---

## 📌 Project Overview
This project implements a **real-time attendance tracking and analytics system** using modern data engineering tools. It simulates streaming attendance data, processes it using distributed systems, and provides analytical insights through SQL and dashboards.

---

## 🎯 Problem Statement
Traditional attendance systems are:
- Manual and error-prone  
- Not scalable  
- Lack real-time insights  

This project solves these issues by building a **streaming-based automated attendance system** with analytics.

---

## 💡 Solution
The system:
- Streams attendance data using **Kafka**
- Processes data using **Spark Streaming**
- Orchestrates workflows using **Apache Airflow**
- Stores structured data for analysis
- Uses **SQL (Basic → Advanced)** for insights
- Visualizes results via dashboards

---

## 🏗️ System Architecture


CSV Data → Kafka Producer → Kafka Topic → Spark Streaming → Processed Data → SQL Analysis → Dashboard
↑
Airflow DAG (Automation)


---

## 🛠️ Tech Stack

| Category | Tools Used |
|--------|-----------|
| Language | Python |
| Streaming | Apache Kafka |
| Processing | Apache Spark |
| Orchestration | Apache Airflow |
| Database | MySQL |
| Visualization | Matplotlib / Jupyter |
| Version Control | Git & GitHub |

---

## 📂 Project Structure


attendance_project/
│
├── airflow_dags/ # Airflow DAGs for pipeline orchestration
├── scripts/ # Kafka Producer & Spark Streaming scripts
├── data/
│ ├── raw/ # Raw CSV data
│ └── processed/ # Cleaned datasets
├── sql/ # SQL queries (Basic, Intermediate, Advanced)
├── dashboard/ # Jupyter Notebook for visualization
├── Screenshots/ # Output images
└── README.md


---

## 🔄 Workflow Explanation

1. **Data Ingestion**
   - CSV attendance data is streamed using Kafka Producer

2. **Streaming Layer**
   - Kafka handles real-time data flow

3. **Processing Layer**
   - Spark Streaming processes incoming data

4. **Orchestration**
   - Airflow automates pipeline execution

5. **Storage**
   - Cleaned data stored for querying

6. **Analytics**
   - SQL queries generate insights:
     - Attendance %
     - Top students
     - Defaulters
     - Course-wise performance

7. **Visualization**
   - Dashboard shows insights using graphs

---

## 🧠 SQL Analysis

### ✔ Basic Queries
- SELECT, WHERE, JOIN  
- Student attendance records  

### ✔ Intermediate Queries
- GROUP BY, HAVING  
- Course-wise attendance analysis  

### ✔ Advanced Queries
- Window Functions (RANK)  
- Top students by attendance  
- Performance ranking  

---

## 🗂️ ER Diagram

The system includes the following entities:

- **Students**
- **Courses**
- **Faculty**
- **Attendance**
- **Student_Course_Map**

### Key Relationships:
- Students enroll in Courses (M:N)
- Faculty teaches Courses (1:N)
- Attendance linked to Student & Course

---

## 📸 Output Screenshots
Screenshots of:
- SQL query outputs  
- Dashboard visualizations  
are included in the `/Screenshots` folder.

---

## ⭐ Unique Features
- Real-time streaming using Kafka  
- Automated pipeline via Airflow  
- Scalable Spark processing  
- Multi-level SQL analytics  
- End-to-end data engineering workflow  

---

## 🚀 Future Improvements
- Real-time dashboard (Power BI / Streamlit)  
- Cloud deployment (AWS / Azure)  
- Machine learning for attendance prediction  
- Mobile app integration  

---

## ▶️ How to Run

1. Start Zookeeper & Kafka  
2. Run Airflow Scheduler & Webserver  
3. Trigger DAG  
4. Run Kafka Producer  
5. Execute Spark Streaming job  
6. Run SQL queries / dashboard  

---

## 📎 GitHub Repository
👉 [Project Repository Link](https://github.com/AlphaKing-GenAlpha-2004/attendance-stream-pipeline)

---

## ⚠️ Disclaimer
This project is developed as an **individual academic submission**. All implementations are original and based on course learning.

---

## 🙌 Acknowledgement
Guidance and concepts are based on training sessions and academic curriculum.

---
