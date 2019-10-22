#!/usr/bin/env zsh

alien_vaulted_env(){
  if [[ ${VAULTED_ENV} != "" ]]; then
    [[ -z "${VAULTED_CLOUD_ROLE_SYM}" ]] && VAULTED_CLOUD_ROLE_SYM=
    echo -ne "${VAULTED_CLOUD_ROLE_SYM}  ${VAULTED_ENV} "
  fi
}

alien_vaulted_session(){
  if type datediff >/dev/null 2>&1 ; then
    if [[ "${VAULTED_ENV_EXPIRATION}" != "" ]]; then
      [[ -z "${VAULTED_EXPIRED_COLOR_GOOD}" ]] && VAULTED_EXPIRED_COLOR_GOOD=green
      [[ -z "${VAULTED_EXPIRED_COLOR_WARN}" ]] && VAULTED_EXPIRED_COLOR_WARN=yellow
      [[ -z "${VAULTED_EXPIRED_COLOR_EXPR}" ]] && VAULTED_EXPIRED_COLOR_EXPR=red

      [[ -z "${VAULTED_EXPIRED_SYM1}" ]] && VAULTED_EXPIRED_SYM1=
      [[ -z "${VAULTED_EXPIRED_SYM2}" ]] && VAULTED_EXPIRED_SYM2=
      [[ -z "${VAULTED_EXPIRED_SYM3}" ]] && VAULTED_EXPIRED_SYM3=
      [[ -z "${VAULTED_EXPIRED_SYM4}" ]] && VAULTED_EXPIRED_SYM4=

      __time=`datediff $VAULTED_ENV_EXPIRATION now -f "%M"`
      if [[ "$__time" -le "-20" ]]; then
        echo -ne "%F{$VAULTED_EXPIRED_COLOR_GOOD}${VAULTED_EXPIRED_SYM1}%f "
      elif [[ "$__time" -le "-10" ]]; then
        echo -ne "%F{$VAULTED_EXPIRED_COLOR_GOOD}${VAULTED_EXPIRED_SYM2}%f "
      elif [[ "$__time" -le "-1" ]]; then
        echo -ne "%F{$VAULTED_EXPIRED_COLOR_WARN}${VAULTED_EXPIRED_SYM3}%f "
      else
        echo -ne "%F{$VAULTED_EXPIRED_COLOR_EXPR}${VAULTED_EXPIRED_SYM4}%f "
      fi
    fi
  fi
}

alien_vaulted_string(){
  alien_vaulted_env
  alien_vaulted_session
}
