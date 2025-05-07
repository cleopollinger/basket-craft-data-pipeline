# Website Data Pipeline – Lesson Exercise 10 & Quiz 3

This project implements a full end-to-end data pipeline to automate the extraction, transformation, and loading (ETL) of December 2023 website data.

## Overview

A Python script retrieves session, order, and product data from a **MySQL** database and loads it into a **raw schema in Postgres**. The pipeline automates this process and includes transformation logic to prepare the data for analysis.

## Features

* **Data Extraction & Loading**

  * Pulls session, order, and product data from MySQL.
  * Loads raw data into Postgres on a regular schedule.

* **Automation**

  * Script execution is automated with **GitHub Actions**, running every **15 minutes**.
  * Database credentials are securely managed via **GitHub Secrets**.

* **Data Transformation**

  * Uses **dbt (data build tool)** to:

    * Create **staging views** with load timestamps.
    * Build **warehouse tables** that:

      * Calculate **daily session counts**.
      * Compute **repeat session rates**, segmented by **UTM source**.

* **Development & Version Control**

  * Entire project is developed in **GitHub Codespaces**.
  * All code is tracked and managed with **Git version control** in GitHub.

## Technologies Used

* Python
* MySQL
* Postgres
* GitHub Actions
* GitHub Secrets
* dbt
* GitHub Codespaces

## Architecture Diagram

```mermaid
graph TD
    A[MySQL: Website Data] -->|Python Script| B[Postgres: Raw Schema]
    B -->|dbt: Staging Views| C[Staging Tables with Timestamps]
    C -->|dbt: Transform| D[Warehouse Tables]
    D -->|Metrics| E[Daily Session Counts & Repeat Rates]
    F[GitHub Actions] -->|Runs Every 15 Minutes| A
    G[GitHub Secrets] -->|Secure Credentials| F
