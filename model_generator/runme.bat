@echo off
rd /s/q src
java -jar openapi-generator-cli.jar ^
    generate -g dart-dio ^
    -o src ^
    --skip-validate-spec ^
    -c configuration.json ^
    --input-spec-root-directory apis ^
    --model-name-suffix DTO ^
    --global-property models

rd /s/q ..\lib\infrastructure\rit\model
pause
