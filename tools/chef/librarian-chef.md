Killing cookbooks dependencies hell
==================================

Well, you already knows Chef, and how difficult is sometimes tests new cookbooks 

We're gonna use vagrant, chef-solo and librarian-chef for mantain a sane work environment 
without the need to upload cookbooks to chef server 

Steps
=====

1 Install vagrant:  gem install vagrant
2 Install librarian-chef:  gem install librarian 
3 Init librarian environment:  librarian-chef init 
  This will create a Cheffile. This file indicates from where grab cookbooks 
    - 'site' keyword indicates where the cookbook's may be searched by default
    -  each 'cookbook' keyword may contains:
            - name of cookbook 
            - URL to grab (uses git repos!)
            - indicates a specific revision to grab from repo
4 Run librarian-chef install: the magic happens! look at cookbooks and tmp directories.
  Your cookbooks lives here! No more chef-repo cluttering
5 Configure Vagrantfile, chef-solo provisioner block, adding this: 
  chef.cookbooks_path = ["cookbooks"] and  chef.add_recipe "foo", to test the "foo" cookbook
6 Fire vagrant up!

Caveats
=======
- If cookbooks use the 'search' capability. U can use solo-search cookbook
- If the recipe needs contact to Chef server, it will try doing localhost:4000 requests.
- Remember: Chef Solo is disconnected from a Chef Server There is no authentication, no authorization, no search indexes, no persistent attributes. It's just the bare ability to execute Cookbooks and Data Bags.
- Add cookbooks and tmp dirs to .gitignore 





