import os
import shutil

def clean_allure_results(results_dir='results/allure', allure_dir='allure-report', videos_dir='videos'):
    """Removes old Allure result files."""
    if os.path.exists(results_dir):
        shutil.rmtree(results_dir)
    os.makedirs(results_dir)  # Recreate the folder for fresh results
    if os.path.exists(allure_dir):
        shutil.rmtree(allure_dir)
    if os.path.exists(videos_dir):
        shutil.rmtree(videos_dir)
    os.makedirs(videos_dir)
    print("Old Allure results folder cleaned!")


if __name__ == "__main__":
    clean_allure_results()