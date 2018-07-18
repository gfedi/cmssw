#!/bin/sh

# Pass in name and status
function die { echo $1: status $2 ;  exit $2; }

for file in ${CMSSW_BASE}/src/FWCore/PythonFramework/python/*.py
do
  bn=`basename $file`
  if [ "$bn" != "__init__.py" ]; then
     python "$file" || die "unit tests for $bn failed" $?
  fi
done

echo "running test_producer.py"
python ${LOCAL_TEST_DIR}/test_producer.py || die "test_producer.py failed"
