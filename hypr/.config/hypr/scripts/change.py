import configparser
import os

config_files = "/home/nyx/.config/hypr/conf/configs_sets.ini"
hypr_visual = "/home/nyx/.config/hypr/conf/visual.conf"
hypr_paper = "/home/nyx/.config/hypr/hyprpaper.conf"
waybar = "/home/nyx/.dotfiles/waybar/style.css"

config = configparser.ConfigParser()
config.read(config_files)

print("Configuraciones disponibles")
for seccion in config.sections():
    print(f"{config.sections().index(seccion)+1}: {seccion}")


while True:
    option = input("Escribe el numero de la configuracion: ")
    option = int(option) - 1
    if option < len(config.sections()) and option >= 0:
        config_name = config.sections()[option]
        break
    print("Indice invalido")

def hyprland_write(file, file_lines, property_one, property_two):
    with open(file, 'w') as file:
        property_one_modified = False
        property_two_modified = False
        for line in file_lines:
            if f"${property_one}" in line and not property_one_modified:
                file.write(f"${property_one} = {config[config_name][property_one]}\n")
                property_one_modified = True
            elif f"${property_two}" in line and not property_two_modified:                
                file.write(f"${property_two} = {config[config_name][property_two]}\n")
                property_two_modified = True
            else:
                file.write(line)

<<<<<<< HEAD
def obtain_each_line(dir):
    with open(dir, 'r') as file:
        return file.readlines()

hypr_visual_lines = obtain_each_line(hypr_visual)
hypr_paper_lines = obtain_each_line(hypr_paper)
waybar_lines = obtain_each_line(waybar)

hyprland_write(hypr_visual, hypr_visual_lines, "active_border_one", "active_border_two")
hyprland_write(hypr_paper, hypr_paper_lines, "wallpaper_one", "wallpaper_two")

with open(waybar, 'w') as file:
    for line in range(len(waybar_lines)):
        actual_line = waybar_lines[line].split()
        if len(actual_line) > 0 and actual_line[0] == "@define-color":
            color_name = waybar_lines[line].split()[1]
            color = config[config_name][color_name]
            file.write(f"@define-color {color_name} rgb {color};\n")
        # elif len(actual_line) > 0 and "{" in actual_line:
        #     actual_indent = []
        #     index = 0
        #     while True:
        #         indent_line = waybar_lines[line + index].split()
        #         if "}" in indent_line:
        #             actual_line.append(waybar_lines[line + index])
        #             break
        #         else:
        #             actual_line.append(waybar_lines[line+index])
        #             index += 1
            
=======
# Change the borders in visual.conf
with open(hypr_visual, 'w') as file:
    borders = [0, 0]
    for line in visual_lines:
        if "$active_border_one" in line and not borders[0]:
            file.write(f"$active_border_one = {config[config_name]["active_border_one"]}\n")
            borders[0] = 1
        elif "$active_border_two" in line and not borders[1]:
            file.write(f"$active_border_two = {config[config_name]["active_border_two"]}\n")
            borders[1] = 1
>>>>>>> c80c438 (Hyprland theme script change)
        else:
            file.write(waybar_lines[line])

<<<<<<< HEAD
os.system("hyprctl reload > nul")
os.system(f"hyprctl hyprpaper wallpaper \"DP-1,{config[config_name]["wallpaper_one_dir"]}\" > nul")
os.system(f"hyprctl hyprpaper wallpaper \"HDMI-A-1,{config[config_name]["wallpaper_two_dir"]}\" > nul")
os.system(f"~/.dotfiles/waybar/launch.sh & diswon > nul")
=======
# Change the wallpaper
with open(hypr_paper, 'w') as file:
    wallpapers = [0, 0]
    for line in paper_lines:
        if "$wallpaper_one" in line and not wallpapers[0]:
            file.write(f"$wallpaper_one = {config[config_name]["wallpaper_one"]}\n")
            wallpapers[0] = 1
        elif "$wallpaper_two" in line and not wallpapers[1]:
            file.write(f"$wallpaper_two = {config[config_name]["wallpaper_two"]}\n")
            wallpapers[1] = 1
        else:
            file.write(line)


os.system("hyprctl reload > nul")
os.system(f"hyprctl hyprpaper wallpaper \"DP-1,{config[config_name]["wallpaper_one_dir"]}\" > nul")
os.system(f"hyprctl hyprpaper wallpaper \"HDMI-A-1,{config[config_name]["wallpaper_two_dir"]}\" > nul")
>>>>>>> c80c438 (Hyprland theme script change)
