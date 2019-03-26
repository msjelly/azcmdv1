FROM azuresdk/azure-cli-python
#RUN wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
#RUN unzip terraform_0.11.13_linux_amd64.zip
#RUN chmod +x terraform
#RUN mv terraform /bin
#RUN mkdir /terraform
ADD tm.sh /
RUN chmod +x /tm.sh
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

