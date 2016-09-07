# yum-repo

## Example of hosting your own Yum repo.

### Setup

* Start vagrant via: `vagrant up`
* The Yum repo is now accessible at: `http://admin:password@dev.yum-repo.loc/packages`

### Installing packages

* SSH into the consumer instance via: `vagrant ssh yum-consumer`
* Install nginx: `sudo yum install -y nginx --disablerepo=* --enablerepo=custom_repo`
* Install bananas-and-apples: `sudo yum install -y bananas-and-apples`

### Updating the Yum repo

* SSH into the Yum repo instance via: `vagrant ssh yum-repo`
* Run the update command: `createrepo --update /var/www/html/packages`

### TODO

* Everything.


