FROM registry.access.redhat.com/ubi8/ubi-minimal

ENV PASSWORD_MAKER_VERSION 2.5.0

LABEL io.k8s.description="One way password creator" \
  io.k8s.display-name="Password Maker v${PASSWORD_MAKER_VERSION}" \
  name="passwordmaker" \
  architecture="x86_64" \
  maintainer="github.com/FreedomBen"

# Install dependencies
RUN microdnf update -y \
 && microdnf install -y \
    nginx \
    wget \
 && microdnf clean all -y

# Install dumb-init
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 \
 && chmod +x /usr/local/bin/dumb-init

# Switch port 80 to 8080 so we can run in OpenShift
COPY nginx.conf /etc/nginx/nginx.conf
COPY passwordmaker-javascript-2.5.html /usr/share/nginx/html/index.html

RUN chmod g+rwX /var /var/{log,run}

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD [ "nginx", "-g", "daemon off;" ]
