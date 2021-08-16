# calibre

![Version: 1.4.3](https://img.shields.io/badge/Version-1.4.3-informational?style=flat-square) ![AppVersion: auto](https://img.shields.io/badge/AppVersion-auto-informational?style=flat-square)

Calibre is a powerful and easy to use e-book manager.

**Homepage:** <https://github.com/truechartsapps/tree/master/charts/incubator/calibre>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| truecharts | info@truecharts.org | https://truecharts.org |

## Source Code

* <https://hub.docker.com/r/linuxserver/calibre/>
* <https://github.com/kovidgoyal/calibre/>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://truecharts.org | common | 6.8.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://docs.linuxserver.io/images/docker-calibre#environment-variables-e) for more details. |
| env.CLI_ARGS | string | `nil` | Optionally pass cli start arguments to calibre. |
| env.GUAC_PASS | string | `nil` | Password's md5 hash for the calibre gui |
| env.GUAC_USER | string | `nil` | Username for the calibre gui |
| env.PGID | string | `"1001"` | Specify the group ID the application will run as |
| env.PUID | string | `"1001"` | Specify the user ID the application will run as |
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UMASK_SET | string | `"022"` | for umask setting of Calibre, default if left unset is 022. |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"linuxserver/calibre"` | image repository |
| image.tag | string | `"version-v5.24.0"` | image tag |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)