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
    --global-property modelTests=false,modelDocs=false,models,apiTests=false,apiDocs=false,apis,supportingFiles=api.dart

xcopy src\lib ..\lib /s /e /h
cd ..
@REM flutter pub run build_runner build
cd model_generator
pause
