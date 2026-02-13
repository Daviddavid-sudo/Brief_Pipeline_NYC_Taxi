# 🚕 NYC Taxi Data Warehouse – Data Engineering Project

## 📌 Context

The **NYC Taxi & Limousine Commission (TLC)** publishes monthly yellow taxi trip data in Parquet format.  
This open dataset is widely used in the industry to practice large-scale data processing and modern ELT architectures.

In this project, you act as a **Data Engineer** tasked with building an analytical Data Warehouse for a transportation company.

---

## 🎯 Objective

Design and implement a complete ELT pipeline to:

1. Ingest raw Parquet data
2. Clean and validate data quality issues
3. Transform and enrich trip data
4. Deliver business-ready analytical tables

---

## ⚠️ Data Quality Challenges

The dataset contains real-world issues:

- 15.54% missing values  
- 4.15% negative amounts  
- 2.62% zero-distance trips  
- Extreme outliers (distance > 1000 miles)

These anomalies require strong validation and cleaning logic.

---

## 🏗️ Target Architecture (Snowflake)

Database: `NYC_TAXI_DB`


### RAW
- Direct load from Parquet files
- No modification
- Source of truth

### STAGING
- Null handling
- Removal of negative amounts
- Filtering extreme distances
- Feature engineering:
  - Trip duration
  - Average speed
  - Time-of-day categorization

### FINAL
- Daily revenue summaries
- Zone-based analysis
- Hourly demand patterns
- Operational KPIs

---

## 🛠️ Tech Stack

- Snowflake  
- SQL  
- dbt Core (advanced option)  
- Python  
- GitHub Actions (advanced option)  
- Parquet  

---

## 📚 Project Structure

### PART 1 – Core (Mandatory)

- Configure Snowflake (warehouse, database, schemas)
- Load data using external stage
- Analyze data quality
- Implement cleaning & transformation logic in SQL
- Build analytical tables

### PART 2 – Advanced Options

**Option A – dbt Industrialization**
- Staging / intermediate / marts models
- Data quality tests
- Auto-generated documentation

**Option B – GitHub Actions Orchestration**
- Monthly automated execution
- Secure secret management
- Pipeline automation

---

## 📊 Example KPIs

- Total daily revenue  
- Average trip distance  
- Average speed  
- Revenue by zone  
- Peak hours analysis  

---

## 📦 Deliverables

1. Snowflake database `NYC_TAXI_DB` with:
   - RAW schema populated  
   - STAGING schema cleaned  
   - FINAL schema ready for analytics  

2. Documented SQL scripts  
3. Functional README (this file)  

---

## 🧠 Learning Outcomes

- Data Warehouse architecture design  
- ELT pipeline implementation  
- Data quality management  
- SQL transformations at scale  
- Industrialization with dbt  
- CI/CD automation for data pipelines  

---

## ⏳ Duration

Estimated time: **3 days**

---

## ✅ Evaluation

**Core (70%)**
- Functional architecture
- SQL quality
- Data cleaning relevance
- Demonstration

**Advanced (30%)**
- dbt or orchestration implementation
- Data testing quality
- Automation relevance

---

This project simulates a real-world Data Engineering use case, focusing on scalability, robustness, and production-ready analytics.
