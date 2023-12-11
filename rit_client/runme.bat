@echo off

java -jar generator\openapi-generator-cli.jar generate -g dart-dio -c generator\configuration.json ^
--model-name-suffix DTO ^
--global-property modelTests=false,modelDocs=false,apiTests=false,apiDocs=false ^
-i https://api.rookiebyte.pl/v1/rit/users/v3/api-docs

dart run build_runner build --delete-conflicting-outputs
