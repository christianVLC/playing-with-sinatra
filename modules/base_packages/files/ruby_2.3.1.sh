#!/bin/sh


/bin/mkdir ~/ruby
cd ~/ruby
/usr/bin/wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.bz2
/bin/tar -xjf ruby-2.3.1.tar.bz2
cd ruby-2.3.1
./configure --disable-install-doc
make install
/bin/rm -rf ~/ruby
cd
exit 0
