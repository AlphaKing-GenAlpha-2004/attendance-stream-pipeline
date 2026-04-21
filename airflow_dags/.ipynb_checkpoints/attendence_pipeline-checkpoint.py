from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

# ----------------------------
# DEFAULT CONFIG
# ----------------------------
default_args = {
    'owner': 'abhinav',
    'depends_on_past': False,
    'start_date': datetime(2024, 1, 1),
    'retries': 1,
}

# ----------------------------
# DAG DEFINITION
# ----------------------------
with DAG(
    dag_id='attendance_stream_pipeline',
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
    description='Kafka + Spark Streaming Pipeline',
) as dag:

    # ----------------------------
    # START ZOOKEEPER (ROBUST)
    # ----------------------------
    start_zookeeper = BashOperator(
        task_id='start_zookeeper',
        bash_command="""
        cd /mnt/c/kafka

        # Start only if not running
        pgrep -f zookeeper || (
          nohup bin/zookeeper-server-start.sh config/zookeeper.properties > zookeeper.log 2>&1 &
        )

        echo "Waiting for Zookeeper..."

        for i in {1..20}; do
          nc -z localhost 2181 && echo "Zookeeper is ready!" && exit 0
          sleep 2
        done

        echo "Zookeeper failed to start:"
        tail -20 zookeeper.log
        exit 1
        """
    )

    # ----------------------------
    # START KAFKA (ROBUST)
    # ----------------------------
    start_kafka = BashOperator(
        task_id='start_kafka',
        bash_command="""
        cd /mnt/c/kafka

        # Start only if not running
        pgrep -f kafka.Kafka || (
          nohup bin/kafka-server-start.sh config/server.properties > kafka.log 2>&1 &
        )

        echo "Waiting for Kafka..."

        for i in {1..20}; do
          nc -z localhost 9092 && echo "Kafka is ready!" && exit 0
          sleep 2
        done

        echo "Kafka failed to start:"
        tail -20 kafka.log
        exit 1
        """
    )

    # ----------------------------
    # CREATE TOPIC (SAFE)
    # ----------------------------
    create_topic = BashOperator(
        task_id='create_topic',
        bash_command="""
        cd /mnt/c/kafka

        bin/kafka-topics.sh --create \
        --topic attendance_topic \
        --bootstrap-server localhost:9092 \
        --partitions 1 \
        --replication-factor 1 || true

        echo "Topic ready"
        """
    )

    # ----------------------------
    # RUN PRODUCER
    # ----------------------------
    run_producer = BashOperator(
        task_id='run_producer',
        bash_command="""
        echo "Starting Producer..."
        sleep 3

        cd /mnt/c/Users/KIIT0001/OneDrive/Desktop/attendence_project
        python3 scripts/kafka_producer.py
        """
    )

    # ----------------------------
    # RUN SPARK STREAM
    # ----------------------------
    run_spark_stream = BashOperator(
        task_id='run_spark_stream',
        bash_command="""
        echo "Starting Spark Streaming..."

        cd /mnt/c/Users/KIIT0001/OneDrive/Desktop/attendence_project

        /mnt/c/spark/bin/spark-submit \
        --packages org.apache.spark:spark-sql-kafka-0-10_2.13:3.5.1 \
        scripts/spark_stream.py
        """
    )

    # ----------------------------
    # PIPELINE FLOW
    # ----------------------------
    start_zookeeper >> start_kafka >> create_topic >> run_producer >> run_spark_stream