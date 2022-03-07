FROM python:3.9

ADD . /srv/qwc_service
RUN pip3 install --no-cache-dir -r /srv/qwc_service/requirements.txt \
    && chmod u+x /srv/qwc_service/* \
    && chown 1001:0 /srv/qwc_service

# switch to non-root for openshift usage
USER 1001

CMD [ "python", "/srv/qwc_service/json2qgs.py" ]
