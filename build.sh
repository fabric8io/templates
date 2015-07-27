#!/usr/bin/env bash


DEST="default/template"
mkdir -p $DEST

FABRIC8_VERSION=${FABRIC8_VERSION:-2.2.17}

echo "Installing templates from fabric8 version #{FABRIC8_VERSION}"
for app in base management logging metrics chat cdelivery-core cdelivery apiman messaging ipaas kitchen-sink quickstarts; do
  echo "Installing ${app} template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/apps/${app}/${FABRIC8_VERSION}/${app}-${FABRIC8_VERSION}-kubernetes.json"
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done

echo "Installing quickstart templates from fabric8 version #{FABRIC8_VERSION}"
for app in chaos-monkey fabric8mq-producer fabric8mq-consumer prometheus grafana2; do
  echo "Installing ${app} app template"
  MVN_QUICKSTART_URL="http://central.maven.org/maven2/io/fabric8/jube/images/fabric8/${app}/${FABRIC8_VERSION}/${app}-${FABRIC8_VERSION}-kubernetes.json"
  curl -L -H "Accept: */*" ${MVN_QUICKSTART_URL} -o $DEST/${app}.json
done

echo "Installed templates"
ls -l $DEST
