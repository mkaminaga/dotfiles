#!/bin/bash
# 2020/04/30
# Mamoru Kaminaga
# Backup files under a git repository to google drive in case of HDD crash.

# Set your backup destination.
BACKUPDEST='/cygdrive/c/Users/Mamoru/Google ドライブ/dev'

function debug() {
  : # echo $*
}

function main() {
  # 0. Backup myself.
  if [[ $(diff "${BACKUPDEST}"/"${0##*/}" ${0}) != "" ]]; then
    cp ${0} "${BACKUPDEST}"
    echo "${0} ====>>>> ${BACKUPDEST}/${0##*/}"
  fi

  # 1. Check for cd.
  PRJPATH="$(pwd)"
  debug "${PRJPATH}"

  # 2. Check if cd is git repository.
  if [[ "$(git status |& grep fatal)" != "" ]]; then
    echo "ERROR: Not a git repository"
    exit 1
  fi

  # 3. Enumerate files managed by git.
  FILES=$(git ls-files | grep -v ./git/)
  debug "${FILES}"

  # 4. Create backup for each files.
  PRJPATHBACKUP="${BACKUPDEST}/$(basename ${PRJPATH})"
  debug "${PRJPATHBACKUP}"

  for f in ${FILES}; do
    DIRNAME="${PRJPATHBACKUP}"/"$(dirname ${f})"
    FILENAME="${DIRNAME}"/"$(basename ${f})"
    debug DIRNAME:"${DIRNAME}"
    debug FILENAME:"${FILENAME}"

    mkdir -p "${DIRNAME}"

    # 4.1. Copy modified file to backup directory.
    if [[ ! -e "${FILENAME}" ]] || \
      [[ $(diff "${f}" "${FILENAME}") != "" ]]; then
      cp "${f}" "${DIRNAME}"

      # Show progress.
      echo "${f} ====>>>> ${FILENAME}"
    fi
  done
}

main
