import glob
import cv2


ff = glob.glob("./samples/*.jpg")
ff_sorted = sorted([f"./samples/{int(f.split('/')[-1].split('-')[0]):06d}-images.jpg" for f in ff])

img_array = []
size = None
for filename in ff_sorted:
    img = cv2.imread(f"./samples/{int(filename.split('/')[-1].split('-')[0])}-images.jpg")
    height, width, layers = img.shape
    size = (width, height)
    img_array.append(img)

out = cv2.VideoWriter("project.mp4", cv2.VideoWriter_fourcc(*"mp4v"), 3, size)

for i in range(len(img_array)):
    out.write(img_array[i])
    out.release()
