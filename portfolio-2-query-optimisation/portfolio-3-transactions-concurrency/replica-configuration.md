
#### 2. `replica-configuration.md`
Copy and paste this text. It shows you know how to configure the Replica:
```markdown
# Replica Server Configuration

The Replica server requires its own unique `server-id` and relay logs in its `my.ini` file.

```ini
[mysqld]
server-id=2
relay-log=relay-bin
log-bin=mysql-bin
port=3307
