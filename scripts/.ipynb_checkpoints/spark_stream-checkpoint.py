from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col
from pyspark.sql.types import StructType, IntegerType, StringType

spark = SparkSession.builder \
    .appName("KafkaAttendanceStream") \
    .config("spark.sql.streaming.metricsEnabled", "false") \
    .getOrCreate()

schema = StructType() \
    .add("student_id", IntegerType()) \
    .add("course_id", IntegerType()) \
    .add("attendance_date", StringType()) \
    .add("status", StringType())

df = spark.readStream \
    .format("kafka") \
    .option("kafka.bootstrap.servers", "localhost:9092") \
    .option("subscribe", "attendance_topic") \
    .option("startingOffsets", "earliest") \
    .load()

json_df = df.selectExpr("CAST(value AS STRING)")

parsed_df = json_df.select(
    from_json(col("value"), schema).alias("data")
).select("data.*")

query = parsed_df.writeStream \
    .format("console") \
    .outputMode("append") \
    .option("truncate", False) \
    .option("checkpointLocation", "/tmp/attendance_checkpoint") \
    .trigger(processingTime="5 seconds") \
    .start()

print("Spark Streaming Started...")
query.awaitTermination()