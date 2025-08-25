#!/bin/bash

DOWNLOADS="$HOME/Downloads"

if [ ! -d "$DOWNLOADS" ]; then
    echo "Error: Downloads folder does not exist at $DOWNLOADS"
    exit 1
fi

cd "$DOWNLOADS" || exit 1

# Define master type mappings for common file extensions
declare -A EXT_TO_MASTER
# Images
EXT_TO_MASTER[jpg]="Images"
EXT_TO_MASTER[jpeg]="Images"
EXT_TO_MASTER[png]="Images"
EXT_TO_MASTER[gif]="Images"
EXT_TO_MASTER[bmp]="Images"
EXT_TO_MASTER[webp]="Images"
EXT_TO_MASTER[svg]="Images"
EXT_TO_MASTER[tiff]="Images"
EXT_TO_MASTER[tif]="Images"
EXT_TO_MASTER[ico]="Images"
EXT_TO_MASTER[heic]="Images"
EXT_TO_MASTER[raw]="Images"
EXT_TO_MASTER[psd]="Images"
# Videos
EXT_TO_MASTER[mp4]="Videos"
EXT_TO_MASTER[mov]="Videos"
EXT_TO_MASTER[avi]="Videos"
EXT_TO_MASTER[mkv]="Videos"
EXT_TO_MASTER[wmv]="Videos"
EXT_TO_MASTER[flv]="Videos"
EXT_TO_MASTER[webm]="Videos"
EXT_TO_MASTER[mpeg]="Videos"
EXT_TO_MASTER[mpg]="Videos"
EXT_TO_MASTER[m4v]="Videos"
EXT_TO_MASTER[3gp]="Videos"
# Audio
EXT_TO_MASTER[mp3]="Audio"
EXT_TO_MASTER[wav]="Audio"
EXT_TO_MASTER[flac]="Audio"
EXT_TO_MASTER[aac]="Audio"
EXT_TO_MASTER[ogg]="Audio"
EXT_TO_MASTER[m4a]="Audio"
EXT_TO_MASTER[wma]="Audio"
EXT_TO_MASTER[mid]="Audio"
EXT_TO_MASTER[midi]="Audio"
# Documents
EXT_TO_MASTER[pdf]="Documents"
EXT_TO_MASTER[doc]="Documents"
EXT_TO_MASTER[docx]="Documents"
EXT_TO_MASTER[txt]="Documents"
EXT_TO_MASTER[rtf]="Documents"
EXT_TO_MASTER[odt]="Documents"
EXT_TO_MASTER[md]="Documents"
EXT_TO_MASTER[epub]="Documents"
EXT_TO_MASTER[mobi]="Documents"
# Archives
EXT_TO_MASTER[zip]="Archives"
EXT_TO_MASTER[rar]="Archives"
EXT_TO_MASTER[tar]="Archives"
EXT_TO_MASTER[gz]="Archives"
EXT_TO_MASTER[7z]="Archives"
EXT_TO_MASTER[bz2]="Archives"
EXT_TO_MASTER[xz]="Archives"
EXT_TO_MASTER[tgz]="Archives"
EXT_TO_MASTER[iso]="Archives"
# Code
EXT_TO_MASTER[py]="Code"
EXT_TO_MASTER[js]="Code"
EXT_TO_MASTER[html]="Code"
EXT_TO_MASTER[css]="Code"
EXT_TO_MASTER[java]="Code"
EXT_TO_MASTER[c]="Code"
EXT_TO_MASTER[cpp]="Code"
EXT_TO_MASTER[cs]="Code"
EXT_TO_MASTER[go]="Code"
EXT_TO_MASTER[rb]="Code"
EXT_TO_MASTER[php]="Code"
EXT_TO_MASTER[ts]="Code"
EXT_TO_MASTER[jsx]="Code"
EXT_TO_MASTER[tsx]="Code"
EXT_TO_MASTER[sh]="Code"
EXT_TO_MASTER[bash]="Code"
EXT_TO_MASTER[json]="Code"
EXT_TO_MASTER[xml]="Code"
EXT_TO_MASTER[yaml]="Code"
EXT_TO_MASTER[yml]="Code"
EXT_TO_MASTER[sql]="Code"
# Executables
EXT_TO_MASTER[exe]="Executables"
EXT_TO_MASTER[msi]="Executables"
EXT_TO_MASTER[deb]="Executables"
EXT_TO_MASTER[rpm]="Executables"
EXT_TO_MASTER[app]="Executables"
EXT_TO_MASTER[bat]="Executables"
EXT_TO_MASTER[cmd]="Executables"
# Fonts
EXT_TO_MASTER[ttf]="Fonts"
EXT_TO_MASTER[otf]="Fonts"
EXT_TO_MASTER[woff]="Fonts"
EXT_TO_MASTER[woff2]="Fonts"
# Spreadsheets and Data
EXT_TO_MASTER[csv]="Spreadsheets"
EXT_TO_MASTER[xls]="Spreadsheets"
EXT_TO_MASTER[xlsx]="Spreadsheets"
EXT_TO_MASTER[ods]="Spreadsheets"
EXT_TO_MASTER[tsv]="Spreadsheets"
# Presentations
EXT_TO_MASTER[ppt]="Presentations"
EXT_TO_MASTER[pptx]="Presentations"
EXT_TO_MASTER[odp]="Presentations"
EXT_TO_MASTER[key]="Presentations"
# 3D Models
EXT_TO_MASTER[obj]="3D_Models"
EXT_TO_MASTER[stl]="3D_Models"
EXT_TO_MASTER[fbx]="3D_Models"
# Virtual Machine and Disk Images
EXT_TO_MASTER[vmdk]="Disk_Images"
EXT_TO_MASTER[vdi]="Disk_Images"
EXT_TO_MASTER[qcow2]="Disk_Images"
# Miscellaneous (less common)
EXT_TO_MASTER[torrent]="Torrents"
EXT_TO_MASTER[log]="Logs"
EXT_TO_MASTER[bak]="Backups"
EXT_TO_MASTER[tmp]="Temporary"
EXT_TO_MASTER[temp]="Temporary"
# Other (catch-all for unmapped extensions)
DEFAULT_MASTER="Others"

IGNORE_EXTENSIONS=("crdownload" "part" "download" "tmpdownload" "partial")

for file in *; do
    if [ -f "$file" ]; then
        extension=$(echo "${file##*.}" | tr '[:upper:]' '[:lower:]')
        
        skip_file=false
        for ignore_ext in "${IGNORE_EXTENSIONS[@]}"; do
            if [ "$extension" = "$ignore_ext" ]; then
                echo "Skipping $file (temporary download file)"
                skip_file=true
                break
            fi
        done
        [ "$skip_file" = true ] && continue

        if [ "$extension" = "$file" ]; then
            master_type="$DEFAULT_MASTER"
        else
            master_type=${EXT_TO_MASTER[$extension]:-$DEFAULT_MASTER}
        fi
        
        if [ ! -d "$master_type" ]; then
            mkdir "$master_type"
            echo "Created directory: $master_type"
        fi
        
        mv "$file" "$master_type/"
        echo "Moved $file to $master_type/"
    fi
done

echo "Organization complete!"
