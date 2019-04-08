
FROM azuresdk/azure-cli-python
ADD tm.sh /
RUN chmod +x /tm.sh
ADD ep_dtor.sh /
RUN chmod +x /ep_dtor.sh
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

