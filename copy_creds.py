# Author thejazzid@gmail.com

import configparser, os, sys

def update_default_profile(src_profile):
    """ Store credentials in ./aws/credentials for backward compatibility """
    config_path = os.path.abspath(os.path.expanduser("~/.aws/credentials"))
    config = configparser.RawConfigParser()
    config.read(config_path)
    try:
        config.remove_option("default","aws_security_token")
    except Exception:
        pass
    try:
        config.remove_option("default","aws_expiration")
    except Exception:
        pass

    # Look for the required profile
    if src_profile not in config:
        sys.exit("ERROR: Cannot find profile {} in ~/.aws/credentials".format(src_profile))

    source_profile = config[src_profile]
    profile = config["default"]
    profile["aws_access_key_id"] = source_profile["aws_access_key_id"]
    profile["aws_secret_access_key"] = source_profile["aws_secret_access_key"]
    profile["aws_session_token"] = source_profile["aws_session_token"]

    with open(config_path, "w") as cred_file:
        config.write(cred_file)

if __name__ == '__main__':
    args = sys.argv
    found_key = False
    for arg in args:
        if found_key:
            profile = arg
            break
        if arg == "--profile":
            found_key = True
    print("Updating profile Default with credentials from '{}' profile".format(profile))
    update_default_profile(profile)
    print("Done.")
