@echo off
setlocal

echo =====================================================
echo Cleaning previous results...
echo =====================================================
rmdir /s /q results
mkdir results

echo =====================================================
echo Starting Test Execution...
echo =====================================================
C:\Users\jaski\PycharmProjects\PythonProject1\.venv\Scripts\python.exe -m robot --listener allure_robotframework:results -d results tests/1_login_tests.robot
@REM C:\Users\jaski\PycharmProjects\PythonProject1\.venv\Scripts\python.exe -m robot --listener allure_robotframework;results -d results tests

if %errorlevel% neq 0 (
    echo =====================================================
    echo TEST EXECUTION FAILED!!
    echo =====================================================
) else (
    echo =====================================================
    echo TEST EXECUTION PASSED!!
    echo =====================================================
)

echo =====================================================
echo Generating Allure Report...
echo =====================================================
C:\Users\jaski\allure-2.34.0\allure-2.34.0\bin\allure.bat generate results --clean -o results/allure-report

echo Waiting for Allure files to be ready...
timeout /t 3

echo =====================================================
echo Opening Allure Report...
echo =====================================================
start "" cmd /c C:\Users\jaski\allure-2.34.0\allure-2.34.0\bin\allure.bat open results/allure-report

@REM timeout /t 2
@REM echo Now sending email...

echo =====================================================
echo Sending Email Notification...
echo =====================================================
C:\Users\jaski\PycharmProjects\PythonProject1\.venv\Scripts\python.exe send_email.py

echo =====================================================
echo Job Finished Successfully!!
pause
endlocal

