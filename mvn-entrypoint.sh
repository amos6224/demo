#! /bin/bash -eu

set -o pipefail

# Copy files from /usr/share/maven/ref into ${MAVEN_CONFIG}
# So the initial ~/.m2 is set with expected content.
# Don't override, as this is just a reference setup
copy_reference_file() {
  local root="${1}"
  local f="${2%/}"
  local logfile="${3}"
  local rel="${f/${root}/}" # path relative to /usr/share/maven/ref/
  echo "$f" >> "$logfile"
  echo " $f -> $rel" >> "$logfile"
  if [[ ! -e ${MAVEN_CONFIG}/${rel} || $f = *.override ]]
    then
        echo "copy $rel to ${MAVEN_CONFIG}" >> "$logfile"
          mkdir -p "${MAVEN_CONFIG}/$(dirname "${rel}")"
            cp -r "${f}" "${MAVEN_CONFIG}/${rel}";
            fi;
          }

          copy_reference_files() {
            local log="$MAVEN_CONFIG/copy_reference_file.log"
            touch "${log}" || (echo "Can not write to ${log}. Wrong volume permissions?" && exit 1)
            echo "--- Copying files at $(date)" >> "$log"
            find /usr/share/maven/ref/ -type f -exec bash -eu -c 'copy_reference_file /usr/share/maven/ref/ "$1" "$2"' _ {} "$log" \;
          }

          export -f copy_reference_file
          copy_reference_files

          exec "$@"
          Contact GitHub API Training Shop Blog About