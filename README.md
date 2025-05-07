For Lesson Exercise 10 and Quiz 3, I developed a full data pipeline to automate the extraction, transformation, and loading of December 2023 website data. A Python script pulls session, order, and product data from a MySQL database and loads it into a raw schema in Postgres. This script is triggered every 15 minutes using a GitHub Actions workflow, with credentials securely managed via GitHub Secrets. I used dbt to transform the raw data into staging views with load timestamps, and then built warehouse tables that calculate daily session counts and repeat session rates broken down by UTM source. The entire project is version-controlled in GitHub and developed within GitHub Codespaces.


## Architecture Diagram

```mermaid
graph TD
    A[MySQL: Website Data] -->|Python Script| B[Postgres: Raw Schema]
    B -->|dbt: Staging Views| C[Staging Tables with Timestamps]
    C -->|dbt: Transform| D[Warehouse Tables]
    D -->|Metrics| E[Daily Session Counts & Repeat Rates]
    F[GitHub Actions] -->|Runs Every 15 Minutes| A
    G[GitHub Secrets] -->|Secure Credentials| F
