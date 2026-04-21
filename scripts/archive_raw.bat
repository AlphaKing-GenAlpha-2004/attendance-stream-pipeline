@echo off

cd /d "C:\Users\KIIT0001\OneDrive\Desktop\attendence_project"

move /Y data\raw\*.csv data\archive\

echo %date% %time% - Archived raw CSV files >> logs\pipeline.log

pause