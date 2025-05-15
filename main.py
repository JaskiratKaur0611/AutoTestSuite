import os
import shutil
import subprocess
from send_email import zip_allure_report, send_email

# Step 1: Cleanup old results
if os.path.exists('results/allure'):
    shutil.rmtree('results/allure')

# Step 2: Run Robot Tests
subprocess.run([
    'robot',
    '--listener', 'allure_robotframework:results/allure',
    'tests/1_login_tests.robot'
])

# Step 3: Generate Allure HTML report
subprocess.run(['allure', 'generate', 'results/allure', '-o', 'allure-report', '--clean'])

# Step 4: Zip and Email Report
zip_allure_report('allure-report', 'allure_report.zip')
send_email('allure_report.zip')
