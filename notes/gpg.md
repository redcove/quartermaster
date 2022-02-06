# GPG
GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories. GnuPG, also known as GPG, is a command line tool with features for easy integration with other applications.

We mostly use it to sign our commits for github.

## Check existing keys
```shell
gpg --list-secret-keys --keyid-format=long
```

## Using with git
To register your key with git run the following. Note that the key `3AA5C34371567BD2` is from the `sec` line when you run `gpg --list-secret-keys --keyid-format=long` and that your key should be different.
```shell
git config --global user.signingkey 3AA5C34371567BD2
```

Now you are able to add `-S` to your normal git commit workflow and it'll prompt you for your passphrase to sign your commit
```shell
git commit -S -m "your commit message"
```

## Register new key
Fist make sure to set pinentry-mode by running `vi ~/.gnupg/gpg.conf` and adding the folling.
```
use-agent
pinentry-mode loopback
```

Next run the following to generate new a new key.
```shell
gpg --full-generate-key
```

Follow the prompts but make sure the size is `4096` bits. Then you're asked to enter your name and details. Here you can use your github alias and use your GitHub-provided no-reply email address if you want to keep your email private. Lastly enter your passphrase.

Now you can verfiy your key exists by running the following.
```shell
$ gpg --list-secret-keys --keyid-format=long
```

You should get something like the following with a different key and name.
```shell
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```

To export your key to a service like github run the following. Note that the key `3AA5C34371567BD2` is from the `sec` line and that your key should be different.
```shell
gpg --armor --export 3AA5C34371567BD2
```

This prints your key in ASCII format so you can copy and paste it where it needs to go.
