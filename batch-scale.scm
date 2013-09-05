;; Possibles strategies:
;; - Loop on all files within this script
;;   => gimp -ib '(for each (file in dir/*.jpg) ...)'
;;   => How difficult is it to code that in this Scheme?
;; - Loop in the shell, which calls gimp -ib repeatedly
;;   => for file in dir/*.jpg; do gimp -ib "(convert $file)"; done
;;   => Maybe slower than the first solution, since gimp must initialize each time...

;; Resources
;; =========

;; Tutorial gimp 2.8:
;; http://docs.gimp.org/2.8/en/gimp-using-script-fu-tutorial-first-script.html

;; Tutorial gimp (without version?):
;; http://www.gimp.org/tutorials/Basic_Scheme/

;; Tutorial with a slightly different example:
;; http://abcdugimp.free.fr/gimp/apprendre/scheme/script-fu-register.php

;; Template:
;; http://www.home.unix-ag.org/simon/files/script-fu-template.scm

;; Example that is recommended by one of the official tutorials:
;; https://github.com/nickklosterman/Gimp/blob/master/scripts/test-sphere.scm

;; Batch example:
;; http://www.gimp.org/tutorials/Basic_Batch/

;; Website for searching and publishing scripts:
;; http://gimpscripts.com/upload-script/

;; Return the appropriate scaling ratio of an original image with
;; width=W height=H to fit a square with dimension=MAXIMUM.
(define (get-scaling-ratio w h maximum)
  (write w)
  (write h)
  (let* ((r1 (/ maximum w))
	 (r2 (/ maximum h)))
    (min r1 r2)))

;; As indicated in
;; http://www.seul.org/~grumbel/gimp/script-fu/script-fu-tut.html#return
;; we need to use car for all return values.  Why?

;; Scale the given image file.
;; 
;; Scale FILENAME-ORIG so that it fits in a square of
;; dimension=MAXIMUM pixels, and save the result into
;; FILENAME-DESTINATION.  FILENAME-ORIG is not modified.
(define (batch-scale maximum filename-orig filename-destination)
  (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename-orig filename-orig)))
	 (drawable (car (gimp-image-get-active-layer image)))
	 (w (car (gimp-image-width image)))
	 (h (car (gimp-image-height image)))
	 (ratio (get-scaling-ratio w h maximum)))
    (gimp-image-scale image (* w ratio) (* h ratio))
    (gimp-file-save RUN-NONINTERACTIVE image drawable filename-destination filename-destination)
    (gimp-image-delete image)))
