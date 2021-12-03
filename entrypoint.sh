source version.properties
echo "Это сценарий точки входа, выполняющий файл jar: $ARTIFACT_NAME"
echo "Версия образа: $IMAGE_VERSION"
java -jar "$ARTIFACT_NAME.jar"