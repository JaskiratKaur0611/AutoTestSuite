import subprocess
import time
import os
import sys

from datetime import datetime
timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
output_file = f'videos/test_run_{timestamp}.mp4'
process = None

def start_recording():
    global process
    # if not os.path.exists("videos"):
    #     os.makedirs("videos")

    process = subprocess.Popen([
        'ffmpeg',
        '-y',
        '-video_size', '640x480',  # Lower resolution
        '-framerate', '5',  # Lower frame rate
        '-f', 'gdigrab' if os.name == 'nt' else 'x11grab',
        '-i', 'desktop' if os.name == 'nt' else ':0.0',
        '-preset', 'ultrafast',  # Reduce CPU encoding load
        '-tune', 'zerolatency',
        '-c:v', 'libx264',
        '-crf', '35',  # Compress more (larger number = smaller file)
        output_file
    ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    with open("videos/pid.txt", "w") as f:
        f.write(str(process.pid))

def stop_recording():
    try:
        with open("videos/pid.txt", "r") as f:
            pid = int(f.read())
        import signal
        os.kill(pid, signal.SIGINT)
    except Exception as e:
        print("Error stopping recording:", e)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python video_recorder.py [start|stop]")
    elif sys.argv[1] == "start":
        start_recording()
    elif sys.argv[1] == "stop":
        stop_recording()
