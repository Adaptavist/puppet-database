# Database

Creates and configures databases on the server based on database type and config passed in hiera.

## Usage

In hiera config provide database type and options per host. E.g.

```

database::type: 'mysql/postgres'

For mysql in host hash:

 database::conf:
  db:
    host:     'localhost'
    collate:  'utf8_bin'
    charset:  'utf8'
    user:     'user'
    password: 'pass'
    name:     'db'
 
For postgres:
 
 database::conf:
   postgresql_db:
     user:     'user'
     password: 'pass'

```

