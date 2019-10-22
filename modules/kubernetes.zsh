#!/usr/bin/env zsh

alien_k8_env(){
  if [[ ${VAULTED_ENV} != "" ]]; then
    echo -ne "v:$VAULTED_ENV "
  fi
}

alien_k8_session(){
  if type datediff >/dev/null 2>&1 ; then
    if [[ ${VAULTED_ENV_EXPIRATION} != "" ]]; then
      echo -ne `datediff $VAULTED_ENV_EXPIRATION now -f "(%Mm%Ss)"`
    fi
  fi
}
