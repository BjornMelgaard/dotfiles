resize_and_optimize_images () {
  resize_images 500 $PWD
  optimize_images 100 $PWD
}

optimize_images () {
  quality="$1"
  dir="$2"

  echo "Optimizing dir $dir, quality - $quality"

  docker run -it --rm \
    -v $dir:/usr/src/app \
    -w /usr/src/app ruby:2.4-stretch bash -c \
    "gem install image_optim image_optim_pack && \
    (curl -L \"http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux.tar.gz\" | tar -xz -C /usr/bin --strip-components 2 --wildcards \"*/x86_64/pngout\") && \
    image_optim --no-threads --verbose --allow-lossy --jpegoptim-allow-lossy true --jpegoptim-max-quality $quality --pngquant-allow-lossy true --pngquant-quality 0..$quality -r ."

  echo "Done optimizing dir $dir"
}
