# Define the folder containing the text files
FOLDER="adcirc"
# test 1

# Loop through each text file in the folder
for file in "$FOLDER"/*/*; do
    if [[ -f "$file" ]]; then
        # Replace the specified string in the file
        # sed -i 's|/mnt/lustre/a2fs-work1/work/n01/n01/sithom|/home/n02/n02/sdat2/|g' "$file"
        sed -i 's|/home/n02/n02/sdat2/|/work/n02/n02/sdat2/|g' "$file"
        echo "Processed $file"
    fi
done

echo "All files processed."
