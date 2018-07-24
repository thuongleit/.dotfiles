# JAVA_HOME PATH for java8
JAVA8_HOME=/Library/Java/JavaVirtualMachines/"$(cd /Library/Java/JavaVirtualMachines; ls | grep jdk1.8)"/Contents/Home

# Export to use java8 to build Android project 
export JAVA_HOME=$JAVA8_HOME
