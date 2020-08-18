update-npm-packages () {
  docker run -it --rm -v $(pwd)/package.json:/app/package.json creack/ncu -u --upgradeAll --packageFile /app/package.json
}
