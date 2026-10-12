from datetime import datetime, timedelta

from airflow.sdk import DAG
from airflow.providers.standard.operators.bash import BashOperator

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "email_on_failure": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

with DAG(
    dag_id="dbt_postgres_pipeline",
    description="Orchestrate dbt transformations on PostgreSQL",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
    default_args=default_args,
    tags=["dbt", "postgres"],
) as dag:

    run_dbt = BashOperator(
        task_id="run_dbt_models",
        bash_command="""
        dbt run \
          --project-dir /opt/airflow/dbt \
          --profiles-dir /opt/airflow/dbt
        """,
    )

    test_dbt = BashOperator(
        task_id="test_dbt_models",
        bash_command="""
        dbt test \
          --project-dir /opt/airflow/dbt \
          --profiles-dir /opt/airflow/dbt
        """,
    )

    run_dbt >> test_dbt