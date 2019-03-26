resize_and_optimize_images () {
  resize_images 500 $PWD
  optimize_images 85 $PWD
}

resize_images () {
  max="$1"
  dir="$2"

  echo "Resizing dir $dir, max size - $max"

  shopt -s globstar

  for f in "$dir"/**/*.jpg "$dir"/**/*.jpeg "$dir"/**/*.png "$dir"/**/*.JPG "$dir"/**/*.JPEG "$dir"/**/*.PNG ; do
    echo "Checking $f"
    s=`identify -format "%w" "$f"`

    if [ $s -gt $max ]; then
      echo "Resizing..."
      mogrify -verbose -resize "$max" "$f"
    fi
    echo
  done

  echo "Done resizing dir $dir"
}

optimize_images () {
  quality="$1"
  dir="$2"

  echo "Optimizing dir $dir, quality - $quality"

  image_optim --no-threads --verbose --allow-lossy --jpegoptim-allow-lossy true --jpegoptim-max-quality $quality --pngquant-allow-lossy true --pngquant-quality 0..$quality -r .

  echo "Done optimizing dir $dir"
}
