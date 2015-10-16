#!/usr/bin/env bash


DEST="default/template"
mkdir -p $DEST

FABRIC8_IPAAS_VERSION=${FABRIC8_VERSION:-2.2.52}
FABRIC8_DEVOPS_VERSION=${FABRIC8_VERSION:-2.2.52}


echo "Installing templates from ipaas packages version #{FABRIC8_IPAAS_VERSION}"
for app in amqbroker api-registry apiman apiman-gateway fabric8mq fabric8mq-consumer fabric8mq-producer qpid-dispatch; do
  echo "Installing ${app} template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/ipaas/apps/${app}/${FABRIC8_VERSION}/${app}-${FABRIC8_VERSION}-kubernetes.json"
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done

echo "Installing templates from ipaas apps version #{FABRIC8_IPAAS_VERSION}"
for app in apiman; do
  echo "Installing ${app} template"
  MVN_URL="http://central.maven.org/maven2/io/fabric8/ipaas/packages/${app}/${FABRIC8_VERSION}/${app}-${FABRIC8_VERSION}-kubernetes.json"
  curl -L -H "Accept: */*" ${MVN_URL} -o $DEST/${app}.json
done

echo "Installing devops packages from version #{FABRIC8_DEVOPS_VERSION}"
for app in cd-pipeline cdelivery cdelivery-core chat chat-irc chat-letschat chat-slack logging management metrics social; do
  echo "Installing ${app} app template"
  MVN_QUICKSTART_URL="http://central.maven.org/maven2/io/fabric8/devops/packages/${app}/${FABRIC8_VERSION}/${app}-${FABRIC8_VERSION}-kubernetes.json"
  curl -L -H "Accept: */*" ${MVN_QUICKSTART_URL} -o $DEST/${app}.json
done
echo "Installing devops apps from version #{FABRIC8_DEVOPS_VERSION}"
for app in artifactory brackets chaos-monkey console-kubernetes gerrit gogs grafana2 hubot-irc hubot-letschat hubot-notifier hubot-slack image-linker jenkins keycloak kibana letschat nexus orion prometheus sonarqube taiga; do
  echo "Installing ${app} app template"
  MVN_QUICKSTART_URL="http://central.maven.org/maven2/io/fabric8/devops/apps/${app}/${FABRIC8_VERSION}/${app}-${FABRIC8_VERSION}-kubernetes.json"
  curl -L -H "Accept: */*" ${MVN_QUICKSTART_URL} -o $DEST/${app}.json
done


echo "Installed templates"
ls -l $DEST
