#!/bin/bash

echo "Total number of folders (including all nested ones) = $number_folders"
echo "TOP 5 folders of maximum size (path, size):"
echo "$big_folders"

echo "Total number of files = $number_files"
echo "Number of configuration files (with the .conf extension) = $conf_number_files"
echo "Number of text files = $txt_number_files"
echo "Number of executable files = $exe_number_files"
echo "Number of log files (with the extension .log) = $log_number_files"
echo "Number of archive files = $archive_number_files"
echo "Number of symbolic links = $link_number_files"

echo "TOP 10 files of maximum size (path, size):"
echo "$big_files"

echo "TOP 10 executable files of maximum size (path, size):"
echo "$big_exe_files"
