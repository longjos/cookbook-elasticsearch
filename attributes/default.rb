# Load settings from data bag 'elasticsearch/settings' -
#
settings = Chef::DataBagItem.load('elasticsearch', 'settings') rescue {}

# === VERSION ===
#
default.elasticsearch[:version]   = "0.19.4"
default.elasticsearch[:checksum] = "dfcfe4189e42b60b049f9b203799cf24c9c1581673eb2df96dda34a67372facd"

# === INDEX ===
#
default.elasticsearch[:index_auto_create_index] = true
default.elasticsearch[:index_mapper_dynamic]    = true

# === PATHS ===
#
default.elasticsearch[:dir]       = "/usr/local"
default.elasticsearch[:user]      = "elasticsearch"
default.elasticsearch[:conf_path] = "/usr/local/etc/elasticsearch"
default.elasticsearch[:data_path] = "/usr/local/var/data/elasticsearch"
default.elasticsearch[:log_path]  = "/usr/local/var/log/elasticsearch"
default.elasticsearch[:pid_path]  = "/usr/local/var/run/elasticsearch"

# === MEMORY ===
#
# Maximum amount of memory to use is automatically computed as 2/3 of total available memory.
# You may choose to configure it in your node configuration instead.
#
max_mem = "#{(node.memory.total.to_i - (node.memory.total.to_i/3) ) / 1024}m"
default.elasticsearch[:min_mem] = "128m"
default.elasticsearch[:max_mem] = max_mem

# === LIMITS ===
#
default.elasticsearch[:limits]  = {}
default.elasticsearch[:limits][:memlock] = 'unlimited'
default.elasticsearch[:limits][:nofile]  = '64000'

# === SETTINGS ===
#
default.elasticsearch[:node_name]      = node.name
default.elasticsearch[:cluster_name]   = ( settings['cluster_name'] || "elasticsearch" rescue "elasticsearch" )
default.elasticsearch[:index_shards]   = "5"
default.elasticsearch[:index_replicas] = "1"

# === PERSISTENCE ===
#
default.elasticsearch[:gateway][:type] = nil

# === VARIA ===
#
default.elasticsearch[:disable_delete_all_indices] = true
