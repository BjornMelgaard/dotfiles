update-npm-packages () {
  docker run -it --rm -v $(pwd)/package.json:/app/package.json creack/ncu --upgrade --packageFile /app/package.json
}
