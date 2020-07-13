
node /aws-azure-login/lib --no-sandbox "$@"

if [ $? -eq 0 ]; then
  echo "OK - will do magic here"
  python3 /aws-azure-login/copy_creds.py "$@"
else
  echo "Somthing went wrong"
fi
