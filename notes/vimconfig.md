# Vim configuration

Taken from: https://www.xorpd.net/blog/vim_python3_install.html

## Dependencies

libncurses5-dev
python3-dev

If it's not present, see where python was installed ($which python)

In my case it's in: /usr/bin/python3.5

## Vim configuration

```
$./configure \
--enable-python3interp \
--enable-gui=no \
--with-features=normal \
--enable-multibyte \
--with-x \
--with-compiledby="tocino" \
--with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu \
--prefix=/opt/vim8
```

## One liner

```
$./configure --enable-python3interp --enable-gui=no --with-features=normal --enable-multibyte --with-x --with-compiledby="tocino" --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu --prefix=/opt/vim8
```
$sudo make clean install
$sudo ln -s /opt/vim8/bin/vim /usr/bin/vim
