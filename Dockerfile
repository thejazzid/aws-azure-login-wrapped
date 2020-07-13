FROM sportradar/aws-azure-login
RUN apt-get update && apt-get install -y python3-pip && pip3 install configparser && rm -rf /var/lib/apt/lists/*
COPY * /aws-azure-login/
RUN chmod +x /aws-azure-login/entrypoint.sh
ENTRYPOINT ["/bin/bash", "/aws-azure-login/entrypoint.sh"]
