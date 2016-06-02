# Mapnik debian packaging scripts

These are scripts used to build Debian nightlies of mapnik branches,
and automatically upload to launchpad PPAs.

These are not official package scripts, but rather maintained by the Mapnik project.

These are not actual packages. To actually install and use the packages see:

https://github.com/mapnik/mapnik/wiki/UbuntuInstallation

These scripts currently run on Koordinates' CI server every night at 0000UTC and upload
to the Mapnik nightly build PPAs at https://launchpad.net/~mapnik


## Requirements

```
sudo apt-get install debhelper devscripts dput git-core python scons
```

## Setting up

1) Clone the packaging repo and enter debian dir:

    git clone git://github.com/mapnik/debian.git mapnik-debian
    cd mapnik-debian

2) Clone the mapnik git repo from https://github.com/mapnik/mapnik into a git/ dir:

    git clone https://github.com/mapnik/mapnik git

3) Update the nightly-build.sh script with your name/GPG key/etc, and 
what branches/dists/ppas you want. Set the latest releases correctly too.

Note: if you change the launchpad username then you will also need to ensure your PPA has
the correctly named PPA's:

    nightly-trunk
    nightly-2.0
    nightly-2.1
    nightly-2.2
    nightly-2.3


4) Set prev.rev in each branch directory to be the current revision of the branch

    cd git
    git checkout master
    git log -1 --pretty=format:%h > ../master/prev.rev
    git checkout 2.0.x
    git log -1 --pretty=format:%h > ../2.0.x/prev.rev
    git checkout 2.1.x
    git log -1 --pretty=format:%h > ../2.1.x/prev.rev
    git checkout 2.2.x
    git log -1 --pretty=format:%h > ../2.2.x/prev.rev
    git checkout 2.3.x
    git log -1 --pretty=format:%h > ../2.3.x/prev.rev
    cd ../
    
5) Run `./nightly-build.sh -f -d` to make sure it works (you should see usage)

6) Run `./nightly-build.sh -f` to force the first build & upload

7) Run `./nightly-build.sh -c` to delete what you just built

8) After that, run `./nightly-build.sh` and it'll regenerate and upload source packages if something's changed.

9) Run `./nightly-build.sh -c` to cleanup occasionally

10) Re-run a single trunk build because you've fixed debian/ stuff, do
   
    ./nightly-build.sh -f -b trunk -r 2


## Notes

`debian/` directories are taken from the appropriate directory for each branch, 
except for the changelog which is built dynamically.


License: 

* GPL-2+

Feedback:

* Robert Coup <robert@coup.net.nz>
* Dane Springmeyer <dane@dbsgeo.com>

