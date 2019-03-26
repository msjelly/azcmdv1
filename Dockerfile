
FROM azuresdk/azure-cli-python
ADD tm.sh /
RUN chmod +x /tm.sh
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

