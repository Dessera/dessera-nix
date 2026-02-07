{
  vscode-marketplace,
  vscode-extensions,
  ...
}:

(with vscode-marketplace; [
  redhat.java
  vscjava.vscode-java-pack
  vscjava.vscode-java-test
  vscjava.vscode-maven
  vscjava.vscode-java-dependency
  vscjava.vscode-gradle
  fwcd.kotlin
  mathiasfrohlich.kotlin
  daplf.vscode-java-kotlin
])
++ (with vscode-extensions; [
  vscjava.vscode-java-debug
])
