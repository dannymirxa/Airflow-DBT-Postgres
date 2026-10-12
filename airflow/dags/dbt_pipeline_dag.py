from datetime import datetime

from airflow.sdk import DAG
from airflow.providers.standard.operators.bash import BashOperator

with DAG(
    dag_id="dbt_postgres_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
) as dag:

# Task 0: Install dbt packages (downloads Elementary)
    dbt_deps = BashOperator(
        task_id='dbt_deps',
        bash_command='dbt deps --project-dir /opt/airflow/dbt/ --profiles-dir /opt/airflow/dbt/',
    )

    # Task 1: Build Elementary's internal monitoring tables in PostgreSQL
    run_elementary = BashOperator(
        task_id='run_elementary_models',
        bash_command='dbt run --select elementary --project-dir /opt/airflow/dbt/ --profiles-dir /opt/airflow/dbt/',
    )

    # Task 2: Run your project's dbt models (staging views and marts)
    run_dbt = BashOperator(
        task_id='run_dbt_models',
        bash_command='dbt run --project-dir /opt/airflow/dbt/ --profiles-dir /opt/airflow/dbt/',
    )

    # Task 3: Run dbt data quality tests (this populates test results)
    test_dbt = BashOperator(
        task_id='test_dbt_models',
        bash_command='dbt test --project-dir /opt/airflow/dbt/ --profiles-dir /opt/airflow/dbt/',
    )

    # Task 4: Generate the interactive Elementary observability report HTML (runs last)
    generate_elementary_report = BashOperator(
        task_id='generate_elementary_report',
        bash_command='edr report --project-dir /opt/airflow/dbt/ --profiles-dir /opt/airflow/dbt/ --file-path /opt/airflow/dbt//elementary_report.html',
    )

    # Strict execution chain ensures tables exist before report generation
    dbt_deps >> run_elementary >> run_dbt >> test_dbt >> generate_elementary_report