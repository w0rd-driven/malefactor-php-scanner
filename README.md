# malefactor-php-scanner

This script attempts to detect backdoors and hidden code in PHP scripts downloaded from suspicious sources.
Checks for some common and uncommon strings found in unsafe scripts that may lead to ads, backdoors, etc.
It uses recursive grep searching to output the suspected filename and line.

This script is not foolproof and all output should be examined by someone with at least an intermediate
knowledge of their system. If something doesn't look right, backup the suspected file to an offline
storage device and delete original the file from your web server. A lot of times, these shady files can
be reverse engineered to provide a unique insight into the vulnerability.

Designed for OSX, but can be adapted to your environment by specifying the correct "Console" application to open after scanning. (line:230)

## Directions

Open the file using terminal and Drag & Drop a directory into the window.

The scanner will execute showing a loading spinner and a log file will be created on your desktop named "php_scan.log".  The log will open automatically by launching Console.app  with the new log file as soon as the process is complete.

The log contents will show a list containing the file and line numbers of suspected malicious function executions.  You can then eximine the files yourself to see how the function executes.

~~~~
  apache_child_terminate
  base64_decode
  bzopen
  chgrp
  chmod
  chown
  copy
  disk_free_space
  disk_total_space
  diskfreespace
  exif_imagetype
  exif_read_data
  exif_thumbnail
  extract
  file_exists
  file_get_contents
  file_put_contents
  file
  fileatime
  filectime
  filegroup
  fileinode
  filemtime
  fileowner
  fileperms
  filesize
  filetype
  fopen
  fsockopen
  ftp_get
  ftp_nb_get
  ftp_nb_put
  ftp_put
  get_cfg_var
  get_current_user
  getcwd
  getenv
  getimagesize
  getlastmo
  getmygid
  getmyinode
  getmypid
  getmyuid
  glob
  gzfile
  gzopen
  hash_file
  hash_hmac_file
  hash_update_file
  highlight_file
  ini_set
  iptcembed
  is_dir
  is_executable
  is_file
  is_link
  is_readable
  is_uploaded_file
  is_writable
  is_writeable
  lchgrp
  lchown
  link
  linkinfo
  lstat
  md5_file
  mkdir
  move_uploaded_file
  parse_ini_file
  pathinfo
  pfsockopen
  phpinfo
  posix_getlogin
  posix_kill
  posix_mkfifo
  posix_mkfifo
  posix_setpgid
  posix_setsid
  posix_setuid
  posix_ttyname
  proc_close
  proc_get_status
  proc_nice
  proc_terminate
  putenv
  read_exif_data
  readfile
  readgzfile
  readlink
  realpath
  rename
  rmdir
  sha1_file
  show_source
  SplFileObject->__construct
  stat
  symlink
  tempnam
  tmpfile 
  touch
  unlink
~~~~

==========================
==== PHP SCAN RESULTS ====
==========================

==========================
⚠ extract(){} FOUND!
==========================
Found in files:

~/core/controllers/mvc_controller.php:255

~/core/controllers/base_controller.php:255
