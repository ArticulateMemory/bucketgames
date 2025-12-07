# pyBucket Games
Host games on S3-compatible buckets. 

## Installation

### Prequisites

- Python, version 3.13 recommended (https://www.python.org/downloads/)
- uv (https://docs.astral.sh/uv/getting-started/installation/)
- git (optional)
- S3-compatible storage, such as Cloudflare R2
    - Alternatively, static site hosting with adequate storage and bandwidth
- A domain to access the site (see "Cloud Setup" section)

### Download or Clone the files

#### Option 1: Git Clone

-  Clone the repository `git clone https://github.com/ArticulateMemory/pybucketgames.git` 
    - Developers: use ssh to allow pushing
- Switch to the folder in the terminal with `cd pybucketgames`

#### Option 2: Download ZIP 

- Click the green "Code" button at the top of the GitHub page, and find the "Download ZIP" option. Download the ZIP file by clicking on it.
    - Alternatively, the ZIP file is available at: https://github.com/ArticulateMemory/pybucketgames/archive/refs/heads/main.zip
- Extract the ZIP file to an appropriate directory
- Open a terminal in the newly extracted "pybucketgames" directory

### Install

Prequisite packages will be automatically installed with uv before the first `uv run` command
- Create bucket: `uv run pybucketgames [bucket name] init`
- More commands `uv run pybucketgames --help`

## Add and Configure Games

- Add game: `uv run pybucketgames [bucket] add [game name]`
- Configure the game.toml file created in `pybucketgames/[bucket]/[game]/game.toml`
- Add screenshots for the game to `pybucketgames/[bucket]/[game]/screenshots`
- Add release downloads to a new folder `pybucketgames/[bucket]/[game]/[release name]`, e.g. `pybucketgames/my_bucket/my_game/1.0.1/`
- Add game cover image to `pybucketgames/[bucket]/[game]/cover.jpg` or `[...]/cover.png`

## Generate and Test Static Site
`uv run pybucketgames [bucket] generate --serve`

# Cloud Setup

If using Cloudflare R2, documentation can be found here: https://www.cloudflare.com/developer-platform/products/r2/

## S3-Compatible Storage

- Create a bucket for your games
- Generate an API key that can read and write to the bucket
- Add API credentials to `pybucketgames/[bucket]/credentials.toml`
- Enable public access and configure and add your domain
    - If you don't have a domain, you may need to purchase one, or you may be able to use the one assigned to the bucket, depending on the platform. 
    - If using CloudFlare R2, the domain will need to be added to your CloudFlare account first
- If using AWS S3, enable website hosting (https://docs.aws.amazon.com/AmazonS3/latest/userguide/EnableWebsiteHosting.html)
- (Recommended) Go to the billing and related sections of your dashboard and set any available limits, notifications, and settings to avoid unexpected charges

## Static Site (Not S3-Compatible)

If using site hosting that isn't S3-compatible, the `pybucketgames/[bucket]/_website` folder contents can be uploaded as-is.  
Please be sure to:

1. Run `uv run pybucketgames [bucket] generate` prior to upload
2. Ensure there is enough storage and bandwidth available on your hosting including for downloads
3. Ensure your hosting allows for your use-case

# Upload

`uv run pybucketgames [bucket] upload`


Once complete, the site will be available at the public bucket URL. You may have to navigate to `[public bucket URL]/index.html`.
