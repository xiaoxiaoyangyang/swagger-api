#!/bin/sh

set -e

rm -rf generated
echo "rm -rf generated success"
mkdir -p generated/senseguard-openapi-generated
echo "mkdir success"
swagger_out=generated/senseguard-openapi.swagger.json

java -jar senseguard-swagger-json-0.0.1-SNAPSHOT.jar
echo "merge success"
java -jar swagger-codegen-cli-2.4.0.jar generate -i $swagger_out -l html2\
    -o generated/
echo "generate html success"
for lang in "python" "java" "go"; do
    java -jar swagger-codegen-cli-2.4.0.jar generate -i $swagger_out -l $lang\
        -o generated/senseguard-openapi-generated/$lang
done
#read -p "按任意键继续"
