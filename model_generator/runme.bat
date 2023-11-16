@echo off
rd /s/q src
java -jar openapi-generator-cli.jar ^
    generate -g dart-dio ^
    -o src ^
    -t templates ^
    --skip-validate-spec ^
    -c configuration.json ^
    --input-spec-root-directory apis ^
    --model-name-suffix DTO ^
    --global-property modelTests=false,modelDocs=false

@REM xcopy src\lib ..\lib /s /e /h
@REM cd ..
@REM flutter pub run build_runner build
@REM cd model_generator
pause
