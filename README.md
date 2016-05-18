# Mentioning knife ec2 instance creation command.


knife ec2 server create -I ami-9abea4fb -f t2.micro \ -S test -i C:\Users\administrator\chef-repo\.ssh\test.pem --ssh-user ubuntu --region us-west-2 -Z us-west-2b --subnet subnet-24389140 -N redis -r "role[apt],role[redis]"
