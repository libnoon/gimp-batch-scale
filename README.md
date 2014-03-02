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

Licence
=======
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
