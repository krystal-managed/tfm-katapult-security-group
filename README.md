# Katapult Security Group Module

## Usage

```hcl
module "security_group" {
  source = "git@github.com:krystal-managed/tfm-katapult-security-group.git"

  name = "Security Group"
  vm_ids = ["vm-1234"]
  enable_web = false
  
  rules_in = [
    {
        ports = 3306
        targets = ["1.2.3.4/32"]
        notes = "SQL access for the ladz"
    },
    {
        protocol = "ICMP"
        targets = [
            "5.6.7.8/32",
            "5.4.3.2/32"
        ]
        notes = "Pingaling"
    }
  ]

  rules_out = [
    {
        ports = 25
        targets = ["10.11.12.13/32"]
        notes = "SMTP out"
    }
  ]
}
```

# Inputs

| Name            | Description                                                  | Type          | Default | Required |
|-----------------|--------------------------------------------------------------|---------------|---------|----------|
| `name`          | Name of security group                                       | `string`      |         | **Yes**  |
| `vm_ids`        | List of VM IDs to attach group to                            | `list(string)` |        | **Yes**  |
| `enable_web`    | Enable Web traffic (all ipv4/ipv6 http/https)                | `bool`        | `false` | No       |
| `enable_krystal` | Enable SSH access from Krystal hosts                        | `bool`        | `true`  | No       |
| `enable_zabbix` | Enable Zabbix access from Krystal hosts                      | `bool`        | `true`  | No       |
| `rules_in`      | Create bespoke inbound rules (see below table for more info) | `list`        | `false` | No       |
| `rules_out`     | Create bespoke outbound rules (see below table for more info) | `list`       | `false` | No       |

Common rules can be created automatically using the various `enable_*` variables listed above, for creating bespoke rules see below.

# Rules
When creating rules, use the following variables:
| Name             | Description                                                         | Type           | Default                | Required |
|------------------|---------------------------------------------------------------------|----------------|------------------------|----------|
| `notes`          | Description for rule being created                                  | `string`       |                        | **Yes**  |
| `ports`          | Specifies port(s)                                                   | `string`       | `"0"` (All ports)      | No       |
| `protocol`       | Specify protocol of the rule                                        | `string`       | `"TCP"`                | No       |
| `targets`        | IPs/address lists rule should be applied to                         | `list(string)` |                        | **Yes**  |

The module will by default allow all outbound traffic, this can be overwritten by using the rules_out variable.


