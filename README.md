# pipe-mime-to-qlmanage

A simple utility to take single and multipart MIME messages from stdin and pipe them to macOS' `qlmanage` in order to display them.<sup>[1](#footnote1)</sup>

This utility can be used in conjunction with a text-based Mail User Agent, like [alot](https://github.com/pazz/alot), to display HTML and other multimedia emails.

## Installation

Not currently available via NPM! However, you can install roughly like so:

1. Clone this repo: `git clone https://github.com/earksiinni/pipe-mime-to-qlmanage.git`
2. Install dependencies (we assume that you have Node installed): `npm install`

Or, if you use [Nix](https://nixos.org), simply run `nix -f default.nix -iA package` inside your cloned directory.

## Example usage with alot

1. Open an HTML email inside alot.
2. While in thread view, pipe to the script: `pipeto /path/to/pipe-mime-to-qlmanage`

## Example usage with alot and SSH

If you're using alot on a remote machine via SSH, you can also pipe to your local computer via SSH:

1. Use remote forwarding to open a tunnel from your remote computer to your local computer's SSH port. An example entry in `~/.ssh/config` might look like: `RemoteForward 127.0.0.1:2222 127.0.0.1:22`
2. Create a script on your remote machine (example: `~/pipe-to-local`) to pipe data to back to your local computer:

```bash
#!/usr/bin/env bash
  
ssh -p 2222 127.0.0.1 /path/on/local/computer/to/pipe-mime-to-qlmanage
```

3. Make your pipe script executable: `chmod +x ~/pipe-to-local`
4. While in alot's thread view, pipe your message to the script: `pipeto ~/pipe-to-local`

The preview should open on your local computer, like magic.

---

<a name="footnote1"><sup>1</sup></a>: HTML is currently opened using the default browser due to a limitation in `qlmanage`, in which links are unclickable.
