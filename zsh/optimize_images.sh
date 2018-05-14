optimize_images () {
  echo "Optimizing dir $PWD"

  docker run -it --rm --name optimize_images_foo -v $PWD:/usr/src/app -w /usr/src/app ruby:2.4-stretch bash -c 'gem install image_optim image_optim_pack && image_optim --allow-lossy --jpegoptim-allow-lossy true --jpegoptim-max-quality 85 --pngquant-allow-lossy true --pngquant-quality 0..85 -r .'

  echo "Done optimizing dir $PWD"

  find "$PWD" -regex '.*\.\(jpg\|jpeg\|png\)' -exec sh -c 'identify -format "%[fx:(h>1000 || w>1000)]\n" "$0" | grep -q 1' {} \; -print0 | xargs -0 mogrify -verbose -resize '1000x1000'

  echo "Done resizing dir $PWD"
}
