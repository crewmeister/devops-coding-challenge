{{- define "crewmeister.name" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{- define "crewmeister.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{- define "crewmeister.serviceAccountName" -}}
{{- default .Release.Name .Values.serviceAccountName -}}
{{- end -}}

{{- define "crewmeister.labels" -}}
app.kubernetes.io/name: {{ include "crewmeister.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "crewmeister.chart" . }}
{{- end }}

{{- define "crewmeister.selectorLabels" -}}
app.kubernetes.io/name: {{ include "crewmeister.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "crewmeister.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
