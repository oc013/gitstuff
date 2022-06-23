# Secondary git identities with GPG

Concise notes and helper script to setup secondary git/github identities. Focused on Ubuntu 20+

Setup SSH Key
--------

Generate a new SSH key
```
ssh-keygen -t ed25519 -f ~/.ssh/secondaryid
```

Output and save the pubkey to github etc:
```
cat ~/.ssh/secondaryid.pub
```

Edit ssh `~/.ssh/config` and add an alias that uses this new key
```
Host github.com-secondaryid
    HostName github.com
    User git
    IdentityFile ~/.ssh/secondaryid
```

Clone repos using the alias
```
git clone git@github.com-secondaryid:oc013/gitstuff.git
```

Generate GPG key
--------

List existing GPG key you might want to use:
```
gpg --list-secret-keys --keyid-format=long
```

Generate a key with default encryption,  >= 4096 bits and no expiration:
```
gpg --full-generate-key
```

From the list of keys extract the key id from the line starting with `sec` in this example the key id will be `3AA5C34371567BD2`
```
sec   rsa4096/3AA5C34371567BD2 2022-06-23 [SC]
```

Export the pubkey to import into github etc
```
gpg --armor --export 3AA5C34371567BD2
```

Use the Script
--------

Setup the config file by copying and editing it with the user:
```
cd ~/repos/gitstuff
cp config.example config
```

Then from the repo you want to configure and add GPG signing to:
```
cd ~/repos/repotoconfigure
~/repos/gitstuff/gitstuff.sh
```

See also
--------

https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification#gpg-commit-signature-verification