aws s3 sync /work/repos/tahaderouiche.com/ s3://tahaderouiche.com --exclude "*.sh" --exclude ".DS_Store" --exclude "*.md" --exclude "README" --exclude ".git/*" --exclude "LICENSE" --delete --profile personal-web-user
