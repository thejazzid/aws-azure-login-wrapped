FROM sportradar/aws-azure-login
RUN apt-get update
RUN apt-get install -y python3-pip && pip3 install awscli boto3 configparser

COPY entrypoint.sh /aws-azure-login/entrypoint.sh
COPY copy_creds.py /aws-azure-login/copy_creds.py
RUN chmod +x /aws-azure-login/entrypoint.sh

ENTRYPOINT ["/bin/bash", "/aws-azure-login/entrypoint.sh"]
