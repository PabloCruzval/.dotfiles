import configparser
import os

config_files = "/home/nyx/.config/hypr/conf/configs_sets.ini"
hypr_visual = "/home/nyx/.config/hypr/conf/visual.conf"
hypr_paper = "/home/nyx/.config/hypr/hyprpaper.conf"

config = configparser.ConfigParser()
config.read(config_files)

print("Configuraciones disponibles")
for seccion in config.sections():
    print(f"{seccion}")


while True:
    option = input("Escribe el nombre de la configuracion: ")
    if option in config.sections():
        break
    print("Nombre invalido")

# Obtain each line from the hyprland files
with open(hypr_visual, 'r') as file:
    visual_lines = file.readlines()
with open(hypr_paper, 'r') as file:
    paper_lines = file.readlines()

# Change the borders in visual.conf
with open(hypr_visual, 'w') as file:
    borders = [0, 0]
    for line in visual_lines:
        if "$active_border_one" in line and not borders[0]:
            file.write(f"$active_border_one = {config[option]["active_border_one"]}\n")
            borders[0] = 1
        elif "$active_border_two" in line and not borders[1]:
            file.write(f"$active_border_two = {config[option]["active_border_two"]}\n")
            borders[1] = 1
        else:
            file.write(line)

# Change the wallpaper
with open(hypr_paper, 'w') as file:
    wallpapers = [0, 0]
    for line in paper_lines:
        if "$wallpaper_one" in line and not wallpapers[0]:
            file.write(f"$wallpaper_one = {config[option]["wallpaper_one"]}\n")
            wallpapers[0] = 1
        elif "$wallpaper_two" in line and not wallpapers[1]:
            file.write(f"$wallpaper_two = {config[option]["wallpaper_two"]}\n")
            wallpapers[1] = 1
        else:
            file.write(line)


os.system("hyprctl reload")
os.system(f"hyprctl hyprpaper wallpaper \"DP-1,{config[option]["wallpaper_one_dir"]}\"")
os.system(f"hyprctl hyprpaper wallpaper \"HDMI-A-1,{config[option]["wallpaper_two_dir"]}\"")
