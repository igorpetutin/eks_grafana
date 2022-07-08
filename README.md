# eks_grafana
Grafana Service


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| grafana.base | 1.22.0 |
| helm | ~> 2.0 |
| terraform | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| grafana\_admin\_password | Default admin password for Grafana admin user | `string` | `"ThisIsDefaultPassword"` | no |
| grafana\_admin\_user | Default admin user for Grafana | `string` | `"admin"` | no |
| grafana\_url | Main domain | `string` | `"https://grafana-sb.geocomply.net"` | no |
| monitoring\_namespace | Kubernetes namespace to deploy | `string` | `"monitoring"` | no |

## Outputs

No output.


## Module development

Install git pre-commit hook from TF Modules CI.

TF Modules CI includes `pre-commit` hook for automatic documentation generation, fmt check etc.

### Install for Linux/MacOS

```shell script
mkdir -p .git/hooks && docker run --rm -e HOST_OS=${OSTYPE} ghcr.io/geocomply/tf-modules-ci > .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
```

### Install for Windows

Run the following script in `cmd` terminal.

```shell script
mkdir ".git\hooks" 2>NUL & docker run --rm -e HOST_OS=win ghcr.io/geocomply/tf-modules-ci > .git\hooks\pre-commit
```
_Note: `PowerShell` and `git-bash` are not supported._


#### Check Docker settings for Windows

Allow `File sharing` for drive(s) with your code in `Docker` settings.

[Read more](https://docs.microsoft.com/en-us/visualstudio/containers/troubleshooting-docker-errors?view=vs-2019)

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

