import os
scriptdir= os.getenv('SCRIPTSDIR')
filedirpath=f"{scriptdir}/tmp_resources"
filepath=f"{scriptdir}/tmp_resources/containers.txt"

if not os.path.exists(filepath):
    print("containers.txt does not exist, quitting")
    exit()

file = open(filepath)

for line in file:
    print(f"Killing {line}", end="")
    os.system(f'docker kill {line}')
    print("")
    print(f"Removing {line}", end="")
    os.system(f'docker rm {line}')
    print("")

print(f"Deleting {filepath}")
os.remove(filepath)
os.rmdir(filedirpath)
