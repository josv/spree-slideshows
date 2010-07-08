SUMMARY

This extension allows easy addition and administration of slideshows in Spree.

INSTALLATION

   1.

      Clone the git repo to SPREE_ROOT/vendor/extensions/slideshows or install the extension

      git clone git://github.com/josv/spree-slideshows.git slideshows

      script/extension install git://github.com/josv/spree-slideshows.git
   2.
   
     Migrate the database

      rake db:migrate

   3.

      Restart server

USAGE

   add slideshow helper method in your view:

   <%= insert_slideshow %>

   add slides for the slideshow in the admin section

   Additional options:

   <%= insert_slideshow :group => "home" %>

   displays slides for which the groups column is empty or includes the value "home"

   <%= insert_slideshow :max => 10 %>

   limits the number of slides shown to 10 (default 5)