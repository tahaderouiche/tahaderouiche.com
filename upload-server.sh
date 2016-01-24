//Connect to server
gcloud compute --project "tahaderouichewebsite" ssh --zone "asia-east1-c" "webserver-nginx"

// Copy all files
gcloud compute --project "tahaderouichewebsite" copy-files /Users/tahaderouiche/Google Drive/tahaderouiche.com/* webserver-nginx:/home/tahaderouiche --zone "asia-east1-c"

//Copy just one file
gcloud compute --project "tahaderouichewebsite" copy-files /Users/tahaderouiche/Google\ Drive/tahaderouiche.com/img/* webserver-nginx:/home/tahaderouiche/img/ --zone "asia-east1-c"

sudo cp -r /home/tahaderouiche/* /data/www/

sudo cp /home/tahaderouiche/index.html /data/www/
