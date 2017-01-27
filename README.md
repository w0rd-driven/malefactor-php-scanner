# malfactor-php-scanner

This script attempts to detect backdoors and hidden code in PHP scripts downloaded from suspicious sources.
Checks for some common and uncommon strings found in unsafe scripts that may lead to ads, backdoors, etc.
It uses recursive grep searching to output the suspected filename and line.

This script is not foolproof and all output should be examined by someone with at least an intermediate
knowledge of their system. If something doesn't look right, backup the suspected file to an offline
storage device and delete original the file from your web server. A lot of times, these shady files can
be reverse engineered to provide a unique insight into the vulnerability.


#Directions

Open the file using terminal and Drag & Drop a directory into the window.

The scanner will execute showing a loading spinner and a log file will be created on your desktop named "php_scan.log".

The log contents will show a list containging the file and line numbers of suspected malicious function executions.  You can then eximine the files yourself to see how the function executes.




==========================================================================================
==== NEW PHP SCAN RESULTS ================================================================
==========================================================================================

==========================================================================================
⚠ extract(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/controllers/mvc_controller.php:255:

==========================================================================================
⚠ file_exists(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_file_includer.php:15:

==========================================================================================
⚠ file(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/controllers/mvc_controller.php:101:

==========================================================================================
⚠ filetype(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_directory.php:49:

==========================================================================================
⚠ fopen(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_file.php:34:

==========================================================================================
⚠ getenv(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/wpmvc.php:3:$wordpress_path

==========================================================================================
⚠ glob(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_file_includer.php:170:

==========================================================================================
⚠ is_dir(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_directory.php:31:

==========================================================================================
⚠ is_file(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_directory.php:31:

==========================================================================================
⚠ link(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/controllers/mvc_controller.php:30:

==========================================================================================
⚠ mkdir(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_directory.php:32:

==========================================================================================
⚠ rmdir(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_directory.php:58:

==========================================================================================
⚠ unlink(){} FOUND!
==========================================================================================
Found in files:
/Users/builder/Desktop/wp-mvc/core/mvc_directory.php:52:

==========================================================================================
==== SCAN COMPLETED ======================================================================
==========================================================================================


Success! Scan Complete.
