FROM grafana/alloy:latest

COPY config.alloy /etc/alloy/config.alloy

EXPOSE 12345

CMD ["run", \
     "--server.http.listen-addr=0.0.0.0:12345", \
     "--stability.level=generally-available", \
     "/etc/alloy/config.alloy"]