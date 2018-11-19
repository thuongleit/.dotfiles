# JAVA_HOME PATH for java8
JAVA8_HOME=/Library/Java/JavaVirtualMachines/"$(cd /Library/Java/JavaVirtualMachines || return; echo *jdk1.8*)"/Contents/Home

export JAVA_HOME=$JAVA8_HOME
export PATH=$JAVA_HOME:$PATH
