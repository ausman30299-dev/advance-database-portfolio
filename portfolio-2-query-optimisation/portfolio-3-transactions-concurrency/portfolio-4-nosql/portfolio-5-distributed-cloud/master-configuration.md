
# Master Server Configuration

In a real-world scenario, the Master server requires specific settings in its `my.ini` file to allow replication.

```ini
[mysqld]
server-id=1
log-bin=mysql-bin
binlog-format=ROW
