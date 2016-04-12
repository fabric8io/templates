#!/usr/bin/env bash


DEST="default/template"
mkdir -p $DEST

FABRIC8_FORGE_VERSION=${FABRIC8_IPAAS_VERSION:-2.2.161}
FABRIC8_IPAAS_VERSION=${FABRIC8_IPAAS_VERSION:-2.2.108}
FABRIC8_DEVOPS_VERSION=${FABRIC8_DEVOPS_VERSION:-2.2.157}


echo "Installing templates from ipaas packages version #{FABRIC8_IPAAS_VERSION}"
for app in apiman apiman-gateway elasticsearch-v1 example-message-consumer example-message-producer fabric8-camel kafka message-broker message-gateway zookeeper ; do
  echo "Installing ${app} template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/ipaas/apps/${app}/${FABRIC8_IPAAS_VERSION}/${app}-${FABRIC8_IPAAS_VERSION}-kubernetes.json"
  echo ${MVN_URL}
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done

echo "Installing templates from ipaas apps version #{FABRIC8_IPAAS_VERSION}"
for app in apiman messaging ; do
  echo "Installing ${app} template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/ipaas/packages/${app}/${FABRIC8_IPAAS_VERSION}/${app}-${FABRIC8_IPAAS_VERSION}-kubernetes.json"
  echo ${MVN_URL}
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done

echo "Installing devops packages from version #{FABRIC8_DEVOPS_VERSION}"
for app in chat-irc chat-letschat chat-slack logging management metrics social; do
  echo "Installing ${app} app template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/devops/packages/${app}/${FABRIC8_DEVOPS_VERSION}/${app}-${FABRIC8_DEVOPS_VERSION}-kubernetes.json"
  echo ${MVN_URL}
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done
echo "Installing devops apps from version #{FABRIC8_DEVOPS_VERSION}"
for app in artifactory brackets chaos-monkey elasticsearch fabric8-docker-registry fluentd gerrit git-collector gitlab gogs grafana2 hubot-irc hubot-letschat hubot-notifier hubot-slack image-linker jenkins keycloak kibana kiwiirc letschat nexus orion prometheus prometheus-blackbox-exporter sonarqube taiga; do
  echo "Installing ${app} app template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/devops/apps/${app}/${FABRIC8_DEVOPS_VERSION}/${app}-${FABRIC8_DEVOPS_VERSION}-kubernetes.json"
  echo ${MVN_URL}
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done

echo "Installing forge packages from version #{FABRIC8_FORGE_VERSION}"
for app in cd-pipeline; do
  echo "Installing ${app} app template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/forge/packages/${app}/${FABRIC8_FORGE_VERSION}/${app}-${FABRIC8_FORGE_VERSION}-kubernetes.json"
  echo ${MVN_URL}
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done
echo "Installing forge apps from version #{FABRIC8_FORGE_VERSION}"
for app in fabric8-forge ; do
  echo "Installing ${app} app template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/forge/apps/${app}/${FABRIC8_FORGE_VERSION}/${app}-${FABRIC8_FORGE_VERSION}-kubernetes.json"
  echo ${MVN_URL}
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done

echo "Installed templates"
ls -l $DEST
