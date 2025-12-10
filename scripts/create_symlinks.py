import os
from dotenv import load_dotenv

load_dotenv("../dots/envfile_mac")
home = os.getenv("HOME")
dotfilesdir = os.getenv("DOTFILESDIR")
dotfiles = os.listdir(dotfilesdir)
homefiles = os.listdir(home)


print(dotfiles)


def confirm(prompt: str) -> bool:
    while True:
        answer = input(f"{prompt} ([y]/n) ")
        if answer in ('y', 'Y', ''):
            return True
        elif answer in ('n', 'N'):
            return False
        else:
            print("\n Invalid Option. Please Enter a Valid Option.")


for file in dotfiles:
    filename = f".{file}"
    src = f"{dotfilesdir}/{file}"
    dest = f"{home}/.{file}"
    install = confirm(f"Would you like to install {file}?")
    if install:
        if filename not in homefiles:
            print(f'File {file} does not exist. Adding to {home}')
            os.symlink(src, dest)
        else:
            replace = confirm(f"{file} already exists. Would you like to replace {file}?")
            if replace:
                print(f"You are removing {file}")
                os.remove(dest)
                os.symlink(src, dest)
            else:
                print(f"You are not removing {file}")
    else:
        print(f"Not installing {file}. Moving to next file")


