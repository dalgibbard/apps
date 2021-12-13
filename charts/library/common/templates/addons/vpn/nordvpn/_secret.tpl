{{/*
The NordVPN credentials secrets to be included.
*/}}
{{- define "common.addon.nordvpn.secret" -}}
---
apiVersion: v1
kind: Secret
metadata:
  name: {{ include "common.names.fullname" $ }}-nordvpn
  labels:
  {{- include "common.labels" $ | nindent 4 }}
data:
  USER: {{ ( printf "%v" .Values.addons.vpn.nordvpn.username | b64enc }}
  PASS: {{ ( printf "%v" .Values.addons.vpn.nordvpn.password | b64enc }}
{{- end -}}
