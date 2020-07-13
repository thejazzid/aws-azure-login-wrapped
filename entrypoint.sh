
node /aws-azure-login/lib --no-sandbox "$@"

if [ $? -eq 0 ]; then
  echo "Login function seems worked OK - Will try to update credentials for default profile"
  python3 /aws-azure-login/copy_creds.py "$@"
else
  echo "Somthing went wrong with aws-azure-login function. Try again"
fi
