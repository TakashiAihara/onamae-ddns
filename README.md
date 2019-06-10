# onamae-ddns

Update onamae.com DNS Record with expect command.

## Usage
```
bash onamae_update.sh [-u username] [-p password] [-h hostname] [-d domain] ipaddress"
```

## example 1

```
bash onamae_update.sh -u 0000000 -p 123456123456 -h www -d example.com 1.1.1.1
```

## example 2

```
bash onamae_update.sh -u 0000000 -p 123456123456 -d example.com 1.1.1.1
```

## example 3

```
bash onamae_update.sh -u 0000000 -p 123456123456 -d example.com `curl -s inet-ip.info`
```

please edit above command.


NOTE: Can't ADD record. Only update.
