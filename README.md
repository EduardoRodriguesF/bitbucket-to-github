# Bitbucket to Github migration

Created to migrate the `econverse-ag` workspace into [@EconverseAG](https://github.com/EconverseAG) organization.

Transfer every repostory in a given Bitbucket workspace to a defined Github organization.

## Usage

1. Download the repository either via git or its zipfile.

2. Create a file named `.repoignore` in the root of the repository and list the repostories name that you would like to ignore.
This file will also be used to keep track of the repositories that have already been transferred.

2. Assuming you already have Ruby and `bundle` in your machine, run the following command to install dependencies.
```bash
bundle
```

3. Then, execute the bash script `run.sh` using this command:
```bash
sh run.sh
```

Now watch the magic happening... and have a great migration!

### Disclaimer

This program uses the GitHub API to create a repository before pushing it to the new remote. However, it has a request limit that might get triggered if you have too many repositories.
If you start to see error messages in the command line, stop the execution with `Ctrl + C` and wait for about 20 minutes, then run the program again.

Thanks to the `.repoignore` file, all already migrated repositories will be skipped to save you some time in that case.

## Support

If you have any trouble using this program, feel free to [open an Issue](https://github.com/EduardoRodriguesF/bitbucket-to-github/issues/new), then I'll be glad to help :)
