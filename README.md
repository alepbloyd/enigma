## Intro

My final project for Turing Back End Module 1, the [Enigma Project](https://backend.turing.edu/module1/projects/enigma/index)!

This program allows the user to encrypt, decrypt, and crack encryption for text files based on the [Caesar Cipher](https://en.wikipedia.org/wiki/Caesar_cipher).

***

### To Encrypt

To encrypt from the command line, run ```$ ruby ./lib/encrypt.rb```, followed by the input file, the output file destination, and optionally a key and date - like so:
```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt key(optional) date(optional)
```

For the encryption key, the user has three options:
1. Enter a five-digit code that will be used directly as the encryption key.
2. Enter a password of their choice. This password is then run through a SHA1 hash returned as Base64 code and converted into a five-digit code used for the encryption key. (I had some extra time and thought this would be fun to try implement. Don't know that it was *fun*, but it is working.)
3. Leave blank to use a randomly generated five-digit key.

For the encryption date, the user has two options:
1. Enter a date in *ddmmyy* format.
2. Leave blank to use today's date in *ddmmyy* format.

### To Decrypt

To decrypt from the command line, run ```$ ruby ./lib/decrypt.rb```, followed by the input file, the output file destination, the key or password, and the date (or leave blank to decrypt using today's date) - like so:

```
$ ruby ./lib/decrypt.rb encrypted.txt message.txt key date(optional)
```

### To Crack

To crack a key from the command line, run ```$ ruby ./lib/crack.rb```, followed by the input file, the output location, and the date (or leave blank to crack with today's date) - like so:

```
$ ruby ./lib/crack.rb encrypted_text.txt output_location.txt date(optional)

```

***

## Self Assessment

Generally good I think! I enjoyed this project, had fun coming up with an additional challenge to implement, and am happy with the result.

### Functionality

**4** - Everything seems to be working according to the interaction pattern, including the command line interfaces, for encryption, decryption, and cracking. In addition the password functionality described above adds another layer of functionality to the project.

### Object Oriented Programming

**3** - I have three small modules for calculating the shifts for each character for encryption, and I think my code is formatted pretty cleanly. I would like to clean up my runner files to have less code in them, and I think I have some redundant methods that I would like to keep DRYer. 

### Ruby Conventions and Mechanics

**3.5** - I docked myself half a point because I have one method in my encryptor.rb file and one in my decryptor.rb file that are each over 10 lines. They are pretty clear to me and I think would be made less clear with most shortening, but they are over 10 lines. I didn't end up using `.rotate` for determining key shift, and chose to use a combo of `.length` and `%`, which led to some longer methods.

### Test Driven Development

**3.5** - Generally was good on strictly following TDD on getting through the functionality of everything, but struggled a bit with incorporating TDD when I was refactoring the code to make use of modules and user input. SimpleCov is currently returning 100% coverage.

### Version Control

**4** - I do a lot of small commits and pull requests, well over the required number for this project. Generally good on using branches and pull requests to represent each piece of functionality.
