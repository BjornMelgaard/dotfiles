resize_and_optimize_images () {
  size=$1

  resize="$size""x""$size"
  cmd="identify -format \"%[fx:(h>$size || w>$size)]\n\" | grep -q 1"

  echo "Resizing dir $PWD, max size - $resize"

  find "$PWD" -regex '.*\.\(jpg\|jpeg\|png\)' -exec sh -c "$cmd" {} \; -print0 | xargs -0 mogrify -verbose -resize "$resize"

  echo "Done resizing dir $PWD"

  optimize_images $PWD 85
}

optimize_images () {
  quality="$1"
  dir="$2"

  echo "Optimizing dir $dir, quality - $quality"

  docker run -it --rm --name optimize_images_foo -v $dir:/usr/src/app -w /usr/src/app ruby:2.4-stretch bash -c "gem install image_optim image_optim_pack && (curl -L \"http://static.jonof.id.au/dl/kenutils/pngout-20150319-linux.tar.gz\" | tar -xz -C /usr/bin --strip-components 2 --wildcards \"*/x86_64/pngout\") && image_optim --verbose --allow-lossy --jpegoptim-allow-lossy true --jpegoptim-max-quality $quality --pngquant-allow-lossy true --pngquant-quality 0..$quality -r ."

  echo "Done optimizing dir $dir"
}
