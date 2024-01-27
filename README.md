# Typst notes

some random staff to make writing typst paper easier

* `pandoc_tpl.typ`

Make pandoc convert ipynb to typst nicer

```bash
pandoc -t typst --template=pandoc_tpl.typ --extract-media ./media test.ipynb -o test.typ
```
