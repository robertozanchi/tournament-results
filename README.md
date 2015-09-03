
                                   Tournament Database

  What is this?
  -----------

  The Tournament project is to create an SQL database and a set of Python functions to keep track of players and matches in a game tournament that uses the Swiss system for pairing up players.
  

  Installation
  ------------------

  1) Install Vagrant https://www.vagrantup.com/

  2) Install VirtualBox https://www.virtualbox.org/

  3) Uncompress the contents of this zipped folder and save them in your local vagrant folder on your computer



  Use the Tournament database and Python API
  ------------------

  1) Initiate vagrant and launch the virtual machine

  2) Once in the virtual machine, change directory to the tournament folder in the zipped file

  3) Create databases and views by loading tournament.sql (“psql” -> “\i tournament.sql”)

  4) Run tournament.py (“python” -> “tournament.py”)
