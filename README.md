SWCCG Infrastructure
====================


## Ansible

### Setup for using Ansible

```bash
##
## If on MacOS X, do not install ansible using Brew.
## Install ansible using pip3
## If on MacOS X, you may need to install Python3 first, 
## which is easiest when done using brew.
##
brew install python3
pip3 install ansible
```

### Setup for using credstash

```bash
##
## Credstash is used for pulling secrets used in Ansible scripts.
##
pip3 install credstash

##
## On MacOS X, High Sierra introduced new security changes which break Python fork().
##
## objc[31109]: +[NSValue initialize] may have been in progress in another thread when fork() was called.
## objc[31109]: +[NSValue initialize] may have been in progress in another thread when fork() was called. We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.
## ERROR! A worker was found in a dead state
##
```



## To overcome this issue, you need to disable ObjC Fork Safety.
##
echo "export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES" >> ~/.bash_profile

##
## On MacOS X, you may encounter some issues connecting to AWS using credstash
## if you do not explicitly disable the outbound proxy.
##
echo 'export no_proxy="*"' >> ~/.bash_profile
```

### Add the `useast2-web-001` host to your local ssh config file

**FILE:** `~/.ssh/config`

```
Host useast2-web-001.starwarsccg.org
  Hostname x.x.x.x
  User     devon
  Port     22
  IdentityFile ~/.ssh/devon_starwar8.pem
```

### Gaining SSH access to the production hosts

* Fork the `swccg-infrastructure` git repo.
* Add your username and ssh key to `ansible/roles/users/defaults/main.yaml`
* Open a pull request to add your username to the production servers.
* **_There is no password-based access, only ssh keys._**




### Running Ansible

```bash
cd ansible
ansible-playbook -i hosts playbooks/prod.yaml
```


## Terraform

### Install Terraform

* [Download Terraform **0.12**, _or newer_ from Terraform.io](https://www.terraform.io/downloads.html)

* Place the `terraform` binary in `~/bin`


### Install AWS CLI

* pip3 is usually the best source for the AWS CLI as it will always provide the latest CLI version.

```bash
pip3 install awscli
```

### Configure the AWS CLI

* The Terraform configuration is designed to work with an AWS profile named after the environment: `swccg-production`.
* AWS Profiles are defined in the `~/.aws/credentials` file.
* The `~/.aws/credentials` file should have the following format:

```ini
[swccg-production]
aws_access_key_id     = AKIxxxxxxxxxx
aws_secret_access_key = xxxxxxxxxxxxx
region                = us-east-2
output                = json
```

* The resources are configured in `us-east-2`, so the default region should be set to `us-east-2`.


### Directory Structure

* Terraform `modules` are re-usable pieces of code.
* The `production` directory defines different aspects of the production aws environment.

### Production Layers

* The `production` directory contains a set of layers that build up the production environment.
* Each layer is part of the larger stack.
* When updating a part of the production infrastructure, changings do not automatically cascade through the layers.


| Layer                  | Description |
| ---------------------- | ----------- |
| 00-backend_dynamodb_s3 | Creates the S3 state bucket and DynamoDB locking table used for all Terraform layers. The backend bucket is always stored in `us-east-2`, no matter where the assets being created are located. |
| 10-acm                 | Amazon Certificate Manager controlled/created SSL certs to be used by CloudFront and the ALB's |
| 20-res.starwarsccg.org | Creates an S3 bucket and CloudFront distribution for `res.starwarsccg.org` |
| 20-www.starwarsccg.org | Creates an S3 bucket and CloudFront distribution for `www.starwarsccg.org` |
| 30-route53             | Creates `starwarsccg.org` hosted zone in Route53 |
| 40-vpc                 | Creates VPC with standard `DMZ` and `Trust` zone subnets |
| 50-webserver           | Creates an EC2-based webserver. Complete the `LAMP` setup using ansible. |
| 60-rds                 | Creates an RDS-based MariaDB database. No DB's are created, create the DB's and the DB-specific users seperately using the `mysql` client. |



### Running Terraform

cd to one of the terraform directories then run:

1. `init`
2. `plan`
3. `apply`




## Fork the code to contribute

* All contributions are welcome.
* To make a code contribution:
  1. Fork this repo
  2. Create a local branch
  3. Create a pull request




## Sync a fork of a repository to keep it up-to-date with the upstream repository.

### This BIG-gotcha difference between Stash Bitbucket and GitHub

* BitBucket auto-syncs repo changes from the original to the forked repo.
* Which means once we merge something, everybody gets it automatically and just pulls the latest.
* However, GitHub **does not** do that.
* So your personal fork can get out of sync
* The instructions below will allow you to resync from the upstream master.

### Configure a remote for a fork

* Before you can sync your fork with an upstream repository, you must configure a remote that points to the upstream repository in Git.
* You must configure a remote that points to the upstream repository in Git to sync changes you make in a fork with the original repository.
* This also allows you to sync changes made in the original repository with the fork.

```bash
##
## List the current configured remote repository for your fork.
##
git remote -v

# origin  git@github.com:DevoKun/swccg-infrastructure.git (fetch)
# origin  git@github.com:DevoKun/swccg-infrastructure.git (push)

##
## Specify a new remote upstream repository that will be synced with the fork.
##
git remote add upstream git@github.com:swccgpc/swccg-infrastructure.git

##
## Verify the new upstream repository you've specified for your fork.
##
git remote -v

# origin    git@github.com:DevoKun/swccg-infrastructure.git (fetch)
# origin    git@github.com:DevoKun/swccg-infrastructure.git (push)
# upstream  git@github.com:swccgpc/swccg-infrastructure.git (fetch)
# upstream  git@github.com:swccgpc/swccg-infrastructure.git (push)
```

### Fetch from upstream and merge to local master

```bash
git fetch upstream

##
## If not on master, switch to master
## master is not the same as upstream/master
## upstream/master is on github
## master is local to your laptop
##
git branch
git checkout master
git branch
git merge upstream/master
```

### Create a script to resync the branch for you

* Create the file: ~/bin/gitresync
* The contents will be:

```bash
git remote -v

git fetch upstream
git branch
git checkout master
git branch
git merge upstream/master
```





