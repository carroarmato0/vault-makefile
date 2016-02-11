## Required Options

# Configures the storage backend where Vault data is stored.

backend "file" {
  path = "/var/lib/vault"
}

# Listener, how Vault will listen and server requests

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = 1
  #tls_cert_file =
  #tls_key_file =
  #tls_min_version = "tls12"
}


## Optional Configuration

# If true, this will disable the read cache used by the physical storage subsystem. This will very significantly impact performance.
#disable_cache = true

# If true, this will disable the server from executing the mlock syscall to prevent memory from being swapped to disk. This is not recommended in production.
#disable_mlock = true

# Configures the default lease duration for tokens and secrets, specified in hours. Default value is 30 days. This value cannot be larger than max_lease_ttl.
#default_lease_ttl = 

# Configures the maximum possible lease duration for tokens and secrets, specified in hours. Default value is 30 days.
#max_lease_ttl = 
