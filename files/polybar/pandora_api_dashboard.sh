#!/usr/sbin/bash

PATH="/usr/bin:/usr/sbin"

_data_fetch() {
  TMPFILE=$(mktemp)
  curl 'https://console.pandora.galilee.fr/pandora_console/include/api.php?op=get&op2=tactical_view&return_type=csv&other=;&apipass=6ffIROy6mtxR3ecIJ5u2&user=gfriloux&pass=mu8eifaerieR8Leu3ies' >"${TMPFILE}" 2>/dev/null
  if [ -s "${TMPFILE}" ]; then
    mv "${TMPFILE}" "/tmp/pandora_dashboard.cache"
  fi
  rm -f "${TMPFILE}"
}

_data_cache() {
  if [ ! -e "/tmp/pandora_dashboard.cache" ]; then
    _data_fetch
  fi

  if [ $(find "/tmp/pandora_dashboard.cache" -not -newermt '-30 seconds' -print 2>/dev/null) ]; then
    _data_fetch
  fi
}

_critical_get() {
  cut -d';' -f 7 <"/tmp/pandora_dashboard.cache"
}

_good_get() {
  cut -d';' -f 4 <"/tmp/pandora_dashboard.cache"
}

_warning_get() {
  cut -d';' -f 6 <"/tmp/pandora_dashboard.cache"
}

_unknown_get() {
  cut -d';' -f 3 <"/tmp/pandora_dashboard.cache"
}

_data_cache

case "$1" in
  "critical")
    _critical_get
  ;;
  "good")
    _good_get
  ;;
  "warning")
    _warning_get
  ;;
  "unknown")
    _unknown_get
  ;;
esac
