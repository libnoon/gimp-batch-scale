;; Premier essai de script en Gimp.

;; But: resizer tout un repertoire d'images photo en batch vers
;; 800x600 ou 600x800

;; Strategies possibles:
;; - Soit faire la boucle sur tous les fichiers dans le script meme
;;   => gimp -i -b '(for each (file in dir/*.jpg) ...)'
;; - Soit faire la boucle en shell, qui appelle gimp plusieurs fois
;;   => for file in dir/*.jpg; do gimp -i -b "(convert $file)"; done

;; Tutorial gimp 2.8:
;; http://docs.gimp.org/2.8/en/gimp-using-script-fu-tutorial-first-script.html

;; Tutorial gimp (sans version?):
;; http://www.gimp.org/tutorials/Basic_Scheme/

;; Tutorial avec un exemple different:
;; http://abcdugimp.free.fr/gimp/apprendre/scheme/script-fu-register.php

;; Template:
;; http://www.home.unix-ag.org/simon/files/script-fu-template.scm

;; Exemple recommande par un des tutorials officiels:
;; https://github.com/nickklosterman/Gimp/blob/master/scripts/test-sphere.scm

;; Exemple de batch:
;; http://www.gimp.org/tutorials/Basic_Batch/

;; Recherche et publication de scripts:
;; http://gimpscripts.com/upload-script/

;; Fonctions gimp utiles (voir Gimp: Help > procedure browser):
;;
;; gimp-file-load
;; gimp-image-get-active-layer
;; gimp-image-scale
;; gimp-file-save
;; gimp-image-delete

;; J'ai commence le truc ci-dessous, mais a vrai dire je n'ai
;; peut-etre pas besoin de tout ca: je n'ai pas besoin de creer un
;; menu et une boite de dialogue...
(script-fu-register
 "script-fu-batch-scale"                ;func name
 "Batch scale"                          ;menu label
 "Scale down a collection of large images to allow easier transfers on the internet." ;description
 "Fabrice Bauzac"			 ;author
 "copyright 2013 Fabrice Bauzac"	 ;copyright notice
 "2013-09-05"				 ;date created
 ""				  ;image type that the script works on
 SF-IMAGE "Image" 0
 SF-DRAWABLE "Drawable" 0
 SF-STRING      "Directory"          ""   ;a string variable
 )
(script-fu-menu-register "script-fu-batch-scale" "<Image>/File/Fabrice")
