BASE=$1 # src/codec
TARGET=$2 # codecs
for f in $(find ../${BASE}/*.rs | grep -v "/test.rs$" | sed -e "s;../${BASE}/;;g" -e 's;.rs$;;')
do
  name=$(echo ${f} | sed -e 's/_/-/g')
  file="../${BASE}/${f}.rs"
  doc_name=$(echo ${f} | sed -e 's;^.*/;;g' -e 's/_/-/g')
  doc_file="${TARGET}/${doc_name}.md"
  echo "${doc_file}"
  echo "# ${name}\n" > "${doc_file}"
  cat "${file}" | grep '^//!' | sed -e 's;^//! ;;g' -e 's;^//!;;g' >> "${doc_file}"
done