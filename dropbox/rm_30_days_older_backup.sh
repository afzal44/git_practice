for fd in $(./dropbox_uploader.sh -h list database_backup_dollar_aisle|cut -d' ' -f5)
do
       	drop_file="$fd";
	d=$(echo "$drop_file" | cut -d'_' -f2);
	if [[ "$d" =~ [0-9]{4}[0-1][0-9][0-3][0-9] ]];
	then 
		if [ "$d" -le "$(date --date="30 day ago" '+%Y%m%d')" ]
		then 
			./dropbox_uploader.sh delete "database_backup_dollar_aisle/$drop_file";
	       	fi
	fi
done
