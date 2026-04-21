from kafka import KafkaProducer
import pandas as pd
import json
import time

# ----------------------------
# CONFIG
# ----------------------------
KAFKA_TOPIC = "attendance_topic"
KAFKA_SERVER = "localhost:9092"

CSV_PATH = "/mnt/c/Users/KIIT0001/OneDrive/Desktop/attendence_project/data/raw/attendance_details.csv"

# ----------------------------
# CREATE PRODUCER
# ----------------------------
producer = KafkaProducer(
    bootstrap_servers=KAFKA_SERVER,
    value_serializer=lambda v: json.dumps(v).encode("utf-8")
)

# ----------------------------
# LOAD CSV
# ----------------------------
df = pd.read_csv(CSV_PATH)

print("Starting Kafka Producer...")

# ----------------------------
# SEND DATA
# ----------------------------
for _, row in df.iterrows():
    data = {
        "student_id": int(row["student_id"]),
        "course_id": int(row["course_id"]),
        "attendance_date": str(row["attendance_date"]),
        "status": str(row["status"])
    }

    producer.send(KAFKA_TOPIC, value=data)
    print("Sent:", data)

    time.sleep(0.2)   # simulate streaming

producer.flush()
print("All data sent successfully!")