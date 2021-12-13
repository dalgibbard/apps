{{/*
The NordVPN sidecar container to be inserted.
*/}}
{{- define "common.addon.nordvpn.container" -}}
name: nordvpn
image: "{{ .Values.nordvpnImage.repository }}:{{ .Values.nordvpnImage.tag }}"
imagePullPolicy: {{ .Values.nordvpnImage.pullPolicy }}
securityContext:
  runAsUser: 568
  runAsGroup: 568
  capabilities:
    add:
      - NET_ADMIN
      - SYS_MODULE
env:
  - name: SEPARATOR
    value: ";"
{{- range $envList := .Values.addons.vpn.envList }}
  {{- if and $envList.name $envList.value }}
  - name: {{ $envList.name }}
    value: {{ $envList.value | quote }}
  {{- else }}
  {{- fail "Please specify name/value for VPN environment variable" }}
  {{- end }}
{{- end}}

{{- with .Values.addons.vpn.env }}
{{- range $k, $v := . }}
  - name: {{ $k }}
    value: {{ $v | quote }}
{{- end }}
{{- end }}

{{- if .Values.addons.vpn.killSwitch }}
  - name: KILLSWITCH
    value: "true"
  {{- $excludednetworksv4 := "172.16.0.0/12"}}
  {{- range .Values.addons.vpn.excludedNetworks_IPv4 }}
    {{- $excludednetworksv4 =  ( printf "%v;%v" $excludednetworksv4 . ) }}
  {{- end}}
  - name: NETWORK
    value: {{ $excludednetworksv4 | quote }}
{{- if .Values.addons.vpn.excludedNetworks_IPv6 }}
  {{- $excludednetworksv6 := ""}}
  {{- range .Values.addons.vpn.excludedNetworks_IPv4 }}
    {{- $excludednetworksv6 =  ( printf "%v;%v" $excludednetworksv6 . ) }}
  {{- end}}
  - name: KILLSWITCH_EXCLUDEDNETWORKS_IPV6
    value: {{ .Values.addons.vpn.excludedNetworks_IPv6 | quote }}
{{- end }}
{{- end }}
  - name: TECHNOLOGY
    value: {{ .Values.addons.vpn.nordvpn.technology | quote }}
  - name: CONNECT
    value: {{ .Values.addons.vpn.nordvpn.connect | quote }}

{{- if or ( .Values.addons.vpn.nordvpn.username ) ( .Values.addons.vpn.nordvpn.password ) }}
envFrom:
  - secretRef:
      name: {{ include "common.names.fullname" . }}-nordvpn
{{- end }}
volumeMounts:
  - mountPath: {{ .Values.persistence.shared.mountPath }}
    name: shared
{{- with .Values.addons.vpn.livenessProbe }}
livenessProbe:
  {{- toYaml . | nindent 2 }}
{{- end -}}
{{- with .Values.addons.vpn.resources }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
