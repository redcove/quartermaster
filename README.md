<h1 align="center">
  <br>
  Quartermaster
  <br>
</h1>
Useful scripts, notes, config files, tutorials, themes, and other resources.

## Notes
Notes on commands, services, or tasks that might come up but not very often so you may not know the commands off the top of your head.

- [403 Bypass](notes/403bypass.md): 403 bypass techniques.
- [Email](notes/email.md): Email server exploit techniques.
- [GPG](notes/gpg.md): Find exisiting or create new GPG keys.
- [Resources](notes/resources.md): List of resources to be sorted through at a later date.

## Scripts
Convience scripts that print results nicely on the terminal.

- [users.sh](scripts/users.sh): `./users.sh` - Lists all users and highlights the current user. (Requires Root)
- [revshell.sh](scripts/revshell.sh): `./revshell.sh <Host> <Port>` - `<Host>` is a valid IP address. `<Port>` is a valid port. Sends a reverse shell to the remote `host:port`.
- [403bypass.sh](scripts/403bypass.sh): `./403bypass.sh -u www.target.com/.htaccess` - Trys just under 250 bypasses. Generates a lot of traffic. May take a minute to run and only reports successful bypasses. It'll print `Finished` when done.
