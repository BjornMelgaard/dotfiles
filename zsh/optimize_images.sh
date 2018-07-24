resize_and_optimize_images () {
  resize_images 500 $PWD
  optimize_images 85 $PWD
}

optimize_images () {
  quality="$1"
  dir="$2"

  echo "Optimizing dir $dir, quality - $quality"

  docker run --rm \
    -v $dir:/usr/src/app \
    -w /usr/src/app ruby:2.4-stretch bash -c \
    "git clone https://github.com/toy/image_optim /image_optim && \
    (\
      cd /image_optim && \
      git checkout pngout-ignore-segmentation-fault && \
      bundle install && \
      gem build image_optim.gemspec && \
      gem install image_optim-0.26.1.gem \
    ) && \
    gem install image_optim_pack && \
    (curl -L \"http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux.tar.gz\" | tar -xz -C /usr/bin --strip-components 2 --wildcards \"*/x86_64/pngout\") && \
    export LC_ALL=C.UTF-8 && \
    image_optim --no-threads --verbose --allow-lossy --jpegoptim-allow-lossy true --jpegoptim-max-quality $quality --pngquant-allow-lossy true --pngquant-quality 0..$quality -r ."

  echo "Done optimizing dir $dir"
}
