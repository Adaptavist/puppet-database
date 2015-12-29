# 
# Creates database based on config provided. By default creates mysql database. For usage see example...
# 
# Params:
# type: type of database, default is mysql
# conf: parameters passed to create database, see example
# 
# Example: Within host hash define configuration:
# For mysql:
# database::conf:
#  jira_db:
#   host:     'localhost'
#   collate:  'utf8_bin'
#   charset:  'utf8'
#   user:     'jirauser'
#   password: 'jirapass'
#   name:     'jira_db'
# 
# For postgres:
# 
# database::conf:
#  postgresql_db:
#   user:     'jirauser'
#   password: 'jirapass'
# 
class database(
    $type,
    $conf = {},
    ){

    if $::host != undef {
        $custom_conf = $host["${name}::conf"]
        $config = $custom_conf ? {
            undef => $conf,
            default => merge($conf, $custom_conf)
        }
    } else {
        $config = $conf
    }

    case $type {
        'mysql': {
            include mysqlconfig
            create_resources('mysql::db', $config)
        }
        'postgres': {
            include postgresconfig
            create_resources('postgresql::server::db', $config)
        }
        default: {
            fail('For now we support only mysql and postgres.')
        }
    }
}
