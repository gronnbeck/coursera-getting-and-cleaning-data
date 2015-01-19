

html <- url("http://biostat.jhsph.edu/~jleek/contact.html")
con <- readLines(html)

for (i in c(10,20,30,100)) {
  print(nchar(con[i]))
}
