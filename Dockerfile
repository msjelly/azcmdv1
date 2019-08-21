
FROM microsoft/azure-cli
ADD aks.sh /
RUN chmod +x /aks.sh
ADD tm.sh /
RUN chmod +x /tm.sh
ADD ep_dtor.sh /
RUN chmod +x /ep_dtor.sh
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]