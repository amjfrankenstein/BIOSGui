import subprocess
import os
from guizero import *

def dpscan():
    process = subprocess.Popen("scripts/dp/dpscan.sh")
def dpsingleread():
    process = subprocess.Popen("scripts/dp/dpsingleread.sh")

def dpfullread():
    process = subprocess.Popen("scripts/dp/dpfullread.sh")

def dpwipe():
    process = subprocess.Popen("scripts/dp/dpwipe.sh")

def dpwrite():
    process = subprocess.Popen("scripts/dp/dpwrite.sh")

def spiscan():
    process = subprocess.Popen("scripts/ls/lsscan.sh")

def spisingleread():
    process = subprocess.Popen("scripts/ls/lssingleread.sh")

def spifullread():
    process = subprocess.Popen("scripts/ls/lsfullread.sh")

def spiwipe():
    process = subprocess.Popen("scripts/ls/lswipe.sh")

def spiwrite():
    process = subprocess.Popen("scripts/ls/lswrite.sh")

def dplenfullunlock():
    process = subprocess.Popen("scripts/fu/lenovodediprog.sh")

def spilenfullunlock():
    process = subprocess.Popen("scripts/fu/lenovospi.sh")

def dphpfullunlock():
    process = subprocess.Popen("scripts/fu/hpdediprog.sh")

def spihpfullunlock():
    process = subprocess.Popen("scripts/fu/hpspi.sh")

def clearfiles():
    process = subprocess.Popen("scripts/clearfiles.sh")

def dellsite():
    process = subprocess.Popen("scripts/dellsite.sh")

def meclean():
    process = subprocess.Popen("scripts/meclean.sh")

def compare():
    process = subprocess.Popen("scripts/compare.sh")

def hppatch():
    process = subprocess.Popen("scripts/hppatch.sh")

def lenpatch():
    process = subprocess.Popen("scripts/lenpatch.sh")

app = App(bg="grey", title="Alta E-Solutions BIOS HAX", height=600, width=900, layout="grid")

picture1 = Picture(app, grid=[0,0,2,3], image="media/alogo.png")

box1 = Box(app, width=300, height=300, grid=[0,0])
box4 = Box(app, width=300, height=300, grid=[0,1])
box2 = Box(app, width=300, height=300, grid=[1,0])
box5 = Box(app, width=300, height=300, grid=[1,1])
box3 = Box(app, width=300, height=300, grid=[2,0])
box6 = Box(app, width=300, height=300, grid=[2,1])
box1.bg = "#f5fff8"
box2.bg = "#bbc4bd"
box3.bg = "#f5fff8"
box4.bg = "#bbc4bd"
box5.bg = "#f5fff8"
box6.bg = "#bbc4bd"
text1 = Text(box1, size=24, color="#003800", text="Dediprog Menu")
text2 = Text(box2, size=24, color="#003800",text="Linux SPI Menu")
text3 = Text(box3, size=24, color="#003800", text="Lenovo Full Unlock")
text4 = Text(box4, color="#003800")
text6 = Text(box6, color="#003800")
##BOX1:::::::::::::::::::::::::::::::::::::::::::::::::::::
button1_1 = PushButton(box1, width=20, text="SF100 Scan Chip", command=dpscan)
button1_2 = PushButton(box1, width=20, text="SF100 Single Read", command=dpsingleread)
button1_3 = PushButton(box1, width=20, text="SF100 Full Read", command=dpfullread)
button1_4 = PushButton(box1, width=20, text="SF100 Erase Chip", command=dpwipe)
button1_5 = PushButton(box1, width=20, text="SF100 Write Chip", command=dpwrite)
button1_1.bg = "#b7c4b7"
button1_2.bg = "#ddeddd"
button1_3.bg = "#b7c4b7"
button1_4.bg = "#ddeddd"
button1_5.bg = "#b7c4b7"
##BOX2:::::::::::::::::::::::::::::::::::::::::::::::::::::
button2_1 = PushButton(box2, width=20, text="SPI:0 Scan Chip", command=spiscan)
button2_2 = PushButton(box2, width=20, text="SPI:0 Single Read", command=spisingleread)
button2_3 = PushButton(box2, width=20, text="SPI:0 Full Read", command=spifullread)
button2_4 = PushButton(box2, width=20, text="SPI:0 Erase Chip", command=spiwipe)
button2_5 = PushButton(box2, width=20, text="SPI:0 Write Chip", command=spiwrite)
button2_1.bg = "#b7c4b7"
button2_2.bg = "#ddeddd"
button2_3.bg = "#b7c4b7"
button2_4.bg = "#ddeddd"
button2_5.bg = "#b7c4b7"
##BOX3:::::::::::::::::::::::::::::::::::::::::::::::::::::
button3_1 = PushButton(box3, width=20, text="SF100  IBM Full Unlock", command=dplenfullunlock)
button3_2 = PushButton(box3, width=20, text="SPI:0 IBM Full Unlock", command=spilenfullunlock)
text5 = Text(box3, size=24, color="#003800", text="HP Full Unlock")
button3_3 = PushButton(box3, width=20, text="SF100 HP Full Unlock", command=dphpfullunlock)
button3_4 = PushButton(box3, width=20, text="SPI:0 HP Full Unlock", command=spihpfullunlock)
button3_1.bg = "#b7c4b7"
button3_2.bg = "#ddeddd"
button3_3.bg = "#b7c4b7"
button3_4.bg = "#ddeddd"
picture1 = Picture(box4, image="media/alogo.png")
##BOX4:::::::::::::::::::::::::::::::::::::::::::::::::::::
text6= Text(box5, size=15)
button5_1 = PushButton(box5, width=20, text="HP File Patch", command=hppatch)
button5_2 = PushButton(box5, width=20, text="Open Dell Unlock Site", command=dellsite)
button5_3 = PushButton(box5, width=20, text="Intel me_cleaner", command=meclean)
button5_4 = PushButton(box5, width=20, text="Compare 2 Files", command=compare)
button5_5 = PushButton(box5, width=20, text="Lenovo File Patch", command=lenpatch)
button5_6 = PushButton(box5, width=20, text="Clear Files/Reset", command=clearfiles)
button5_1.bg = "#b7c4b7"
button5_2.bg = "#ddeddd"
button5_3.bg = "#b7c4b7"
button5_4.bg = "#ddeddd"
button5_5.bg = "#b7c4b7"
button5_6.bg = "#ffadad"

picture2 = Picture(box6, image="media/alogo.png")

app.display()
