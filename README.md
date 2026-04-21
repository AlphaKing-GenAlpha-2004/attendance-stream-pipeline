# 📊 Attendance Tracking System

## 👤 Student Details
- **Name:** Abhinav Singh  
- **Roll No:** 23051398  
- **Department:** Computer Science and Engineering  

---

## 📌 Project Overview
The Attendance Tracking System is a modern, data-driven solution designed to automate and analyze student attendance efficiently. It leverages real-time data streaming, distributed processing, and SQL analytics to provide accurate and scalable attendance management.

---

## 🎯 Problem Statement
Traditional attendance systems face several challenges:
- Manual entry errors  
- Lack of real-time tracking  
- Limited scalability  
- Poor analytical capabilities  

This project aims to build a **scalable and automated attendance tracking system** with real-time processing and analytics.

---

## 💡 Solution
The system:
- Streams attendance data in real-time  
- Processes data using distributed computing  
- Automates workflows  
- Performs multi-level SQL analysis  
- Visualizes insights via dashboard  

---

## 🏗️ System Architecture


CSV Data → Kafka Producer → Kafka Topic → Spark Streaming → Processed Data → SQL Analysis → Dashboard
↑
Airflow DAG (Automation)


---

## 🛠️ Tech Stack

| Category | Tools |
|--------|------|
| Language | Python |
| Streaming | Apache Kafka |
| Processing | Apache Spark |
| Orchestration | Apache Airflow |
| Database | SQL |
| Visualization | Matplotlib, Jupyter |
| Version Control | Git, GitHub |

---

## 📂 Project Structure

- **attendance_project/**
  - **airflow_dags/** → Airflow DAGs for pipeline orchestration  
  - **scripts/** → Kafka Producer & Spark Streaming scripts  
  - **data/**
    - **raw/** → Raw input CSV files  
    - **processed/** → Cleaned & processed datasets  
  - **sql/**
    - Basic SQL Queries.sql  
    - Intermediate SQL Queries.sql  
    - Advanced SQL Queries.sql  
    - ETL Pipeline Verification.sql  
  - **dashboard/** → Jupyter Notebook for visualization  
  - **Screenshots/** → Output images (SQL + Dashboard)  
  - **README.md** → Project documentation 
---

## 🔄 Workflow

1. **Data Ingestion**
   - CSV data streamed using Kafka Producer  

2. **Streaming**
   - Kafka manages real-time data flow  

3. **Processing**
   - Spark Streaming processes incoming data  

4. **Automation**
   - Airflow DAG controls pipeline execution  

5. **Storage**
   - Processed data stored for analysis  

6. **Analytics**
   - SQL queries generate insights  

7. **Visualization**
   - Dashboard presents trends and KPIs  

---

## 🧠 SQL Analysis

### Basic
- Data retrieval and filtering  

### Intermediate
- Aggregation and grouping  

### Advanced
- Window functions (RANK)  
- Attendance percentage  
- Defaulter detection  

---

## 🗂️ ER Diagram

Entities:
- Students  
- Courses  
- Faculty  
- Attendance  
- Student_Course_Map  

Relationships:
- Students ↔ Courses (M:N)  
- Faculty → Courses (1:N)  
- Attendance linked to Student & Course  

---

## 📊 Dashboard Features

- Top students by attendance  
- Defaulters analysis (<75%)  
- Course-wise performance  
- Daily attendance trends  
- KPI summary  

---

## ⭐ Key Features

- Real-time streaming pipeline  
- Automated workflow using Airflow  
- Scalable data processing  
- Multi-level SQL analytics  
- Visual insights  

---

## 🚀 Future Enhancements

- Real-time dashboard (Streamlit / Power BI)  
- Cloud deployment (AWS / Azure)  
- Machine learning for prediction  
- Web/mobile interface  

---

## ▶️ How to Run

1. Start Kafka & Zookeeper  
2. Run Airflow Scheduler & Webserver  
3. Trigger DAG  
4. Run Kafka Producer  
5. Run Spark Streaming  
6. Execute SQL queries / Dashboard  

---

## 📎 GitHub Repository
👉 https://github.com/AlphaKing-GenAlpha-2004/attendance-stream-pipeline

---

## ⚠️ Disclaimer
This is an individual academic project developed based on course learning.

---

## 🙌 Acknowledgement
Guidance based on academic curriculum and training sessions.
