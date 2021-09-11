recursive_unzip() {
		find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`" "$filename"; done;
		find . -name "*.rar" | while read filename; do unrar x "`dirname "$filename"`"; done;
}
