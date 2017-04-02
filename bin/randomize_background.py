#  Calls Feh, puts a randomized image on the background, and changes
# the image every 5 minutes.

import os
import glob
import subprocess
import time
import random

images = glob.glob('/home/bjorn/.i3/wallpallers/*')

first = images[0]

delay = 2

while True:
    #randomize the order.
    #Ensure that we don't have the same first element as the last element.
    while first== images[0]:
        random.shuffle(images)

    for image in images:
        feh = subprocess.Popen(['feh', '--bg-fill', image])
        time.sleep(delay * 60)

        #record the last image.
        first = image

        #be a nice guy.
        feh.terminate()
    random.shuffle(images)
