Gimp batch-scale
================

The goal of this script is to allow the batch resizing of a number of
images to e.g. 800x600 or 600x800 resolution.

This can be useful to send a whole photo album to someone through the
internet, for example.

Quick start
===========

- Create a symlink of batch-scale.scm into your ~/.gimp-2.8/scripts/
  directory (or copy it)

- Display the help of the shell script:

    $ batch-scale -h

- Scale one file:

    $ batch-scale origfile.jpg output.jpg

- Scale each *.jpg file in dir/ to write the results into otherdir/:

    $ (cd dir && for f in *.jpg; do batch-scale "$f" "../otherdir/$f"; done)

TODO
====

- Perform the loop on files within Scheme, so that Gimp avoids
  initializing itself many times unnecessarily as it does in the shell
  loop above.  This might be done quite easily by using the shell to
  expand the parameters, and build a Scheme filename-list from within
  the shell along with the rest of the Scheme code.
