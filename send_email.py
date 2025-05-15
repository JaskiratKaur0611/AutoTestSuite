import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import zipfile
import os

def zip_allure_report(report_dir='allure-report', zip_file='allure-report.zip'):
    """Zips the Allure report directory."""
    with zipfile.ZipFile(zip_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(report_dir):
            for file in files:
                full_path = os.path.join(root, file)
                arcname = os.path.relpath(full_path, report_dir)
                zipf.write(full_path, arcname)
    print(f"Allure report zipped as {zip_file}")

def send_email(zip_path):
    """Sends an email with the Allure report zip as an attachment."""
    sender_email = "jaskiratkaur0611@gmail.com"
    receiver_email = "jaskkaur03@gmail.com"
    password = "smql eipb jyck qnqd"  # (not your Gmail password, use App password)

    msg = MIMEMultipart()
    msg['From'] = sender_email
    msg['To'] = receiver_email
    msg['Subject'] = "Robot Framework Test Report"

    body = "Hello,\n\nThe Robot Framework automation run has been completed.\n\nPlease find the results attached.\n\nThank you!"
    msg.attach(MIMEText(body, 'plain'))

    # Attach zip file
    with open(zip_path, "rb") as f:
        part = MIMEBase('application', 'zip')
        part.set_payload(f.read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition', f'attachment; filename="{os.path.basename(zip_path)}"')
        msg.attach(part)

    # Send mail
    with smtplib.SMTP_SSL('smtp.gmail.com', 465) as server:
        server.login(sender_email, password)
        server.send_message(msg)
        print("Email sent!")

if __name__ == "__main__":
    zip_file = 'allure_report.zip'
    zip_allure_report(zip_file=zip_file)
    send_email(zip_path=zip_file)
